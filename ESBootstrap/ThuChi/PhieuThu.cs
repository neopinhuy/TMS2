using Extensions;
using MVVM;
using System;

namespace ESBootstrap.ThuChi
{

    public class PhieuThu : IControl
    {
        public PhieuThu()
        {
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
                        .TData.Input.Attr("data-role", "input").Value("Nhân JS").End.End
                    .End.TRow
                        .TData.Text("Người nộp").End
                        .TData.Attr("col-span", "2").Input.Attr("data-role", "input").Value("Nhân JS").End.End
                        .End
                        .TData.Input.Attr("data-role", "input").Value("Nhân JS").End.End
                .End.End.End.End
            .End.End.End.Render();
        }
    }

}