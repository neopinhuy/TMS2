using Bridge.Html5;
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
        public System.Action AfterRendered { get; set; }
        public EditForm()
        {
            Title = $"{typeof(T).Name} Detail";
            Name = Title;
        }

        public virtual async Task Save()
        {
            var client = new Client<T>();
            if (Entity != null && Entity[Id].As<int>() == 0)
            {
                if (Entity["Active"] != null) Entity["Active"] = true;
                var data = await client.CreateAsync((T)Entity);
                if (data != null)
                {
                    Entity[Id] = data[Id];
                    UpdateComponentEntity(data);
                    Toast.Success($"Create {typeof(T).Name} succeeded");
                    RootComponent.FindComponent<GridView>().ForEach(x => x.ReloadData());
                }
                else
                {
                    Toast.Warning($"Create {typeof(T).Name} failed");
                }
                AfterSaved?.Invoke(data != null);
            }
            else
            {
                var data = await client.UpdateAsync((T)Entity);
                if (data != null)
                {
                    UpdateComponentEntity(data);
                    Toast.Success($"Update {typeof(T).Name} succeeded");
                    RootComponent.FindComponent<GridView>().ForEach(x => x.ReloadData());
                }
                else
                {
                    Toast.Warning($"Update {typeof(T).Name} failed");
                }
                AfterSaved?.Invoke(data != null);
            }
        }

        private void UpdateComponentEntity(T data)
        {
            var props = typeof(T).GetProperties();
            foreach (var prop in props)
            {
                prop.SetValue(Entity, prop.GetValue(data));
            }
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
                if (item.UserInterface == null || !item.UserInterface.Any()) continue;
                foreach (var ui in item.UserInterface)
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
                    .GetList($"?$expand=UserInterface($expand=Reference)&$filter=Feature/Name eq '{Name}'");
                var groupTree = BuildTree(componentGroup.Value);
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
                    .Width(group.Width).Style(group.Style ?? string.Empty);
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
            if (group.UserInterface.Nothing()) return;
            Html.Instance.Table.ClassName("ui-layout").TBody.TRow.Render();
            var column = 0;
            foreach (var ui in group.UserInterface.OrderBy(x => x.Order))
            {
                var colSpan = ui.Column ?? 2;
                ui.Label = ui.Label ?? string.Empty;
                if (ui.ShowLabel) Html.Instance.TData.Visibility(ui.Visibility).Label.Text(ui.Label)
                    .EndOf(ElementType.td).TData.Visibility(ui.Visibility).ColSpan(colSpan - 1).Render();
                else Html.Instance.TData.Visibility(ui.Visibility).ColSpan(colSpan).ClassName("text-left")
                        .Style("padding-left: 0;").Render();
                Html.Instance.DataAttr("com-id", ui.Id.ToString());
                if (ui.Style.HasAnyChar()) Html.Instance.Style(ui.Style);
                var childComponent = ComponentFactory.GetComponent(ui, ui.ComponentType.Trim());
                AddChild(childComponent);
                childComponent.Name = ui.FieldName;
                childComponent.Disabled = ui.Disabled;
                childComponent.ShouldFocus = ui.Focus;
                Html.Instance.EndOf(ElementType.td);
                column += ui.Column ?? 0;
                if (column == group.Column)
                {
                    column = 0;
                    Html.Instance.EndOf(ElementType.tr).TRow.Render();
                }
            }
        }
    }
}
