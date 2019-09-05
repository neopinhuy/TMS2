using Bridge.Html5;
using Components;
using MVVM;
using System;
using System.Collections.Generic;
using ElementType = MVVM.ElementType;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class PhieuThu : Component
    {
        public override string ControlName { get; set; } = "PhieuThu";
        public override string Title { get; set; } = "Phiếu thu";
        public List<SelectListItem> DepositReason { get; set; }
        public SelectListItem SelectedDepositReason { get; set; }
        public ObservableArray<Header<object>> Headers = new ObservableArray<Header<object>>(new Header<object>[] {
            new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
            new Header<object> { HeaderText = "TK nợ", FieldName = "TKNo" },
            new Header<object> { HeaderText = "TK có", FieldName = "TKCo" },
            new Header<object> { HeaderText = "Số tiền", FieldName = "SoTien" },
            new Header<object> { HeaderText = "Mã thống kê", FieldName = "MaThongKe" },
        });

        public PhieuThu()
        {
            DepositReason = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Rút tiền gởi về nộp quỹ" },
                new SelectListItem { Value = 2, Display = "Thu hoàn thuế GTGT" },
                new SelectListItem { Value = 3, Display = "Thu hoàn ứng" },
                new SelectListItem { Value = 4, Display = "Thu khác" },
            };
            SelectedDepositReason = DepositReason[0];
        }

        public override void Render()
        {
            if (IsExisted()) return;
            ThongTinChung();
            Common.ChungTu();
            HoachToan();
        }

        private void ThongTinChung()
        {
            Html.Instance.H2.Text(Title).End
                .Grid().GridRow().ClassName("marginTop5").GridCell(6)
                .Panel("Thông tin chung")
                .Table
                    .TBody.TRow
                        .TData.Text("Đối tượng").End
                        .TData.SmallDatePicker().Value(DateTime.Now.ToString()).End.End
                        .TData.Attr("colspan", "3").SmallInput().Value("Nhân JS").End.End
                    .End.TRow
                        .TData.Text("Người nộp").End
                        .TData.Attr("colspan", "4").SmallInput().Value("Nhân JS").End.End
                    .End.TRow
                        .TData.Text("Địa chỉ").End
                        .TData.Attr("colspan", "4").SmallInput().Value("387A Lê văn khương").End.End
                    .End.TRow
                        .TData.Text("Lý do nộp").End
                        .TData.Attr("colspan", "3").SmallDropDown(DepositReason, SelectedDepositReason, "Display", "Value").End.End
                        .TData.SmallInput().Value("Rút tiền gởi về nộp quỹ").End.End
                    .End.TRow
                        .TData.Text("Nhân viên thu").End
                        .TData.SmallInput().End.End
                        .TData.Text("Kèm theo").End
                        .TData.SmallInput().End.End
                        .TData.Span.Text("Chứng từ gốc").End.End
                    .End.TRow
                        .TData.Text("Tham chiếu").End
                        .TData.Attr("colspan", "4").Button
                        .ClassName("button small").Span.ClassName("fa fa-search")
                .EndOf(".cell").Render();
        }

        private void HoachToan()
        {
            Html.Instance.EndOf(".row").GridRow().GridCell(12).ClassName("marginTop5")
                .Table(Headers, new ObservableArray<object>(new object[] {
                    new { DienGiai = "21/08/2019", TKNo = "111 - Ngoại tệ", TKCo = "112 - VND", SoTien = "15.000.123", MaThongKe = "123 9999" },
                    new { DienGiai = "21/08/2019", TKNo = "111 - Ngoại tệ", TKCo = "112 - VND", SoTien = "15.000.123", MaThongKe = "123 9999" },
                    new { DienGiai = "21/08/2019", TKNo = "111 - Ngoại tệ", TKCo = "112 - VND", SoTien = "15.000.123", MaThongKe = "123 9999" },
                    new { DienGiai = "21/08/2019", TKNo = "111 - Ngoại tệ", TKCo = "112 - VND", SoTien = "15.000.123", MaThongKe = "123 9999" },
                    new { DienGiai = "21/08/2019", TKNo = "111 - Ngoại tệ", TKCo = "112 - VND", SoTien = "15.000.123", MaThongKe = "123 9999" },
                    new { DienGiai = "21/08/2019", TKNo = "111 - Ngoại tệ", TKCo = "112 - VND", SoTien = "15.000.123", MaThongKe = "123 9999" },
                    new { DienGiai = "21/08/2019", TKNo = "111 - Ngoại tệ", TKCo = "112 - VND", SoTien = "15.000.123", MaThongKe = "123 9999" },
                    new { DienGiai = "21/08/2019", TKNo = "111 - Ngoại tệ", TKCo = "112 - VND", SoTien = "15.000.123", MaThongKe = "123 9999" },
                }))
                .EndOf(".panel").Render();
        }
    }
}