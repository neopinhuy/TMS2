using Extensions;
using MVVM;
using System;
using System.Collections.Generic;

namespace ThuChi
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
            Html.Instance.Div.ClassName("grid").Div.ClassName("row marginTop5")
                .Div.ClassName("cell-md-9 cell-lg-9 cell-xl-9")
                .Panel()
                .Form.Table.ClassName("subcompact")
                    .TBody.TRow
                        .TData.Text("Đối tượng").End
                        .TData.Input.Attr("data-role", "input").Value(DateTime.Now.ToString()).End.End
                        .TData.Attr("colspan", "3").Input.Attr("data-role", "input").Value("Nhân JS").End.End
                    .End.TRow
                        .TData.Text("Người nộp").End
                        .TData.Attr("colspan", "4").Input.Attr("data-role", "input").Value("Nhân JS").End.End
                    .End.TRow
                        .TData.Text("Địa chỉ").End
                        .TData.Attr("colspan", "4").Input.Attr("data-role", "input").Value("387A Lê văn khương").End.End
                    .End.TRow
                        .TData.Text("Lý do nộp").End
                        .TData.Attr("colspan", "3").Dropdown(DepositReason, SelectedDepositReason, "Display", "Value").Attr("data-role", "select").End.End
                        .TData.Input.Attr("data-role", "input").Value("Rút tiền gởi về nộp quỹ").End.End
                    .End.TRow
                        .TData.Text("Nhân viên thu").End
                        .TData.Input.Attr("data-role", "input").End.End
                        .TData.Text("Kèm theo").End
                        .TData.Input.Attr("data-role", "input").End.End
                        .TData.Span.Text("Chứng từ gốc").End.End
                .End.End.End.End
            .End.End.End.Render();
        }
    }

}