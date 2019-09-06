using Components;
using MVVM;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class PhieuChi : Component
    {
        public override string ControlName { get; set; } = "PhieuChi";
        public override string Title { get; set; } = "Phiếu chi";
        public List<SelectListItem> WithdrawReason { get; set; } = new List<SelectListItem>()
        {
            new SelectListItem { Value = 1, Display = "Tạm ứng cho nhân viên" },
            new SelectListItem { Value = 2, Display = "Gởi tiền vào ngân hàng" },
            new SelectListItem { Value = 3, Display = "Chi khác" },
        };
        public ObservableArray<Header<object>> HachToanHeader { get; set; }
        public ObservableArray<object> HachToan { get; set; }

        public ObservableArray<Header<object>> ThueHeader { get; set; }
        public ObservableArray<object> Thue { get; set; }

        public PhieuChi()
        {
            HachToanHeader = new ObservableArray<Header<object>>(new Header<object>[]
            {
                new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                new Header<object> { HeaderText = "TK nợ", FieldName = "TKNo" },
                new Header<object> { HeaderText = "TK có", FieldName = "TKCo" },
                new Header<object> { HeaderText = "Số tiền", FieldName = "SoTien" },
                new Header<object> { HeaderText = "Nghiệp vụ", FieldName = "NghiepVu" },
                new Header<object> { HeaderText = "Đối tượng", FieldName = "DoiTuong" },
                new Header<object> { HeaderText = "Tên đối tượng", FieldName = "TenDoiTuong" },
                new Header<object> { HeaderText = "TK ngân hàng", FieldName = "TenNganHang" },
                new Header<object> { HeaderText = "Khoản mục CP", FieldName = "KhoanMucCP" },
                new Header<object> { HeaderText = "Đơn vị", FieldName = "DonVi" },
                new Header<object> { HeaderText = "Đối tượng THCP", FieldName = "DoiTuongTHCP" },
                new Header<object> { HeaderText = "Công trình", FieldName = "CongTrinh" },
                new Header<object> { HeaderText = "Đơn đặt hàng", FieldName = "DonDatHang" },
                new Header<object> { HeaderText = "Đơn mua hàng", FieldName = "DonMuaHang" },
                new Header<object> { HeaderText = "Hợp đồng mua", FieldName = "HopDongMua" },
                new Header<object> { HeaderText = "Hợp đồng bán", FieldName = "HopDongBan" },
            });
            HachToan = new ObservableArray<object>(new object[]
            {
                new
                {
                    DienGiai = "Hạch toán chi", TKNo = "452 - Chi khác", TKCo = "", SoTien = "10.500.000",
                    NghiepVu = "Chi tiền du lịch", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS", TenNganHang = "VCB",
                    KhoanMucCP = "N/A", DonVi = "Board", DoiTuongTHCP = "", CongTrinh = "N/A",
                    DonDatHang = "DH-2019-08-17", DonMuaHang = "MH-2019-01-01", HopDongMua = "", HopDongBan = "",
                },
                new
                {
                    DienGiai = "Hạch toán chi", TKNo = "452 - Chi khác", TKCo = "", SoTien = "10.500.000",
                    NghiepVu = "Chi tiền du lịch", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS", TenNganHang = "VCB",
                    KhoanMucCP = "N/A", DonVi = "Board", DoiTuongTHCP = "", CongTrinh = "N/A",
                    DonDatHang = "DH-2019-08-17", DonMuaHang = "MH-2019-01-01", HopDongMua = "", HopDongBan = "",
                },
                new
                {
                    DienGiai = "Hạch toán chi", TKNo = "452 - Chi khác", TKCo = "", SoTien = "10.500.000",
                    NghiepVu = "Chi tiền du lịch", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS", TenNganHang = "VCB",
                    KhoanMucCP = "N/A", DonVi = "Board", DoiTuongTHCP = "", CongTrinh = "N/A",
                    DonDatHang = "DH-2019-08-17", DonMuaHang = "MH-2019-01-01", HopDongMua = "", HopDongBan = "",
                },
                new
                {
                    DienGiai = "Hạch toán chi", TKNo = "452 - Chi khác", TKCo = "", SoTien = "10.500.000",
                    NghiepVu = "Chi tiền du lịch", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS", TenNganHang = "VCB",
                    KhoanMucCP = "N/A", DonVi = "Board", DoiTuongTHCP = "", CongTrinh = "N/A",
                    DonDatHang = "DH-2019-08-17", DonMuaHang = "MH-2019-01-01", HopDongMua = "", HopDongBan = "",
                },
                new
                {
                    DienGiai = "Hạch toán chi", TKNo = "452 - Chi khác", TKCo = "", SoTien = "10.500.000",
                    NghiepVu = "Chi tiền du lịch", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS", TenNganHang = "VCB",
                    KhoanMucCP = "N/A", DonVi = "Board", DoiTuongTHCP = "", CongTrinh = "N/A",
                    DonDatHang = "DH-2019-08-17", DonMuaHang = "MH-2019-01-01", HopDongMua = "", HopDongBan = "",
                }
            });

            ThueHeader = new ObservableArray<Header<object>>(new Header<object>[]
            {
                new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                new Header<object> { HeaderText = "TK thuế GTGT", FieldName = "TKThueGTGT" },
                new Header<object> { HeaderText = "Tiền thuế GTGT", FieldName = "TienThueGTGT" },
                new Header<object> { HeaderText = "% thuế GTGT", FieldName = "PTThueGTGT" },
                new Header<object> { HeaderText = "Giá trị HHDV chưa thuế", FieldName = "GiaTriHHDVChuaThue" },
                new Header<object> { HeaderText = "Ngày hóa đơn", FieldName = "NgayHoaDon" },
                new Header<object> { HeaderText = "Số hóa đơn", FieldName = "SoHoaDon" },
                new Header<object> { HeaderText = "Nhóm HHDV mua vào", FieldName = "NhomHHDVMuaVao" },
                new Header<object> { HeaderText = "Mã NCC", FieldName = "MaNCC" },
                new Header<object> { HeaderText = "Tên NCC", FieldName = "TenNCC" },
                new Header<object> { HeaderText = "Mã số thuế NCC", FieldName = "MaSoThueNCC" },
            });
            Thue = new ObservableArray<object>(new object[]
            {
                new
                {
                    DienGiai = "Hạch toán chi", TKThueGTGT = "452 - Chi khác", TienThueGTGT = "", PTThueGTGT = "10.500.000",
                    GiaTriHHDVChuaThue = "Chi tiền du lịch", NgayHoaDon = "Nhân JS", SoHoaDon = "Nhân JS", NhomHHDVMuaVao = "VCB",
                    MaNCC = "N/A", TenNCC = "Board", MaSoThueNCC = "",
                },
                new
                {
                    DienGiai = "Hạch toán chi", TKThueGTGT = "452 - Chi khác", TienThueGTGT = "", PTThueGTGT = "10.500.000",
                    GiaTriHHDVChuaThue = "Chi tiền du lịch", NgayHoaDon = "Nhân JS", SoHoaDon = "Nhân JS", NhomHHDVMuaVao = "VCB",
                    MaNCC = "N/A", TenNCC = "Board", MaSoThueNCC = "",
                },
                new
                {
                    DienGiai = "Hạch toán chi", TKThueGTGT = "452 - Chi khác", TienThueGTGT = "", PTThueGTGT = "10.500.000",
                    GiaTriHHDVChuaThue = "Chi tiền du lịch", NgayHoaDon = "Nhân JS", SoHoaDon = "Nhân JS", NhomHHDVMuaVao = "VCB",
                    MaNCC = "N/A", TenNCC = "Board", MaSoThueNCC = "",
                },
                new
                {
                    DienGiai = "Hạch toán chi", TKThueGTGT = "452 - Chi khác", TienThueGTGT = "", PTThueGTGT = "10.500.000",
                    GiaTriHHDVChuaThue = "Chi tiền du lịch", NgayHoaDon = "Nhân JS", SoHoaDon = "Nhân JS", NhomHHDVMuaVao = "VCB",
                    MaNCC = "N/A", TenNCC = "Board", MaSoThueNCC = "",
                },
                new
                {
                    DienGiai = "Hạch toán chi", TKThueGTGT = "452 - Chi khác", TienThueGTGT = "", PTThueGTGT = "10.500.000",
                    GiaTriHHDVChuaThue = "Chi tiền du lịch", NgayHoaDon = "Nhân JS", SoHoaDon = "Nhân JS", NhomHHDVMuaVao = "VCB",
                    MaNCC = "N/A", TenNCC = "Board", MaSoThueNCC = "",
                },
                new
                {
                    DienGiai = "Hạch toán chi", TKThueGTGT = "452 - Chi khác", TienThueGTGT = "", PTThueGTGT = "10.500.000",
                    GiaTriHHDVChuaThue = "Chi tiền du lịch", NgayHoaDon = "Nhân JS", SoHoaDon = "Nhân JS", NhomHHDVMuaVao = "VCB",
                    MaNCC = "N/A", TenNCC = "Board", MaSoThueNCC = "",
                },
            });
        }
    }
}