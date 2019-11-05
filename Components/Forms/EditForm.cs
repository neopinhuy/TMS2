﻿using Bridge.Html5;
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
    public partial class EditForm<T> : Component
    {
        public virtual string Title { get; set; } = $"{typeof(T).Name} Detail";
        public T Entity { get; set; }
        public ObservableArray<T> ParentEntity { get; set; }
        public List<ObservableArray<object>> CurrentEntities { get; set; }

        public EditForm()
        {
            CurrentEntities = new List<ObservableArray<object>>();
        }

        public async Task Create(T entity)
        {
            var entities = CurrentEntities.First(x => x.GetType().GetGenericArguments().First() == typeof(T));
            var editor = new PopupEditor<T>
            {
                Entity = entity,
                ParentEntity = entities.As<ObservableArray<T>>(),
            };
            await editor.RenderAsync();
        }

        // GridView shall call this method
        public async Task Edit(T entity, ObservableArray<T> entityList)
        {
            var editor = new PopupEditor<T>
            {
                Entity = entity,
                ParentEntity = entityList,
            };
            await editor.RenderAsync();
        }

        public virtual async Task Save()
        {
            var client = new Client<T>();
            if (Entity != null && Entity["Id"].As<int>() == 0)
            {
                if (Entity["Active"] != null) Entity["Active"] = true;
                var data = await client.CreateAsync(Entity);
                if (data != null)
                {
                    Toast.Create(new ToastOptions
                    {
                        clsToast = "success",
                        timeout = 2000,
                        Message = $"Create {typeof(T).Name} succeeded",
                        showTop = true
                    });
                }
                Entity = data;
                ParentEntity.Add(Entity);
            }
            else
            {
                var data = await client.UpdateAsync(Entity);
                if (data != null)
                {
                    Toast.Create(new ToastOptions
                    {
                        clsToast = "success",
                        timeout = 2000,
                        Message = $"Update {typeof(T).Name} succeeded",
                        showTop = true
                    });
                    // Update data back to observable
                    var index = Array.IndexOf(ParentEntity.Data, Entity);
                    ParentEntity.Update(Entity, index);
                }
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
            foreach (var item in componentGroup)
            {
                if (item.UserInterface == null || !item.UserInterface.Any()) continue;
                foreach (var ui in item.UserInterface)
                {
                    ui.ComponentGroup = item;
                }
            }
            return componentGroup.Where(x => x.ParentId == null).ToList();
        }

        public override async Task RenderAsync()
        {
            var componentGroup = await Client<ComponentGroup>.Instance.GetList($"$expand=UserInterface($expand=Reference)&$filter=Feature/Name eq '{Title}'");
            componentGroup = BuildTree(componentGroup);
            RenderGroup(componentGroup);
        }

        private void RenderGroup(List<ComponentGroup> componentGroup)
        {
            foreach (var group in componentGroup.OrderBy(x => x.Order))
            {
                if (group.IsTab)
                {
                    var tab = Document.GetElementById("feature_" + group.FeatureId);
                    if (tab is null)
                    {
                        Html.Instance.Tab().Id("feature_" + group.FeatureId)
                            .TabItem(group.Name, "group_" + group.Id, true).EndOf(ElementType.ul)
                            .TabContent().Id("feature_content_" + group.FeatureId);
                    }
                    else
                    {
                        Html.Take(tab).TabItem(group.Name, "group_" + group.Id).EndOf(ElementType.ul);
                        Html.Take("#feature_content_" + group.FeatureId);
                    }
                }
                Html.Instance.Panel(!group.IsTab ? group.Name : string.Empty).Id("group_" + group.Id)
                    .ClassName("group").ClassName(group.ClassName)
                    .ClassName(group.IsTab ? "tab" : string.Empty).Hidden(group.Hidden)
                    .Width(group.Width).Style(group.Style ?? string.Empty);
                if (group.InverseParent != null && group.InverseParent.Any())
                {
                    RenderGroup(group.InverseParent.ToList());
                }
                Html.Instance.Table.ClassName("ui-layout").TBody.TRow.Render();
                RenderComponent(group);
                Html.Instance.EndOf(".group");
            }
        }

        private void RenderComponent(ComponentGroup group)
        {
            var column = 0;
            foreach (var ui in group.UserInterface.OrderBy(x => x.Order))
            {
                if (!ui.Visibility) continue;
                if (ui.ShowLabel) Html.Instance.TData.Label.Text(ui.Label)
                    .EndOf(ElementType.td).TData.Render();
                else Html.Instance.TData.ClassName("text-left").Style("padding-left: 0;").Render();
                if (ui.Style.HasAnyChar()) Html.Instance.Style(ui.Style);
                switch (ui.ComponentType.Trim())
                {
                    case "Input":
                        RenderInput(ui);
                        break;
                    case "Dropdown":
                        RenderDropdown(ui);
                        break;
                    case "Datepicker":
                        RenderDatepicker(ui);
                        break;
                    case "Checkbox":
                        RenderCheckbox(ui);
                        break;
                    case "Image":
                        RenderImage(ui);
                        break;
                    case "Button":
                        RenderButton(ui);
                        break;
                    case "Number":
                    case "Currency":
                        RenderNumberInput(ui);
                        break;
                    case "GridView":
                        RenderGridView(ui);
                        break;
                }
                Html.Instance.EndOf(ElementType.td);
                column += ui.Column ?? 0;
                if (column == group.Column)
                {
                    column = 0;
                    Html.Instance.EndOf(ElementType.tr).TRow.Render();
                }
            }
        }

        private void RenderGridView(UserInterface ui)
        {
            var grid = new GridView(ui)
            {
                RootHtmlElement = Html.Context,
                ParentComponent = this
            };
            CurrentEntities.Add(grid.RowData);
            _ = Window.SetTimeout(async () => await grid.RenderAsync());
        }

        private void RenderNumberInput(UserInterface ui)
        {
            var isDecimal = ui.Precision != null && ui.Precision != 0;
            var parsed = decimal.TryParse(Entity?[ui.FieldName]?.ToString(), out decimal parsedVal);
            if (!parsed)
            {
                Html.Instance.EndOf(ElementType.td);
                return;
            }
            var separator = CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator;
            var groupSeparator = CultureInfo.CurrentCulture.NumberFormat.NumberGroupSeparator;
            var value = new Observable<decimal?>(parsedVal);
            value.Subscribe(arg => { 
                if (Entity != null) Entity[ui.FieldName] = arg.NewData;
            });
            Html.Instance.MaskMoney(value, new Options
            {
                thousands = isDecimal ? groupSeparator : string.Empty,
                @decimal = separator,
                precision = isDecimal ? ui.Precision : 0
            });
        }

        private void RenderButton(UserInterface ui)
        {
            Html.Instance.Button(ui.Label, ui.ClassName, ui.Icon)
                .Attr("data-id", ui.Id.ToString())
                .Event(EventType.Click, () =>
                {
                    RootComponent.ExecuteEvent(ui.Events, Entity, ParentEntity, CurrentEntities);
                });

            //HotKeysExtension.HotKey(ui.HotKey, () =>
            //{
            //    ProcessEvents(ui);
            //});
        }

        private void RenderImage(UserInterface ui)
        {
            var value = new Observable<string>(Entity?[ui.FieldName]?.ToString());
            value.Subscribe(arg => { if (Entity != null) Entity[ui.FieldName] = arg.NewData; });
            var uploader = new ImageUploader(value, ui);
            uploader.RenderAsync();
        }

        private void RenderCheckbox(UserInterface ui)
        {
            var value = new Observable<bool?>((bool?)Entity?[ui.FieldName]);
            value.Subscribe(arg => { if (Entity != null) Entity[ui.FieldName] = arg.NewData; });
            Html.Instance.SmallCheckbox(string.Empty, value);
        }

        private void RenderDatepicker(UserInterface ui)
        {
            var value = new Observable<DateTime?>((DateTime?)Entity?[ui.FieldName]);
            value.Subscribe(arg => { if (Entity != null) Entity[ui.FieldName] = arg.NewData; });
            Html.Instance.SmallDatePicker(value);
        }

        private void RenderDropdown(UserInterface ui)
        {
            var value = new Observable<int?>((int?)Entity?[ui.FieldName]);
            value.Subscribe(arg => { if (Entity != null) Entity[ui.FieldName] = arg.NewData; });
            var searchEntry = new SearchEntry(value, ui);
            searchEntry.RenderAsync();
        }

        private void RenderInput(UserInterface ui)
        {
            var value = new Observable<string>(Entity?[ui.FieldName]?.ToString());
            if (ui.FieldName.HasAnyChar())
            {
                value.Subscribe(arg => {
                    if (Entity != null) Entity[ui.FieldName] = arg.NewData;
                });
            }
            Html.Instance.Input.Attr("data-role", "input").ClassName("input-small")
                .Value(value);
            if (!ui.ShowLabel) Html.Instance.PlaceHolder(ui.Label);
        }
    }
}
