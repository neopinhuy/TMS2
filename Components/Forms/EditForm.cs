﻿using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using ElementType = MVVM.ElementType;

namespace Components.Forms
{
    public partial class EditForm<T> : Component where T : class
    {
        public string Title { get; set; }
        public Action<bool> AfterSaved { get; set; }

        public EditForm()
        {
            Title = $"{typeof(T).Name} Detail";
            Name = Title;
        }

        public virtual void Create()
        {
            var popup = new PopupEditor<T>()
            {
                Name = $"Edit{typeof(T).Name}",
                Title = "Ledger",
            };
            AddChild(popup);
        }

        public virtual void Edit(T entity)
        {
            var popup = new PopupEditor<T>
            {
                Entity = entity,
                Name = $"Edit{typeof(T).Name}",
                Title = "Ledger",
            };
            AddChild(popup);
        }

        public virtual async Task<bool> Save(bool defaultMessage = false)
        {
            var client = new Client<T>();
            if (Entity != null && Entity[IdField].As<int>() == 0)
            {
                if (Entity["Active"] != null) Entity["Active"] = true;
                SetDeafaultId();
                var data = await client.CreateAsync((T)Entity);
                ReloadAndShowMessage(defaultMessage, data, false);
                AfterSaved?.Invoke(data != null);
            }
            else
            {
                SetDeafaultId();
                var data = await client.UpdateAsync((T)Entity);
                ReloadAndShowMessage(defaultMessage, data, false);
                AfterSaved?.Invoke(data != null);
            }
            return true;
        }

        private void ReloadAndShowMessage(bool defaultMessage, T data, bool updating)
        {
            var prefix = updating ? "Creating" : "Updating";
            if (data != null)
            {
                if (defaultMessage)
                    Toast.Success($"{prefix} succeeded");
                var grids = RootComponent.FindComponent<GridView>();
                grids.ForEach(x => x.ReloadData());
            }
            else if (defaultMessage)
            {
                Toast.Warning($"{prefix} failed");
            }
        }

        private void SetDeafaultId()
        {
            var grids = FindComponent<GridView>();
            grids.ForEach(x =>
            {
                x.RowData.Data.ForEach(row =>
                {
                    if ((int)row[IdField] < 0)
                    {
                        row[IdField] = 0;
                    }
                });
            });
        }

        private List<ComponentGroup> BuildTree(IEnumerable<ComponentGroup> componentGroup)
        {
            var dic = componentGroup.ToDictionary(x => x.Id);
            ComponentGroup parent;
            foreach (var item in componentGroup)
            {
                if (item.ParentId is null) continue;
                if (!dic.ContainsKey(item.ParentId.Value))
                {
                    Console.WriteLine($"The parent key {item.ParentId} of {item.Name} doesn't exist");
                    continue;
                }
                parent = dic[item.ParentId.Value];
                if (parent.InverseParent == null) parent.InverseParent = new List<ComponentGroup>();
                parent.InverseParent.Add(item);
            }
            foreach (var item in componentGroup)
            {
                if (item.Component == null || !item.Component.Any()) continue;
                foreach (var ui in item.Component)
                {
                    ui.ComponentGroup = item;
                }
            }
            return componentGroup.Where(x => x.ParentId == null).ToList();
        }

        public override void Render()
        {
            Task.Run(async () =>
            {
                var componentGroup = await Client<ComponentGroup>.Instance
                    .GetList($"?$expand=Component($expand=Reference)&$filter=Feature/Name eq '{Name}'");
                var groupTree = BuildTree(componentGroup.value);
                Html.Take(RootHtmlElement);
                RenderGroup(groupTree);
                AfterRendered?.Invoke();
            });
        }

        private void RenderGroup(List<ComponentGroup> componentGroup)
        {
            foreach (var group in componentGroup.OrderBy(x => x.Order))
            {
                if (group.IsTab)
                {
                    var tabGroup = group.ParentId is null ? group.FeatureId.ToString() : group.TabGroup;
                    var tab = Document.GetElementById("tab_group_" + tabGroup);
                    if (tab is null)
                    {
                        Html.Instance.Tab().Id("tab_group_" + tabGroup)
                            .TabItem(group.Name, "group_" + group.Id, true).EndOf(ElementType.ul)
                            .TabContent().Id("tab_content_" + tabGroup);
                    }
                    else
                    {
                        Html.Take(tab).TabItem(group.Name, "group_" + group.Id).EndOf(ElementType.ul);
                        Html.Take("#tab_content_" + tabGroup);
                    }
                }
                Html.Instance.Panel(!group.IsTab ? group.Name : string.Empty).Id("group_" + group.Id)
                    .ClassName("group").ClassName(group.ClassName)
                    .ClassName(group.IsTab ? "tab" : string.Empty).Display(!group.Hidden)
                    .Style(group.Style ?? string.Empty).Width(group.Width);
                AddChild(new Section(Html.Context) { Name = group.Name });
                if (group.InverseParent != null && group.InverseParent.Any())
                {
                    RenderGroup(group.InverseParent.ToList());
                }
                RenderComponent(group);
                Html.Instance.EndOf("#group_" + group.Id);
            }
        }

        private void RenderComponent(ComponentGroup group)
        {
            if (group.Component.Nothing()) return;
            Html.Instance.Table.ClassName("ui-layout").TBody.TRow.Render();
            var column = 0;
            foreach (var ui in group.Component.OrderBy(x => x.Order))
            {
                if (ui.Hidden) continue;
                var colSpan = ui.Column ?? 2;
                ui.Label = ui.Label ?? string.Empty;
                if (ui.ShowLabel) Html.Instance.TData.Visibility(ui.Visibility).Label.Text(ui.Label)
                    .EndOf(ElementType.td).TData.Visibility(ui.Visibility).ColSpan(colSpan - 1).Render();
                else Html.Instance.TData.Visibility(ui.Visibility).ColSpan(colSpan).ClassName("text-left")
                        .Style("padding-left: 0;").Render();
                Html.Instance.DataAttr("com-id", ui.Id.ToString());
                if (ui.Style.HasAnyChar()) Html.Instance.Style(ui.Style);
                if (ui.Width.HasAnyChar()) Html.Instance.Width(ui.Width);
                if (ui.MinWidth.HasAnyChar()) Html.Instance.Style($"min-width: {ui.MinWidth}");
                if (ui.MaxWidth.HasAnyChar()) Html.Instance.Style($"max-width: {ui.MaxWidth}");
                var childComponent = ComponentFactory.GetComponent(ui, ui.ComponentType.Trim());
                AddChild(childComponent);
                childComponent.Disabled = ui.Disabled;
                childComponent.ShouldFocus = ui.Focus;
                Html.Instance.EndOf(ElementType.td);
                if (ui.Offset.HasValue)
                {
                    Html.Instance.TData.ColSpan(ui.Offset.Value).End.Render();
                    column += ui.Offset.Value;
                }
                column += colSpan;
                if (column == group.Column)
                {
                    column = 0;
                    Html.Instance.EndOf(ElementType.tr).TRow.Render();
                }
            }
        }

        public override void Dispose()
        {
            base.Dispose();
            if (Parent != null && Parent.Children.Contains(this))
            {
                Parent.Children.Remove(this);
            }
        }
    }
}
