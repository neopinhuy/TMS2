using Bridge.Html5;
using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class DanhSachThuChi : Component
    {
        public override string ControlName { get; set; } = "DanhSachThuChi";
        public override string Title { get; set; } = "Danh sách thu chi";
        public List<SelectListItem> Ranges { get; set; }
        public SelectListItem SelectedRange { get; set; }
        public List<SelectListItem> States { get; set; }
        public SelectListItem SelectedState { get; set; }
        public List<SelectListItem> Types { get; set; }
        public SelectListItem SelectedType { get; set; }

        public DanhSachThuChi()
        {
            Ranges = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Đầu tháng đến hiện tại" },
                new SelectListItem { Value = 2, Display = "Quý này" },
                new SelectListItem { Value = 3, Display = "Đầu quý đến hiện tại" },
                new SelectListItem { Value = 4, Display = "Năm nay" },
                new SelectListItem { Value = 5, Display = "Đầu năm đến hiện tại" },
                new SelectListItem { Value = 6, Display = "6 tháng đầu năm" },
                new SelectListItem { Value = 7, Display = "6 tháng cuối năm" },
                new SelectListItem { Value = 8, Display = "Tháng 1" },
                new SelectListItem { Value = 9, Display = "Tháng 2" },
                new SelectListItem { Value = 10, Display = "Tháng 3" },
                new SelectListItem { Value = 11, Display = "Tháng 4" },
                new SelectListItem { Value = 12, Display = "Tháng 5" },
                new SelectListItem { Value = 13, Display = "Tháng 6" },
                new SelectListItem { Value = 14, Display = "Tháng 7" },
                new SelectListItem { Value = 15, Display = "Tháng 8" },
                new SelectListItem { Value = 16, Display = "Tháng 9" },
                new SelectListItem { Value = 17, Display = "Tháng 10" },
                new SelectListItem { Value = 18, Display = "Tháng 11" },
                new SelectListItem { Value = 19, Display = "Tháng 12" },
                new SelectListItem { Value = 20, Display = "Quý 1" },
                new SelectListItem { Value = 21, Display = "Quý 2" },
                new SelectListItem { Value = 21, Display = "Quý 3" },
                new SelectListItem { Value = 22, Display = "Quý 4" },
            };
            SelectedRange = Ranges[0];
            States = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Đã ghi sổ" },
                new SelectListItem { Value = 2, Display = "Chưa ghi sổ" },
                new SelectListItem { Value = 3, Display = "Tất cả" },
            };
            SelectedState = States[2];

            Types = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Phiếu thu" },
                new SelectListItem { Value = 2, Display = "Phiếu chi" },
                new SelectListItem { Value = 3, Display = "Tất cả" },
            };
            SelectedType = Types[2];
        }

        public override void Render()
        {
            if (IsExisted()) return;
            RenderSearch();
            RenderTables();
            ChiTiet();
        }

        private void RenderSearch()
        {
            Html.Instance
                .Div.ClassName("grid").Div.ClassName("row marginTop5")
                .Div.ClassName("cell-md-9 cell-lg-9 cell-xl-9")
                .Panel()
                .Form.Table.ClassName("subcompact")
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
                .EndOf(".row").Render(); // end of row
        }

        private static void RenderTables()
        {
            Html.Instance.Div.ClassName("row marginTop5")
                .Div.ClassName("cell cell-md-9 cell-lg-9 cell-xl-9")
                .Panel()
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
                })).EndOf(".cell").Render();

        }

        private static void ChiTiet()
        {
            Html.Instance.Div.ClassName("cell-md-9 cell-lg-9 cell-xl-9")
                .Panel().ClassName("marginTop5")
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
                })).EndOf(".grid").Render();
        }
    }
}
