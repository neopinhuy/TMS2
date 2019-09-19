using Components;
using LogOne.NghiepVu.Dashboard;
using LogOne.NghiepVu.Kho;
using LogOne.NghiepVu.NganHang;
using LogOne.NghiepVu.ThuChi;
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
                new MenuItem { ItemText = "Trang chủ", IconClass = "mif-home", LinkedComponent = typeof(ThongKe) },
                new MenuItem { ItemText = "Quỹ", IconClass = "mif-dollars", LinkedComponent = typeof(DanhSachThuChi),
                    MenuItems = new List<MenuItem> {
                        new MenuItem { ItemText = "Phiếu thu", IconClass = "fa fa-file-word", LinkedComponent = typeof(PhieuThu) },
                        new MenuItem { ItemText = "Thu tiền khách hàng", IconClass = "fa fa-file-word", LinkedComponent = typeof(ThuChi.ThuTienKhachHang) },
                        new MenuItem { ItemText = "Thu tiền khách hàng hàng loạt", IconClass = "fa fa-file-word", LinkedComponent = typeof(ThuTienKhachHangHangLoat) },
                        new MenuItem { ItemText = "Phiếu chi", IconClass = "fa fa-file-word", LinkedComponent = typeof(PhieuChi) },
                        new MenuItem { IsDevider = true },
                        new MenuItem { ItemText = "Trả tiền NCC", IconClass = "fa fa-file-word", LinkedComponent = typeof(TraTienNCC) },
                        new MenuItem { ItemText = "Nộp thuế", IconClass = "fa fa-file-word", LinkedComponent = typeof(NopThue) },
                        new MenuItem { ItemText = "Trả lương", IconClass = "fa fa-file-word", LinkedComponent = typeof(TraLuong) },
                        new MenuItem { ItemText = "Kết quả kiểm kê", IconClass = "fa fa-file-word", LinkedComponent = typeof(KiemKe) },
                        new MenuItem { ItemText = "Sổ chi tiền mặt", IconClass = "fa fa-file-word", LinkedComponent = typeof(SoChiTienMat) },
                        new MenuItem { ItemText = "Kiểm kê quỹ", IconClass = "fa fa-file-word", LinkedComponent = typeof(KiemKeQuy) },
                        new MenuItem { ItemText = "Dự báo dòng tiền", IconClass = "fa fa-file-word", LinkedComponent = typeof(DuBaoDongTien) },
                    }
                },
                new MenuItem { ItemText = "Ngân hàng", IconClass = "mif-library",
                    MenuItems = new List<MenuItem> {
                    new MenuItem { ItemText = "Thu, chi tiền", IconClass = "fa fa-file-word", LinkedComponent = typeof(DanhSachThuChi) },
                        new MenuItem { ItemText = "Thu tiền gởi", IconClass = "fa fa-file-word", LinkedComponent = typeof(ThuTienGoi) },
                        new MenuItem { ItemText = "Thu tiền khách hàng", IconClass = "fa fa-file-word", LinkedComponent = typeof(NganHang.ThuTienKhachHang) },
                        new MenuItem { ItemText = "Đối chiếu ngân hàng", IconClass = "fa fa-file-word", LinkedComponent = typeof(NganHang.DoiChieuNganHang) },
                    }},
                new MenuItem { ItemText = "Mua hàng", IconClass = "mif-add-shopping-cart" },
                new MenuItem { ItemText = "Bán hàng", IconClass = "mif-truck" },
                new MenuItem { ItemText = "Hóa đơn", IconClass = "fa fa-file-invoice" },
                new MenuItem { ItemText = "Kho", IconClass = "fa fa-warehouse",
                    MenuItems = new List<MenuItem> {
                        new MenuItem { ItemText = "Nhập xuất kho", IconClass = "fa fa-file-word", LinkedComponent = typeof(NhapXuatKho) },
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
