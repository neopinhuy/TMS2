using Common.Clients;
using Common.Extensions;
using Components;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.TruckManagement
{
    public partial class TruckDetail : PopupComponent
    {
        public override string Title { get; set; } = "Truck Detail";
        public Truck Truck { get; set; }
        private readonly object _observableTruck;

        public TruckDetail()
        {
            _observableTruck = new object();
        }

        public override async Task RenderAsync()
        {
            await base.RenderAsync();
            // Load UserInterface here
            var uiClient = new BaseClient<UserInterface>();
            var uiControls = await uiClient.GetList("$expand=ComponentGroup,Field&$filter=Field/Entity/Name eq 'Truck'");
            var groups = uiControls.DistinctBy(x => x.ComponentGroupId)
                .Select(x => x.ComponentGroup).ToDictionary(x => x.Id);
            var componentType = _masterData.ComponentType.ToDictionary(x => x.Id);
            var field = _masterData.Field.ToDictionary(x => x.Id);
            var entity = _masterData.Entity.ToDictionary(x => x.Id);
            uiControls.ForEach(ui =>
            {
                if (ui.ComponentGroupId.HasValue)
                {
                    groups[ui.ComponentGroupId.Value].UserInterface.Add(ui);
                }
                ui.ComponentType = componentType[ui.ComponentTypeId];
                if (ui.FieldId.HasValue)
                {
                    ui.Field = field[ui.FieldId.Value];
                    ui.Field.Reference = ui.Field.ReferenceId.HasValue ? entity[ui.Field.ReferenceId.Value] : null;
                }
            });

             // Render group
            groups.Values.ToList().ForEach(async group =>
            {
                var column = 0;
                Html.Instance.Div.Hidden(group.Hidden).ClassName(group.ClassName).Table.ClassName("entity-detail").TBody.TRow.Render();
                foreach(var ui in group.UserInterface)
                {
                    if (!ui.Visibility) continue;
                    if (ui.ComponentType.Name == "Input")
                    {
                        _observableTruck[ui.Field.FieldName] = new Observable<string>(Truck[ui.Field.FieldName]?.ToString());
                        Html.Instance
                            .TData.Label.Text(ui.Field.ShortDesc).EndOf(ElementType.td)
                            .TData.Input.Value((Observable<string>)_observableTruck[ui.Field.FieldName])
                            .EndOf(ElementType.td);
                    }
                    if (ui.ComponentType.Name == "Dropdown")
                    {
                        _observableTruck[ui.Field.FieldName] = new Observable<int?>((int?)Truck[ui.Field.FieldName]);
                        Html.Instance
                            .TData.Label.Text(ui.Field.ShortDesc).EndOf(ElementType.td)
                            .TData.Render();
                        var searchEntry = new SearchEntry((Observable<int?>)_observableTruck[ui.Field.FieldName], 
                            ui.Field.Reference.Name, ui.DataSourceFilter);
                        await searchEntry.RenderAsync();
                        Html.Instance.EndOf(ElementType.td);
                    }
                    column += ui.Column ?? 0;
                    if (column == group.Column)
                    {
                        column = 0;
                        Html.Instance.EndOf(ElementType.tr).TRow.Render();
                    }
                }
            });
        }
    }
}
