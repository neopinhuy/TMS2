using Bridge.Html5;
using Components;
using MisaOnline.NghiepVu.ThuChi;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu
{
    public class MenuItem
    {
        public bool IsGroup { get; set; }
        public bool IsDevider { get; set; }
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
                new MenuItem { IsGroup = true, ItemText = "Main" },
                new MenuItem { ItemText = "Trang chủ", IconClass = "mif-home" },
                new MenuItem { ItemText = "Quỹ", IconClass = "mif-dollars", LinkedComponent = typeof(DanhSachThuChi),
                    MenuItems = new List<MenuItem> {
                        new MenuItem { ItemText = "Phiếu thu", IconClass = "fa fa-file-word", LinkedComponent = typeof(PhieuThu) },
                        new MenuItem { ItemText = "Thu tiền khách hàng", IconClass = "fa fa-file-word", LinkedComponent = typeof(ThuTienKhachHang) },
                        new MenuItem { ItemText = "Thu tiền khách hàng hàng loạt", IconClass = "fa fa-file-word", LinkedComponent = typeof(ThuTienKhachHangHangLoat) },
                        new MenuItem { ItemText = "Phiếu chi", IconClass = "fa fa-file-word", LinkedComponent = typeof(PhieuChi) },
                        new MenuItem { IsDevider = true },
                        new MenuItem { ItemText = "Trả tiền khách hàng", IconClass = "fa fa-file-word", LinkedComponent = typeof(TraTienNCC) },
                        new MenuItem { ItemText = "Nộp thuế", IconClass = "fa fa-file-word", LinkedComponent = typeof(NopThue) },
                        new MenuItem { ItemText = "Trả lương", IconClass = "fa fa-file-word", LinkedComponent = typeof(TraLuong) },
                        new MenuItem { ItemText = "Kiểm kê quỹ", IconClass = "fa fa-file-word", LinkedComponent = typeof(KiemKeQuy) },
                    }
                },
                new MenuItem { ItemText = "Ngân hàng", IconClass = "mif-library" },
                new MenuItem { ItemText = "Mua hàng", IconClass = "mif-add-shopping-cart" },
                new MenuItem { ItemText = "Bán hàng", IconClass = "mif-truck" },
                new MenuItem { ItemText = "Hóa đơn", IconClass = "fa fa-file-invoice" },
                new MenuItem { ItemText = "Kho", IconClass = "fa fa-warehouse" },
                new MenuItem { ItemText = "Settings", IsGroup = true },
                new MenuItem { ItemText = "Thiết lập", IconClass = "mif-cogs" },
                new MenuItem { ItemText = "Tài khoản", IconClass = "mif-user" },
                new MenuItem { IsDevider = true },
                new MenuItem { ItemText = "Đăng xuất", IconClass = "mif-exit" },
            };
        }

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
                            if (active.Contains(li)) continue;
                            active.ClassName = active.ClassName.Replace("active", "").Trim();
                        }
                        var className = li.ParentElement.ClassName + " active";
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
