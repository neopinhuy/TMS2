using Components;
using MVVM;
using System.Collections.Generic;

namespace LogOne.NghiepVu.ThuChi
{
    public partial class SoChiTienMat : Component
    {
        public override string Title { get; set; } = "Sổ chi tiền mặt";
        public List<SelectListItem> Ranges { get; set; }
        public SelectListItem SelectedRange { get; set; }
        public List<SelectListItem> States { get; set; }
        public SelectListItem SelectedState { get; set; }
        public List<SelectListItem> Types { get; set; }
        public SelectListItem SelectedType { get; set; }
        public ObservableArray<Header<object>> SoChiTienMatHeader { get; set; }
        public ObservableArray<object> SoChiTienMatData { get; set; }

        public SoChiTienMat()
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
            SoChiTienMatHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Ngày hạch toán", FieldName = "NgayHachToan" },
                new Header<object> { HeaderText = "Ngày chứng từ", FieldName = "NgayChungTu" },
                new Header<object> { HeaderText = "Sổ phiếu thu", FieldName = "SoPhieuThu" },
                new Header<object> { HeaderText = "Sổ phiếu chi", FieldName = "SoPhieuChi" },
                new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                new Header<object> { HeaderText = "Tài khoản", FieldName = "TaiKhoan" },
                new Header<object> { HeaderText = "TK đối ứng", FieldName = "TKDoiUng" },
                new Header<object> { HeaderText = "Nợ", FieldName = "No", GroupName = "Số phát sinh" },
                new Header<object> { HeaderText = "Có", FieldName = "Co", GroupName = "Số phát sinh" },
                new Header<object> { HeaderText = "Số tồn", FieldName = "SoTon" },
                new Header<object> { HeaderText = "Người nhận/Người nộp", FieldName = "NguoiNhanNop" },
                new Header<object> {
                    EditButton = true,
                    EditEvent = (x) => {
                        new KiemKeQuy().RenderAndFocus();
                    }
                },
            });
            SoChiTienMatData = new ObservableArray<object>(new object[] {
                new
                {
                    NgayHachToan = "20/08/2019", NgayChungTu = "10:12", SoPhieuThu = "KKQ123l2", SoPhieuChi = "20/07/2019",
                    DienGiai = "VNĐ", TaiKhoan = "Tại sao nhiều tiền vậy", TKDoiUng = "Lợi nhuận cao", No = "Nộp về NH",
                    Co = "VNĐ", SoTon = "Tại sao nhiều tiền vậy", NguoiNhanNop = "Lợi nhuận cao"
                },
            });
            SoChiTienMatData.AddRange(SoChiTienMatData.Data);
            SoChiTienMatData.AddRange(SoChiTienMatData.Data);
            SoChiTienMatData.AddRange(SoChiTienMatData.Data);
        }
    }
}
