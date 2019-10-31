using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using static Retyped.jquery_maskmoney.jQueryMaskMoney;
using ElementType = MVVM.ElementType;

namespace Components.Forms
{
    public partial class EditForm<T> : PopupComponent
    {
        public override string Title { get; set; } = $"{typeof(T).Name} Detail";
        public T Data { get; set; }
        protected readonly object _observableTruck;

        public EditForm()
        {
            _observableTruck = new object();
        }

        public virtual async Task Save()
        {
            var client = new Client<T>();
            var data = await client.PutAsync(Data);
            if (data != null)
            {
                Toast.Create(new ToastOptions
                {
                    clsToast = "success", 
                    timeout = 2000, 
                    Message = $"Update {typeof(T).Name} succeeded", 
                    showTop = true
                });
            }
        }

        private List<ComponentGroup> BuildTree(IEnumerable<ComponentGroup> componentGroup)
        {
            var dic = componentGroup.ToDictionary(x => x.Id);
            ComponentGroup parent;
            foreach (var item in componentGroup)
            {
                if (item.ParentId is null) continue;
                parent = dic[item.ParentId.Value];
                if (parent.InverseParent == null) parent.InverseParent = new List<ComponentGroup>();
                parent.InverseParent.Add(item);
            }
            return componentGroup.Where(x => x.ParentId == null).ToList();
        }

        public override async Task RenderAsync()
        {
            base.RenderAsync();
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
            componentGroup = BuildTree(componentGroup);
            RenderGroup(componentGroup);
        }

        private void RenderGroup(List<ComponentGroup> componentGroup)
        {
            foreach (var group in componentGroup)
            {
                if (group.IsTab)
                {
                    Html.Instance.Tab().Id("feature_" + group.FeatureId)
                        .TabItem(group.Name, "group_" + group.Id, true).EndOf(ElementType.ul)
                        .TabContent();
                }
                Html.Instance.Panel(!group.IsTab ? group.Name : string.Empty).Id("group_" + group.Id)
                    .ClassName("group").ClassName(group.ClassName)
                    .ClassName(group.IsTab ? "tab" : string.Empty).Hidden(group.Hidden)
                    .Width(group.Width).Style(group.Style ?? string.Empty);
                if (group.InverseParent != null && group.InverseParent.Any())
                {
                    RenderGroup(group.InverseParent.ToList());
                }
                if (!group.UserInterface.Any()) return;
                Html.Instance.Table.ClassName("entity-detail").TBody.TRow.Render();
                RenderComponent(group);
                Html.Instance.EndOf(".group");
            }
        }

        private void RenderComponent(ComponentGroup group)
        {
            var column = 0;
            foreach (var ui in group.UserInterface)
            {
                if (!ui.Visibility) continue;
                if (ui.ShowLabel) Html.Instance.TData.Label.Text(ui.Field.ShortDesc)
                    .EndOf(ElementType.td).TData.Render();
                else Html.Instance.TData.ClassName("text-left").Style("padding-left: 0;").Render();
                if (ui.ComponentType.Name == "Input")
                {
                    RenderInput(ui);
                }
                else if (ui.ComponentType.Name == "Dropdown")
                {
                    RenderDropdown(ui);
                }
                else if (ui.ComponentType.Name == "Datepicker")
                {
                    RenderDatepicker(ui);
                }
                else if (ui.ComponentType.Name == "Checkbox")
                {
                    RenderCheckbox(ui);
                }
                else if (ui.ComponentType.Name == "Image")
                {
                    RenderImage(ui);
                }
                else if (ui.ComponentType.Name == "Button")
                {
                    RenderButton(ui);
                }
                else if (ui.ComponentType.Name == "Number")
                {
                    RenderNumberInput(ui);
                }
                Html.Instance.Attr("data-field", ui.FieldId?.ToString()).EndOf(ElementType.td);
                column += ui.Column ?? 0;
                if (column == group.Column)
                {
                    column = 0;
                    Html.Instance.EndOf(ElementType.tr).TRow.Render();
                }
            }
        }

