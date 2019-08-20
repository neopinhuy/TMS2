using MVVM;

namespace ThuChi
{
    public class DanhSachThuChi : IControl
    {
        public void Render()
        {
            Html.Instance
                .Div.ClassName("grid").Div.ClassName("row marginTop20 marginLeft20")
                .Div.ClassName("cell-12")
                .Div.Attr("data-role", "panel").Attr("data-title-caption", "Tìm kiếm")
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
            .End.End.End // end of row

            .Div.ClassName("row marginTop20 marginLeft20").Div.ClassName("cell-12")
            .Div.Attr("data-role", "panel").Attr("data-title-caption", "Danh sách")
            .Table.ClassName("table striped table-border mt-4 subcompact")
                .Attr("data-role", "table")
                .Attr("data-cls-table-top", "row flex-nowrap")
                .Attr("data-cls-table-top", "row flex-nowrap")
                .Attr("data-cls-search", "cell-md-8")
                .Attr("data-cls-rows-count", "cell-md-4")
                .Attr("data-rows", "5")
                .Attr("data-rows-steps", "5, 10")
                .Attr("data-show-activity", "false")
                .Theader.TRow
                    .Th.Text("Ngày hạch toán").Attr("data-sortable", "true").End
                    .Th.Text("Ngày chứng từ").Attr("data-sortable", "true").End
                    .Th.Text("Số chứng từ").Attr("data-sortable", "true").End
                    .Th.Text("Diễn giải").Attr("data-sortable", "true").End
                    .Th.Text("Số tiền").Attr("data-sortable", "true").End
                    .Th.Text("Đối tượng").Attr("data-sortable", "true").End
                    .Th.Text("Lý do thu/chi").Attr("data-sortable", "true").End
                    .Th.Text("Ngày ghi sổ quỹ ").Attr("data-sortable", "true").End
                    .Th.Text("Loại chứng từ").Attr("data-sortable", "true").End
                .End.End
                .TBody
                .TRow
                    .TData.Text("20/08/2019").End.TData.Text("20/08/2019").End
                    .TData.Text("CT00001").End.TData.Text("Chung tu 00001").End
                    .TData.Text("10.000.000").End.TData.Text("Nhân Js").End
                    .TData.Text("Thu tiền công nợ").End.TData.Text("20/08/2019").End
                    .TData.Text("Công nợ").End
                .End
                .TRow
                    .TData.Text("20/08/2019").End.TData.Text("20/08/2019").End
                    .TData.Text("CT00001").End.TData.Text("Chung tu 00001").End
                    .TData.Text("10.000.000").End.TData.Text("Nhân Js").End
                    .TData.Text("Thu tiền công nợ").End.TData.Text("20/08/2019").End
                    .TData.Text("Công nợ").End
                .End
                .TRow
                    .TData.Text("20/08/2019").End.TData.Text("20/08/2019").End
                    .TData.Text("CT00001").End.TData.Text("Chung tu 00001").End
                    .TData.Text("10.000.000").End.TData.Text("Nhân Js").End
                    .TData.Text("Thu tiền công nợ").End.TData.Text("20/08/2019").End
                    .TData.Text("Công nợ").End
                .End
                .TRow
                    .TData.Text("20/08/2019").End.TData.Text("20/08/2019").End
                    .TData.Text("CT00001").End.TData.Text("Chung tu 00001").End
                    .TData.Text("10.000.000").End.TData.Text("Nhân Js").End
                    .TData.Text("Thu tiền công nợ").End.TData.Text("20/08/2019").End
                    .TData.Text("Công nợ").End
                .End
                .TRow
                    .TData.Text("20/08/2019").End.TData.Text("20/08/2019").End
                    .TData.Text("CT00001").End.TData.Text("Chung tu 00001").End
                    .TData.Text("10.000.000").End.TData.Text("Nhân Js").End
                    .TData.Text("Thu tiền công nợ").End.TData.Text("20/08/2019").End
                    .TData.Text("Công nợ").End
                .End
                .TRow
                    .TData.Text("20/08/2019").End.TData.Text("20/08/2019").End
                    .TData.Text("CT00001").End.TData.Text("Chung tu 00001").End
                    .TData.Text("10.000.000").End.TData.Text("Nhân Js").End
                    .TData.Text("Thu tiền công nợ").End.TData.Text("20/08/2019").End
                    .TData.Text("Công nợ").End
                .End
            .End.End.End
            .End.End.End.Render();
        }
    }
}
