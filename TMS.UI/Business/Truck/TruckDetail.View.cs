using Common.Clients;
using Common.Extensions;
using Components;
using MVVM;
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
            var controls = await uiClient.GetList("$expand=ComponentType,ComponentGroup,Field&$filter=Field/Entity/Name eq 'Truck'");
            var groups = controls.DistinctBy(x => x.ComponentGroupId)
                .Select(x => x.ComponentGroup).ToDictionary(x => x.Id);
            controls.ForEach(control =>
            {
                if (control.ComponentGroupId is null) return;
                groups[control.ComponentGroupId.Value].UserInterface.Add(control);
            });

             // Render group
            groups.Values.ToList().ForEach(group =>
            {
                var column = 0;
                Html.Instance.Div.Hidden(group.Hidden).ClassName(group.ClassName).Table.TBody.TRow.Render();
                foreach(var control in group.UserInterface)
                {
                    if (column == group.Column) Html.Instance.EndOf(ElementType.tr).TRow.Render();
                    if (control.ComponentType.Name == "Input")
                    {
                        _observableTruck[control.Field.FieldName] = new Observable<string>(Truck[control.Field.FieldName]?.ToString());
                        if (!control.Visibility) continue;
                        Html.Instance
                            .TData.Label.Text(control.Field.ShortDesc).EndOf(ElementType.td)
                            .TData.Input.Value((Observable<string>)_observableTruck[control.Field.FieldName])
                            .EndOf(ElementType.td);
                    }
                    column += 2;
                }
            });
        }
    }
}
