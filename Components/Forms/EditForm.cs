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
        public System.Action AfterSaved { get; set; }
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
                    UpdateProperties(data);
                    Toast.Success($"Create {typeof(T).Name} succeeded");
                }
                else
                {
                    Toast.Warning($"Create {typeof(T).Name} failed");
                }
            }
            else
            {
                var data = await client.UpdateAsync((T)Entity);
                if (data != null)
                {
                    UpdateProperties(data);
                    Toast.Success($"Update {typeof(T).Name} succeeded");
                }
                else
                {
                    Toast.Warning($"Update {typeof(T).Name} failed");
                }
            }
            AfterSaved?.Invoke();
        }

        private void UpdateProperties(T data)
        {
            var props = typeof(T).GetProperties();
            foreach (var prop in props)
            {
                if (prop.PropertyType.IsAssignableFrom(typeof(IEnumerable<>)))
                {
                    // Update Id for each children
                    var updatedChildren = (prop.GetValue(data) as IEnumerable<object>).ToArray();
                    var entityChildren = (prop.GetValue(Entity) as IEnumerable<object>).ToArray();
                    for (int i = 0; i < updatedChildren.Length; i++)
                    {
                        entityChildren[i][Id] = updatedChildren[i][Id];
                    }
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
                componentGroup = BuildTree(componentGroup);
                Html.Take(RootHtmlElement);
                RenderGroup(componentGroup);
                AfterRendered?.Invoke();
            });
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
                Html.Instance.EndOf("#group_" + group.Id);
            }
        }

        private void RenderComponent(ComponentGroup group)
        {
            var column = 0;
            Component childComponent = null;
            foreach (var ui in group.UserInterface.OrderBy(x => x.Order))
            {
                if (!ui.Visibility) continue;
                var colSpan = ui.Column ?? 2;
                if (ui.ShowLabel) Html.Instance.TData.Label.Text(ui.Label)
                    .EndOf(ElementType.td).TData.ColSpan(colSpan - 1).Render();
                else Html.Instance.TData.ColSpan(colSpan).ClassName("text-left").Style("padding-left: 0;").Render();
                if (ui.Style.HasAnyChar()) Html.Instance.Style(ui.Style);
                switch (ui.ComponentType.Trim())
                {
                    case "Input":
                        childComponent = new Textbox(ui);
                        break;
                    case "Dropdown":
                        childComponent = new SearchEntry(ui);
                        break;
                    case "Datepicker":
                        childComponent = new Datepicker(ui);
                        break;
                    case "Checkbox":
                        childComponent = new Checkbox(ui);
                        break;
                    case "Image":
                        childComponent = new ImageUploader(ui);
                        break;
                    case "Button":
                        childComponent = new Button(ui);
                        break;
                    case "Number":
                    case "Currency":
                        childComponent = new NumberInput(ui);
                        break;
                    case "GridView":
                        childComponent = new GridView(ui);
                        break;
                }
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