        private void RenderNumberInput(UserInterface ui)
        {
            var isNumber = ui.Field.ColumnType == "float" || ui.Field.ColumnType.Contains("decimal");
            var parsed = decimal.TryParse(Data[ui.Field.FieldName]?.ToString(), out decimal parsedVal);
            if (!parsed)
            {
                Html.Instance.EndOf(ElementType.td);
                return;
            }
            var separator = CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator;
            var groupSeparator = CultureInfo.CurrentCulture.NumberFormat.NumberGroupSeparator;
            var value = new Observable<decimal?>(parsedVal);
            _observableTruck[ui.Field.FieldName] = value;
            value.Subscribe(arg => Data[ui.Field.FieldName] = arg.NewData);
            Html.Instance.MaskMoney(value, new Options
            {
                thousands = isNumber ? groupSeparator : string.Empty,
                @decimal = separator,
                precision = isNumber ? ui.Precision : 0
            });
        }

        private void RenderButton(UserInterface ui)
        {
            Html.Instance.Button(ui.Label, ui.ClassName, ui.Icon)
                .Attr("data-id", ui.Id.ToString())
                .Event(EventType.Click, () =>
                {
                    ProcessEvents(ui);
                });
            //HotKeysExtension.HotKey(ui.HotKey, () =>
            //{
            //    ProcessEvents(ui);
            //});
        }

        private void ProcessEvents(UserInterface ui)
        {
            try
            {
                if (this[ui.Events] is Func<Task> asyncF) asyncF.Bind(this).Invoke();
                if (this[ui.Events] is System.Action syncF) syncF.Invoke();
            }
            catch (Exception ex)
            {
                if (ex.Message != "Cannot read property 'isCompleted' of undefined")
                    throw;
            }
        }

        private void RenderImage(UserInterface ui)
        {
            var value = new Observable<string>(Data[ui.Field.FieldName]?.ToString());
            _observableTruck[ui.Field.FieldName] = value;
            value.Subscribe(arg => Data[ui.Field.FieldName] = arg.NewData);
            var uploader = new ImageUploader(value, ui);
            uploader.RenderAsync();
        }

        private void RenderCheckbox(UserInterface ui)
        {
            var value = new Observable<bool?>((bool?)Data[ui.Field.FieldName]);
            _observableTruck[ui.Field.FieldName] = value;
            value.Subscribe(arg => Data[ui.Field.FieldName] = arg.NewData);
            Html.Instance.SmallCheckbox(string.Empty, value);
        }

        private void RenderDatepicker(UserInterface ui)
        {
            var value = new Observable<DateTime?>((DateTime?)Data[ui.Field.FieldName]);
            _observableTruck[ui.Field.FieldName] = value;
            value.Subscribe(arg => Data[ui.Field.FieldName] = arg.NewData);
            Html.Instance.SmallDatePicker(value);
        }

        private void RenderDropdown(UserInterface ui)
        {
            var value = new Observable<int?>((int?)Data[ui.Field.FieldName]);
            _observableTruck[ui.Field.FieldName] = value;
            value.Subscribe(arg => Data[ui.Field.FieldName] = arg.NewData);
            var searchEntry = new SearchEntry(value, ui);
            searchEntry.RenderAsync();
        }

        private void RenderInput(UserInterface ui)
        {
            var value = new Observable<string>(Data[ui.Field.FieldName]?.ToString());
            _observableTruck[ui.Field.FieldName] = value;
            value.Subscribe(arg => Data[ui.Field.FieldName] = arg.NewData);
            Html.Instance.Input.Attr("data-role", "input").ClassName("input-small")
                .Value((Observable<string>)_observableTruck[ui.Field.FieldName]);
        }
    }
}
