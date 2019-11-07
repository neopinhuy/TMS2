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
    public partial class EditForm<T> : Component
    {
        public virtual string Title { get; set; } = $"{typeof(T).Name} Detail";
        public EditForm()
        {
            CurrentEntities = new List<ObservableArray<object>>();
            Name = Title;
        }

        public virtual void Create()
        {
            var defaultT = (T)Activator.CreateInstance(typeof(T));
            var entities = CurrentEntities.FirstOrDefault((ObservableArray<object> x) =>
            {
                var type = x.Data.FirstOrDefault().GetType();
                return type.FullName == typeof(T).FullName;
            });
            var editor = new PopupEditor<T>
            {
                Entity = defaultT,
                ParentEntity = entities,
            };
            AddChild(editor);
        }

        public virtual void Edit(T entity, ObservableArray<object> entityList)
        {
            var editor = new PopupEditor<T>
            {
                Entity = entity,
                ParentEntity = entityList,
            };
            AddChild(editor);
        }

        public virtual async Task Save()
        {
            var client = new Client<T>();
            if (Entity != null && Entity["Id"].As<int>() == 0)
            {
                if (Entity["Active"] != null) Entity["Active"] = true;
                var data = await client.CreateAsync((T)Entity);
                if (data != null)
                {
                    Toast.Success($"Create {typeof(T).Name} succeeded");
                }
                Entity = data;
                ParentEntity.Add(Entity);
            }
            else
            {
                var data = await client.UpdateAsync((T)Entity);
                if (data != null)
                {
                    Toast.Success($"Update {typeof(T).Name} succeeded");
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

        public override void Render()
        {
            Task.Run(async () =>
            {
                var componentGroup = await Client<ComponentGroup>.Instance.GetList($"$expand=UserInterface($expand=Reference)&$filter=Feature/Name eq '{Title}'");
                componentGroup = BuildTree(componentGroup);
                Html.Take(RootHtmlElement);
                RenderGroup(componentGroup);
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
                        AddChild(new Textbox(ui));
                        break;
                    case "Dropdown":
                        AddChild(new SearchEntry(ui));
                        break;
                    case "Datepicker":
                        AddChild(new Datepicker(ui));
                        break;
                    case "Checkbox":
                        AddChild(new Checkbox(ui));
                        break;
                    case "Image":
                        AddChild(new ImageUploader(ui));
                        break;
                    case "Button":
                        AddChild(new Button(ui));
                        break;
                    case "Number":
                    case "Currency":
                        AddChild(new NumberInput(ui));
                        break;
                    case "GridView":
                        AddChild(new GridView(ui));
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
    }
}
