using Common.Clients;
using Common.Extensions;
using MVVM;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components.Forms
{
    public partial class EditForm<T> : PopupComponent
    {
        public override string Title { get; set; } = $"{typeof(T).Name} Detail";
        public T Data { get; set; }
        private readonly object _observableTruck;

        public EditForm()
        {
            _observableTruck = new object();
        }

        public override async Task RenderAsync()
        {
            await base.RenderAsync();
            // Load UserInterface here
            var componentGroup = await Client<ComponentGroup>.Instance.GetList($"$expand=UserInterface&$filter=Feature/Name eq '{Title}'");
            var componentType = _masterData.ComponentType.ToDictionary(x => x.Id);
            var field = _masterData.Field.ToDictionary(x => x.Id);
            var entity = _masterData.Entity.ToDictionary(x => x.Id);
            componentGroup.SelectMany(x => x.UserInterface).ForEach(ui =>
            {
                ui.ComponentType = componentType[ui.ComponentTypeId];
                if (ui.FieldId.HasValue)
                {
                    ui.Field = field[ui.FieldId.Value];
                    ui.Field.Reference = ui.Field.ReferenceId.HasValue ? entity[ui.Field.ReferenceId.Value] : null;
                }
            });

            // Render group
            componentGroup.ForEach(async group =>
            {
                var column = 0;
                Html.Instance.Div.Hidden(group.Hidden).ClassName(group.ClassName).Table.ClassName("entity-detail").TBody.TRow.Render();
                foreach(var ui in group.UserInterface)
                {
                    if (!ui.Visibility) continue;
                    Html.Instance.TData.Label.Text(ui.Field.ShortDesc)
                        .EndOf(ElementType.td).TData.Render();
                    if (ui.ComponentType.Name == "Input")
                    {
                        _observableTruck[ui.Field.FieldName] = new Observable<string>(Data[ui.Field.FieldName]?.ToString());
                        Html.Instance.Input.Attr("data-role", "input").ClassName("input-small")
                            .Value((Observable<string>)_observableTruck[ui.Field.FieldName]);
                    }
                    if (ui.ComponentType.Name == "Dropdown")
                    {
                        _observableTruck[ui.Field.FieldName] = new Observable<int?>((int?)Data[ui.Field.FieldName]);
                        var searchEntry = new SearchEntry((Observable<int?>)_observableTruck[ui.Field.FieldName], 
                            ui.Field.Reference.Name, ui.DataSourceFilter);
                        await searchEntry.RenderAsync();
                    }
                    if (ui.ComponentType.Name == "Datepicker")
                    {
                        var dateTime = new Observable<DateTime?>((DateTime?)Data[ui.Field.FieldName]);
                        _observableTruck[ui.Field.FieldName] = dateTime;
                        Html.Instance.SmallDatePicker(dateTime);
                    }
                    if (ui.ComponentType.Name == "Checkbox")
                    {
                        var @checked = new Observable<bool?>((bool?)Data[ui.Field.FieldName]);
                        _observableTruck[ui.Field.FieldName] = @checked;
                        Html.Instance.SmallCheckbox(string.Empty, @checked);
                    }
                    Html.Instance.EndOf(ElementType.td);
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
