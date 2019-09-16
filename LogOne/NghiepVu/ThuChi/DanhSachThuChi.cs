using Bridge.Html5;
using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace LogOne.NghiepVu.ThuChi
{
    public partial class DanhSachThuChi : Component
    {
        public override string Title { get; set; } = "Danh sách thu chi";
        public List<SelectListItem> Ranges { get; set; }
        public SelectListItem SelectedRange { get; set; }
        public List<SelectListItem> States { get; set; }
        public SelectListItem SelectedState { get; set; }
        public List<SelectListItem> Types { get; set; }
        public SelectListItem SelectedType { get; set; }
        public ObservableArray<Header<object>> ThuChiHeader { get; set; }
        public ObservableArray<object> ThuChiData { get; set; }

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
            ThuChiHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Ngày hạch toán", FieldName = "NgayHachToan", Sortable = true },
                new Header<object> { HeaderText = "Ngày chứng từ", FieldName = "NgayChungTu", Sortable = true },
                new Header<object> { HeaderText = "Số chứng từ", FieldName = "SoChungTu", Sortable = true },
                new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai", Sortable = true },
                new Header<object> { HeaderText = "Số tiền", FieldName = "SoTien", Sortable = true },
                new Header<object> { HeaderText = "Đối tượng", FieldName = "DoiTuong", Sortable = true },
                new Header<object> { HeaderText = "Lý do thu/chi", FieldName = "LyDoThuChi", Sortable = true },
                new Header<object> { HeaderText = "Ngày ghi sổ quỹ", FieldName = "NgayGhiSoQuy", Sortable = true },
                new Header<object> { HeaderText = "Loại chứng từ", FieldName = "LoaiChungTu", Sortable = true },
                new Header<object> {
                    EditButton = true,
                    EditEvent = (x) => {
                        new PhieuThu().RenderAndFocus();
                    }
                },
            });
            ThuChiData = new ObservableArray<object>(new object[] {
                new
                {
                    NgayHachToan = "20/08/2019", NgayChungTu = "20/08/2019", SoChungTu = "CT00001", DienGiai = "Chug tu 000001",
                    SoTien = "100.000.000", DoiTuong = "Nhân JS", LyDoThuChi = "Thu tiền công nợ", NgayGhiSoQuy = "20/08/2019", LoaiChungTu = "Công nợ"
                },
            });
            ThuChiData.AddRange(ThuChiData.Data);
            ThuChiData.AddRange(ThuChiData.Data);
            ThuChiData.AddRange(ThuChiData.Data);
        }
    }
}
