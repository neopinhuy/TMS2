using MVVM;
using System;
using System.Collections.Generic;

namespace ThuChi
{
    public class DanhSachThuChi : IControl
    {
        public List<SelectListItem> Ranges { get; set; }
        public SelectListItem SelectedRange { get; set; }

        public List<SelectListItem> States { get; set; }
        public SelectListItem SelectedState { get; set; }

        public List<SelectListItem> Types { get; set; }
        public SelectListItem SelectedType { get; set; }

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
        }
        public void Render()
        {
            Html.Instance
                .Div.ClassName("grid").Div.ClassName("row marginTop5")
                .Div.ClassName("cell-md-8 cell-lg-8 cell-xl-8")
                .Div.Attr("data-role", "panel")
                .Attr("data-cls-panel", "shadow-1")
                .Form.Table.ClassName("subcompact")
                    .TBody.TRow
                        .TData.Text("Kỳ").End
                        .TData
                            .Dropdown(Ranges, SelectedRange, nameof(SelectListItem.Display), nameof(SelectListItem.Value))
                            .Attr("data-role", "select")
                            .End
                        .End
                        .TData.Text("Từ").End
                        .TData.Input.Value(DateTime.Now.ToString()).Attr("data-role", "input").Type("date").End.End
                        .TData.Text("Đến").End
                        .TData.Input.Value(DateTime.Now.ToString()).Attr("data-role", "input").Type("date").End.End
                    .End.TRow
                        .TData.Text("Trạng thái").End
                        .TData
                            .Dropdown(States, SelectedState, nameof(SelectListItem.Display), nameof(SelectListItem.Value))
                            .Attr("data-role", "select")
                            .End
                        .End
                        .TData.Text("Loại").End
                        .TData
                            .Dropdown(Types, SelectedType, nameof(SelectListItem.Display), nameof(SelectListItem.Value))
                            .Attr("data-role", "select")
                            .End
                        .End
                        .TData.End
                        .TData.Button.Text("Lấy dữ liệu").End.End
                .End.End.End.End
            .End.End.End // end of row

            .Div.ClassName("row marginTop5")
            .Div.ClassName("cell-md-8 cell-lg-8 cell-xl-8")
            .Div.Attr("data-role", "panel")
            .Attr("data-cls-panel", "shadow-1")
            .Table.ClassName("table striped table-border mt-4")
                .Attr("data-role", "table")
                .Attr("data-cls-table-top", "row flex-nowrap")
                .Attr("data-show-search", "false")
                .Attr("data-show-rows-steps", "false")
                .Attr("data-show-pagination", "false")
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
