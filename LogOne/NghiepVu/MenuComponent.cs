using Components;
using LogOne.NghiepVu.TruckManagement;
using System;
using System.Collections.Generic;

namespace LogOne.NghiepVu
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

    public partial class MenuComponent : Component
    {
        public override string Title { get; set; }
        public List<MenuItem> MenuItems { get; set; }

        public MenuComponent()
        {
            MenuItems = new List<MenuItem> {
                new MenuItem { IsGroup = true, ItemText = "Main" },
                new MenuItem { ItemText = "Dashboard", IconClass = "mif-home", LinkedComponent = typeof(Dashboard.Dashboard) },
                new MenuItem { ItemText = "Truck", IconClass = "mif-truck", LinkedComponent = typeof(AllTruck),
                    MenuItems = new List<MenuItem> {
                        new MenuItem { ItemText = "Accessory", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Thu tiền khách hàng", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Thu tiền khách hàng hàng loạt", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Phiếu chi", IconClass = "fa fa-file-word" },
                        new MenuItem { IsDevider = true },
                        new MenuItem { ItemText = "Trả tiền NCC", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Nộp thuế", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Trả lương", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Kết quả kiểm kê", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Sổ chi tiền mặt", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Kiểm kê quỹ", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Dự báo dòng tiền", IconClass = "fa fa-file-word" },
                    }
                },
                new MenuItem { ItemText = "Ngân hàng", IconClass = "mif-library",
                    MenuItems = new List<MenuItem> {
                    new MenuItem { ItemText = "Thu, chi tiền", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Thu tiền gởi", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Thu tiền khách hàng", IconClass = "fa fa-file-word" },
                        new MenuItem { ItemText = "Đối chiếu ngân hàng", IconClass = "fa fa-file-word" },
                    }},
                new MenuItem { ItemText = "Mua hàng", IconClass = "mif-add-shopping-cart" },
                new MenuItem { ItemText = "Bán hàng", IconClass = "mif-truck" },
                new MenuItem { ItemText = "Hóa đơn", IconClass = "fa fa-file-invoice" },
                new MenuItem { ItemText = "Kho", IconClass = "fa fa-warehouse",
                    MenuItems = new List<MenuItem> {
                        new MenuItem { ItemText = "Nhập xuất kho", IconClass = "fa fa-file-word" },
                    },
                },
                new MenuItem { ItemText = "Settings", IsGroup = true },
                new MenuItem { ItemText = "Thiết lập", IconClass = "mif-cogs" },
                new MenuItem { ItemText = "Tài khoản", IconClass = "mif-user" },
                new MenuItem { IsDevider = true },
                new MenuItem { ItemText = "Đăng xuất", IconClass = "mif-exit" },
            };
        }
    }
}
