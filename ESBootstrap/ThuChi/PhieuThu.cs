using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.ThuChi
{
    public class PhieuThu : IControl
    {
        public List<SelectListItem> DepositReason { get; set; }
        public SelectListItem SelectedDepositReason { get; set; }

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

        public void Render()
        {
            ThongTinChung();
            ChungTu();
            HoachToan();
        }

        private void ThongTinChung()
        {
            Html.Instance.Grid().GridRow().ClassName("marginTop5")
                .Div.ClassName("cell-md-9 cell-lg-9 cell-xl-9")
                .Panel()
                .GridRow().GridCell(8)
                .Table.ClassName("subcompact")
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
                        .TData.Input.Attr("data-role", "input").Value("Rút tiền gởi về nộp quỹ").End.End
                    .End.TRow
                        .TData.Text("Nhân viên thu").End
                        .TData.SmallInput().End.End
                        .TData.Text("Kèm theo").End
                        .TData.SmallInput().End.End
                        .TData.Span.Text("Chứng từ gốc").End.End
                    .End.TRow
                        .TData.Text("Tham chiếu").End
                        .TData.Attr("colspan", "4").Button.ClassName("button small").Span.ClassName("fa fa-search")
                .EndOf(".cell").Render();
        }

        private void ChungTu()
        {
            Html.Instance.GridCell(4).Table.ClassName("subcompact").TBody
                .TRow
                    .TData.Text("Ngày hạch toán").End
                    .TData.SmallDatePicker().Value(DateTime.Now.ToString())
                .EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Ngày chứng từ").End
                    .TData.SmallDatePicker().Value(DateTime.Now.ToString())
                .EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Số chứng từ").End
                    .TData.SmallInput()
                .EndOf(ElementType.tr)
                .EndOf(".grid").Render();
        }

        private void HoachToan()
        {
            Console.WriteLine(Html.Context);
            Html.Instance.Grid().GridRow().GridCell(9)
                .Table(new ObservableArray<TableMetadata>(new TableMetadata[] {
                    new TableMetadata { Header = "Diễn giải", FieldName = "DienGiai" },
                    new TableMetadata { Header = "TK nợ", FieldName = "TKNo" },
                    new TableMetadata { Header = "TK có", FieldName = "TKCo" },
                    new TableMetadata { Header = "Số tiền", FieldName = "SoTien" },
                    new TableMetadata { Header = "Mã thống kê", FieldName = "MaThongKe" },
                }), new ObservableArray<object>(new object[] {
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