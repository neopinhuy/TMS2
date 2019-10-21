using Bridge.Html5;
using Components;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business
{
    public partial class MenuComponent : Component
    {
        private void BuildFeatureTree()
        {
            var dic = _feature.ToDictionary(x => x.Id);
            var root = _feature.First(x => x.ParentId == null);
            foreach (var item in _feature)
            {
                if (item.ParentId != null)
                {
                    var parent = dic[item.ParentId.Value];
                    if (parent.InverseParent is null)
                    {
                        parent.InverseParent = new List<Feature>();
                    }
                    else
                    {
                        parent.InverseParent.Add(item);
                    }
                }
            }
            _feature = _feature.Where(x => x.ParentId == null).ToList();
        }

        public override async Task RenderAsync()
        {
            _masterData = await MasterData.GetSingletonAsync();
            _feature = _masterData.Feature.ToList();
            BuildFeatureTree();
            Html.Take(".sidebar-wrapper");
            RenderMenuItems(_feature);
            Html.Take(".sidebar-wrapper ul").ClassName("sidebar-menu border bd-default");
        }

        private void RenderMenuItems(List<Feature> menuItems)
        {
            Html.Instance.Ul.ForEach(menuItems, (item, index) =>
            {
                if (item.IsGroup.HasValue && item.IsGroup.Value)
                {
                    Html.Instance.Li.ClassName("group-title").Text(item.Name).End.Render();
                }
                else if (item.IsDevider.HasValue && item.IsDevider.Value)
                {
                    Html.Instance.Li.ClassName("divider").End.Render();
                }
                else
                {
                    Html.Instance.Li.Anchor.Attr("data-role", "ripple")
                    .Event(EventType.Click, async (menu, e) =>
                    {
                        await MenuItemClick(menu, e);
                    }, item)
                    .Span.ClassName("icon " + item.Icon).End
                    .Text(item.Name).EndOf(MVVM.ElementType.a).Render();
                    if (item.InverseParent != null && item.InverseParent.Count > 0)
                    {
                        RenderMenuItems(item.InverseParent.ToList());
                    }
                }
            });
        }

        private static async Task MenuItemClick(Feature menu, Event e)
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
            if (menu.ViewClass != null)
            {
                var type = Type.GetType(menu.ViewClass);
                var instance = Activator.CreateInstance(type) as TabComponent;
                await instance.RenderAsync();
                instance.Focus();
            }
        }
    }
}
