using Bridge.Html5;
using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace LogOne.NghiepVu
{
    public partial class MenuComponent : Component
    {
        public override void Render()
        {
            Html.Take(".sidebar-wrapper");
            RenderMenuItems(MenuItems);
            Html.Take(".sidebar-wrapper ul").ClassName("sidebar-menu border bd-default");
        }

        private void RenderMenuItems(List<MenuItem> menuItems)
        {
            Html.Instance.Ul.ForEach(menuItems, (item, index) =>
            {
                if (item.IsGroup)
                {
                    Html.Instance.Li.ClassName("group-title").Text(item.ItemText).End.Render();
                }
                else if (item.IsDevider)
                {
                    Html.Instance.Li.ClassName("divider").End.Render();
                }
                else
                {
                    Html.Instance.Li.Anchor.Attr("data-role", "ripple")
                    .Event(EventType.Click, (menu, e) =>
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
                        var instance = Activator.CreateInstance(menu.LinkedComponent) as Component;
                        instance.RenderAndFocus();
                    }, item)
                        .Span.ClassName("icon " + item.IconClass).End
                        .Text(item.ItemText).EndOf(MVVM.ElementType.a).Render();
                    if (item.MenuItems != null && item.MenuItems.Count > 0)
                    {
                        RenderMenuItems(item.MenuItems);
                    }
                }
            });
        }
    }
}
