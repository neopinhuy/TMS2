using Components;
using MVVM;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class PhieuThu : Component
    {
        public override string Title { get; set; } = "Phiếu thu";
        public List<SelectListItem> DepositReason { get; set; }
        public SelectListItem SelectedDepositReason { get; set; }
        public ObservableArray<Header<object>> Headers { get; set; }

        public PhieuThu()
        {
            Headers = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                new Header<object> { HeaderText = "TK nợ", FieldName = "TKNo" },
                new Header<object> { HeaderText = "TK có", FieldName = "TKCo" },
                new Header<object> { HeaderText = "Số tiền", FieldName = "SoTien" },
                new Header<object> { HeaderText = "Mã thống kê", FieldName = "MaThongKe" },
            });
            DepositReason = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Rút tiền gởi về nộp quỹ" },
                new SelectListItem { Value = 2, Display = "Thu hoàn thuế GTGT" },
                new SelectListItem { Value = 3, Display = "Thu hoàn ứng" },
                new SelectListItem { Value = 4, Display = "Thu khác" },
            };
            SelectedDepositReason = DepositReason[0];
        }
    }
}