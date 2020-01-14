using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components;
using Components.Forms;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using Component = Components.Component;
using ElementType = MVVM.ElementType;

namespace TMS.UI.Business
{
    public partial class MenuComponent : Component
    {
        public List<Feature> _feature;

        private void BuildFeatureTree()
        {
            var dic = _feature.Where(f => f.IsMenu).ToDictionary(f => f.Id);
            foreach (var menu in dic.Values)
            {
                if (menu.ParentId != null)
                {
                    var parent = dic[menu.ParentId.Value];
                    if (parent.InverseParent is null)
                    {
                        parent.InverseParent = new List<Feature>();
                    }
                    else
                    {
                        parent.InverseParent.Add(menu);
                    }
                }
            }
            _feature = _feature.Where(f => f.ParentId == null && f.IsMenu).ToList();
        }

        public override void Render()
        {
            Task.Run(async () =>
            {
                var feature = await Client<Feature>.Instance.GetList("?$expand=Entity($select=Name)&$filter=Active eq true");
                _feature = feature.value;
                BuildFeatureTree();
                Html.Take(".sidebar-wrapper");
                RenderMenuItems(_feature);
                Html.Take(".sidebar-wrapper ul").ClassName("sidebar-menu border bd-default");
            });
        }

        private void RenderMenuItems(List<Feature> menuItems)
        {
            Html.Instance.Ul.ForEach(menuItems, (item, index) =>
            {
                if (item.IsGroup)
                {
                    Html.Instance.Li.ClassName("group-title").Text(item.Label).End.Render();
                }
                else if (item.IsDevider)
                {
                    Html.Instance.Li.ClassName("divider").End.Render();
                }
                else
                {
                    var iconClass = item.Icon.Contains("mif") || item.Icon.Contains("fa-");
                    Html.Instance.Li.DataAttr("feature", item.Id.ToString())
                    .Anchor.Attr("data-role", "ripple")
                    .Event(EventType.Click, MenuItemClick, item)
                    .Event(EventType.ContextMenu, EditFeature, item) // IMPORTANT: check role to show this feature
                    .Span.ClassName("icon")
                        .If(iconClass,
                            () => Html.Instance.ClassName(item.Icon).Render(),
                            () => Html.Instance.Style($"background-image: url({item.Icon});").Render())
                    .End
                    .Text(item.Label).EndOf(MVVM.ElementType.a).Render();
                    if (item.InverseParent != null && item.InverseParent.Count > 0)
                    {
                        RenderMenuItems(item.InverseParent.ToList());
                    }
                }
            });
        }

        private ContextMenu _contextMenu;
        private void EditFeature(Event e, Feature feature)
        {
            e.PreventDefault();
            var top = (float)e["clientY"];
            var left = (float)e["clientX"];
            _contextMenu = new ContextMenu { Top = top, Left = left };
            AddChild(_contextMenu);
            Html.Instance
                .Li.Event(EventType.Click, DeleteFeature, feature)
                .Icon("fa fa-trash").End.Span.Text("Delete this feature").EndOf(ElementType.li)
                .Li.Event(EventType.Click, FeatureEditor, feature)
                .Icon("fa fa-plus").End.Span.Text("Edit this feature").EndOf(ElementType.li);
        }

        private void FeatureEditor(Feature feature)
        {
            var popup = new TabEditor<Feature>()
            {
                Id = feature?.Id ?? GetHashCode(),
                Name = "Feature Editor",
                Entity = feature,
                Title = "Feature"
            };
            AddChild(popup);
            popup.Focus();
        }

        private void DeleteFeature(Feature feature)
        {
            var confirmDialog = new ConfirmDialog();
            confirmDialog.YesConfirmed = async () =>
            {
                var client = new Client("Feature");
                await client.DeleteAsync(new List<int> { feature.Id });
            };
            AddChild(confirmDialog);
        }

        private void MenuItemClick(Feature menu, Event e)
        {
            var li = e.Target as HTMLElement;
            var activeLi = Document.QuerySelectorAll(".sidebar-wrapper li.active");
            foreach (HTMLElement active in activeLi)
            {
                if (active.Contains(li))
                {
                    continue;
                }

                active.ClassName = active.ClassName.Replace("active", "").Trim();
            }
            string className = li.ParentElement.ClassName + " active";
            li.ParentElement.ClassName = className.Trim();
            if (menu.ViewClass is null && menu.Entity is null) return;
            Type type;
            if (menu.ViewClass != null)
            {
                type = Type.GetType(menu.ViewClass);
            }
            else
            {
                var entityType = Type.GetType("TMS.API.Models." + menu.Entity.Name);
                type = typeof(TabEditor<>).MakeGenericType(new Type[] { entityType });
            }
            var instance = Activator.CreateInstance(type) as Component;
            instance.Id = menu.GetHashCode();
            instance.Render();
            instance["Focus"].As<System.Action>()?.Invoke(instance);
        }
    }
}
