using Bridge.Html5;
using Components;
using MisaOnline.NghiepVu.Common;
using MVVM;
using System;
using System.Collections.Generic;
using Direction = Components.Direction;
using ElementType = MVVM.ElementType;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class PhieuChi : Component
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

        public override void Render()
        {
            if (IsExisted()) return;
            ThongTinChung();
            ChungTu.Render();
            ChiTiet();
        }

        private void ThongTinChung()
        {
            Html.Instance.H2.Text(Title).End
                .Grid().GridRow().ClassName("marginTop5").GridCell(6)
                .Panel("Thông tin chung")
                .Table.TBody.TRow
                    .TData.Text("Đối tượng").End
                    .TData.SmallInput().Value("KH00001").EndOf(ElementType.td)
                    .TData.ColSpan(4).SmallInput().Value("Nhân JS").EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Người nhận").End
                    .TData.ColSpan(4).SmallInput().Value("Nhân JS").EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Địa chỉ").End
                    .TData.ColSpan(4).SmallInput().Value("387A Lê văn khương").EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Lý do nộp").End
                    .TData.SmallDropDown(WithdrawReason, WithdrawReason[0], "Display", "Value").EndOf(ElementType.td)
                    .TData.ColSpan(4).SmallInput().Value("Tạm ứng cho nhân viên").EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Nhân viên").End
                    .TData.SmallInput().End.End
                    .TData.Text("Kèm theo").End
                    .TData.SmallInput().End.End
                    .TData.Span.Text("Chứng từ gốc").EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Tham chiếu").End
                    .TData.ColSpan(4).Button
                        .ClassName("button small").Span.ClassName("fa fa-search")
                .EndOf(".cell").Render();
        }

        public void ChiTiet()
        {
            Html.Instance.EndOf(".row").GridRow().GridCell(12)
                .Ul.Attr("data-role", "tabs").Attr("data-expand", "true").Margin(Direction.top, 5)
                .Li.ClassName("active").Anchor.Href("#hachToan").Text("1. Hạch toán").EndOf(ElementType.li)
                .Li.Anchor.Href("#thue").Text("2. Thuế").EndOf(ElementType.ul)
                .Div.ClassName("border bd-default no-border-top p-2")
                    .Div.Id("hachToan")
                    .Table(HachToanHeader, HachToan).ClassName("margin0 borderTop0").End
                    .EndOf("#hachToan")
                    
                    .Div.Id("thue")
                    .Table(ThueHeader, Thue).ClassName("margin0 borderTop0").End
                    .EndOf("#thue")
                .Render();
        }
    }

}