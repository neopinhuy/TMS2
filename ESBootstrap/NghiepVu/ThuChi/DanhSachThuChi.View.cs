using Bridge.Html5;
using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class DanhSachThuChi : Component
    {
        public override void Render()
        {
            if (IsExisted()) return;
            RenderSearch();
            RenderTables();
            ChiTiet();
        }

        private void RenderSearch()
        {
            Html.Instance.H2.Text("Danh sách thu chi").End
                .Panel("Thông tin chung").ClassName("marginTop5")
                .Form.Table
                    .TBody.TRow
                        .TData.Text("Kỳ").End
                        .TData
                            .SmallDropDown(Ranges, SelectedRange, nameof(SelectListItem.Display), nameof(SelectListItem.Value))
                            .End
                        .End
                        .TData.Text("Từ").End
                        .TData.SmallDatePicker().Value(DateTime.Now.ToString()).End.End
                        .TData.Text("Đến").End
                        .TData.SmallDatePicker().Value(DateTime.Now.ToString()).End.End
                    .End.TRow
                        .TData.Text("Trạng thái").End
                        .TData
                            .Dropdown(States, SelectedState, nameof(SelectListItem.Display), nameof(SelectListItem.Value))
                            .Attr("data-role", "select").ClassName("input-small")
                            .End
                        .End
                        .TData.Text("Loại").End
                        .TData
                            .Dropdown(Types, SelectedType, nameof(SelectListItem.Display), nameof(SelectListItem.Value))
                            .Attr("data-role", "select").ClassName("input-small")
                            .End
                        .End
                        .TData.End
                        .TData.Button.ClassName("button small info").Text("Lấy dữ liệu").End.End
                .EndOf(".panel").Render(); // end of row
        }

        private static void RenderTables()
        {
            Html.Instance.ClassName("marginTop5")
                .Table(new ObservableArray<Header<object>>(new Header<object>[] {
                    new Header<object> { HeaderText = "Ngày hạch toán", FieldName = "NgayHachToan" },
                    new Header<object> { HeaderText = "Ngày chứng từ", FieldName = "NgayChungTu" },
                    new Header<object> { HeaderText = "Số chứng từ", FieldName = "SoChungTu" },
                    new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                    new Header<object> { HeaderText = "Số tiền", FieldName = "SoTien" },
                    new Header<object> { HeaderText = "Đối tượng", FieldName = "DoiTuong" },
                    new Header<object> { HeaderText = "Lý do thu/chi", FieldName = "LyDoThuChi" },
                    new Header<object> { HeaderText = "Ngày ghi sổ quỹ", FieldName = "NgayGhiSoQuy" },
                    new Header<object> { HeaderText = "Loại chứng từ", FieldName = "LoaiChungTu" },
                    new Header<object> {
                        EditButton = true,
                        EditEvent = (x) => {
                            new PhieuThu().RenderAndFocus();
                        }
                    },
                }), new ObservableArray<object>(new object[] {
                    new
                    {
                        NgayHachToan = "20/08/2019", NgayChungTu = "20/08/2019", SoChungTu = "CT00001", DienGiai = "Chug tu 000001",
                        SoTien = "100.000.000", DoiTuong = "Nhân JS", LyDoThuChi = "Thu tiền công nợ", NgayGhiSoQuy = "20/08/2019", LoaiChungTu = "Công nợ"
                    },
                    new
                    {
                        NgayHachToan = "20/08/2019", NgayChungTu = "20/08/2019", SoChungTu = "CT00001", DienGiai = "Chug tu 000001",
                        SoTien = "100.000.000", DoiTuong = "Nhân JS", LyDoThuChi = "Thu tiền công nợ", NgayGhiSoQuy = "20/08/2019", LoaiChungTu = "Công nợ"
                    },
                    new
                    {
                        NgayHachToan = "20/08/2019", NgayChungTu = "20/08/2019", SoChungTu = "CT00001", DienGiai = "Chug tu 000001",
                        SoTien = "100.000.000", DoiTuong = "Nhân JS", LyDoThuChi = "Thu tiền công nợ", NgayGhiSoQuy = "20/08/2019", LoaiChungTu = "Công nợ"
                    },
                    new
                    {
                        NgayHachToan = "20/08/2019", NgayChungTu = "20/08/2019", SoChungTu = "CT00001", DienGiai = "Chug tu 000001",
                        SoTien = "100.000.000", DoiTuong = "Nhân JS", LyDoThuChi = "Thu tiền công nợ", NgayGhiSoQuy = "20/08/2019", LoaiChungTu = "Công nợ"
                    },
                    new
                    {
                        NgayHachToan = "20/08/2019", NgayChungTu = "20/08/2019", SoChungTu = "CT00001", DienGiai = "Chug tu 000001",
                        SoTien = "100.000.000", DoiTuong = "Nhân JS", LyDoThuChi = "Thu tiền công nợ", NgayGhiSoQuy = "20/08/2019", LoaiChungTu = "Công nợ"
                    },
                })).EndOf(".panel").Render();

        }

        private static void ChiTiet()
        {
            Html.Instance.ClassName("marginTop5")
                .Table(new ObservableArray<Header<object>>(new Header<object>[] {
                    new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                    new Header<object> { HeaderText = "TK nợ", FieldName = "TKNo" },
                    new Header<object> { HeaderText = "TK có", FieldName = "TKCo" },
                    new Header<object> { HeaderText = "Số tiền", FieldName = "SoTien" },
                    new Header<object> { HeaderText = "Nghiệp vụ", FieldName = "NghiepVu" },
                    new Header<object> { HeaderText = "Đối tượng", FieldName = "DoiTuong" },
                    new Header<object> { HeaderText = "Tên đối tượng", FieldName = "TenDoiTuong" },
                    new Header<object> { HeaderText = "TK ngân hàng", FieldName = "TKNganHang" },
                    new Header<object> { HeaderText = "Đơn vị", FieldName = "DonVi" },
                    new Header<object> { HeaderText = "Công trình", FieldName = "CongTrinh" },
                    new Header<object> { HeaderText = "Hợp đồng bán", FieldName = "HopDongBan" },
                    new Header<object> { HeaderText = "Mã thống kê", FieldName = "MaThongKe" },
                }), new ObservableArray<object>(new object[] {
                    new
                    {
                        DienGiai = "Công nợ", TKNo = "111 - Nội tệ", TKCo = "112 - Công tác phí", SoTien = 10000000m,
                        NghiepVu = "N/A", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS",
                        TKNganHang = "97042564869", DonVi = "Kế toán", CongTrinh = "Đập thủy điện Hòa Bình",
                        HopDongBan = "HDB09233", MaThongKe = "TK0901229",
                    },
                    new
                    {
                        DienGiai = "Công nợ", TKNo = "111 - Nội tệ", TKCo = "112 - Công tác phí", SoTien = 10000000m,
                        NghiepVu = "N/A", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS",
                        TKNganHang = "97042564869", DonVi = "Kế toán", CongTrinh = "Đập thủy điện Hòa Bình",
                        HopDongBan = "HDB09233", MaThongKe = "TK0901229",
                    },
                    new
                    {
                        DienGiai = "Công nợ", TKNo = "111 - Nội tệ", TKCo = "112 - Công tác phí", SoTien = 10000000m,
                        NghiepVu = "N/A", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS",
                        TKNganHang = "97042564869", DonVi = "Kế toán", CongTrinh = "Đập thủy điện Hòa Bình",
                        HopDongBan = "HDB09233", MaThongKe = "TK0901229",
                    },
                    new
                    {
                        DienGiai = "Công nợ", TKNo = "111 - Nội tệ", TKCo = "112 - Công tác phí", SoTien = 10000000m,
                        NghiepVu = "N/A", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS",
                        TKNganHang = "97042564869", DonVi = "Kế toán", CongTrinh = "Đập thủy điện Hòa Bình",
                        HopDongBan = "HDB09233", MaThongKe = "TK0901229",
                    },
                    new
                    {
                        DienGiai = "Công nợ", TKNo = "111 - Nội tệ", TKCo = "112 - Công tác phí", SoTien = 10000000m,
                        NghiepVu = "N/A", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS",
                        TKNganHang = "97042564869", DonVi = "Kế toán", CongTrinh = "Đập thủy điện Hòa Bình",
                        HopDongBan = "HDB09233", MaThongKe = "TK0901229",
                    },
                })).EndOf(".panel").Render();
        }
    }
}
