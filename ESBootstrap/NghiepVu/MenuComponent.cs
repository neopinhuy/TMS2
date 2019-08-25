using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu
{
    public class MenuItem
    {
        public bool IsGroup { get; set; }
        public string GroupName { get; set; }
        public string ItemText { get; set; }
        public string IconClass { get; set; }
        public Type LinkedComponent { get; set; }
        public List<MenuItem> MenuItems { get; set; }
    }

    public class MenuComponent : Component
    {
        public override string ControlName { get; set; }
        public override string Title { get; set; }
        public List<MenuItem> MenuItems { get; set; }

        public MenuComponent()
        {
            MenuItems = new List<MenuItem> {
                new MenuItem { IsGroup = true, GroupName = "Main" },
                new MenuItem { ItemText = "Trang chủ", IconClass = "mif-home" },
                new MenuItem { ItemText = "Quỹ", IconClass = "mif-dollars",
                    MenuItems = new List<MenuItem> {
                        new MenuItem { ItemText = "Thu tiền", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Thu tiền khách hàng", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Thu tiền khách hàng hàng loạt", IconClass = "fa fa-file-word" },
                    }
                },
            };
        }

        public override void Render()
        {
            Html.Take(".sidebar-menu");
        }
    }
}
