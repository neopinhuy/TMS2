using Components;
using MVVM;
using System;

namespace LogOne.NghiepVu.ThuChi
{
    public partial class PhieuThu : Component
    {
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