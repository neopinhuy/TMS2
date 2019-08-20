using MVVM;

namespace ThuChi
{
    public class DanhSachThuChi : IControl
    {
        public void Render()
        {
            Html.Instance
                .Div.ClassName("grid").Div.ClassName("row")
                .Div.ClassName("cell-12")
                .Form.Table.ClassName("subcompact")
                    .TBody.TRow
                        .TData.Text("Kỳ").End
                        .TData.Input.Value("Đầu tháng đến hiện tại").End.End
                        .TData.Text("Từ").End
                        .TData.Input.Value("Đầu tháng").End.End
                        .TData.Text("Đến").End
                        .TData.Input.Value("Hôm nay").End.End
                    .End.TRow
                        .TData.Text("Trạng thái").End
                        .TData.Input.Value("Tất cả").End.End
                        .TData.Text("Loại").End
                        .TData.Input.Value("Tất cả").End.End
                        .TData.End
                        .TData.Button.Text("Lấy dữ liệu").End.End
                .End.End.End.End
            .End.End // end of row

            .Div.ClassName("row").Div.ClassName("cell-12")
            .Table.ClassName("table")
                .Attr("data-role", "table")
                .Theader.TRow
                    .Th.Text("Ngày hạch toán").End
                    .Th.Text("Ngày chứng từ").End
                    .Th.Text("Số chứng từ").End
                    .Th.Text("Diễn giải").End
                    .Th.Text("Số tiền").End
                    .Th.Text("Đối tượng").End
                    .Th.Text("Lý do thu/chi").End
                    .Th.Text("Ngày ghi sổ quỹ ").End
                    .Th.Text("Loại chứng từ").End
                .End.End
                .TBody.TRow
                .End.End
            .End.End
            .End.End.Render();
        }
    }
}
