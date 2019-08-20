using MVVM;
using System;
using System.Collections.Generic;

namespace ThuChi
{
    public class DanhSachThuChi : IControl
    {
        public List<SelectListItem> KyHan { get; set; }
        public SelectListItem KyHanDuocChon { get; set; }

        public DanhSachThuChi()
        {
            KyHan = new List<SelectListItem>
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
            KyHanDuocChon = KyHan[0];
        }
        public void Render()
        {
            Html.Instance
                .Div.ClassName("grid").Div.ClassName("row marginTop20 marginLeft20")
                .Div.ClassName("cell-md-12 cell-lg-12 cell-xl-12")
                .Div.Attr("data-role", "panel").Attr("data-title-caption", "Tìm kiếm")
                .Form.Table.ClassName("subcompact")
                    .TBody.TRow
                        .TData.Text("Kỳ").End
                        .TData
                            .Dropdown(KyHan, KyHanDuocChon, nameof(SelectListItem.Display), nameof(SelectListItem.Value))
                            .Attr("data-role", "select")
                            .End
                        .End
                        .TData.Text("Từ").End
                        .TData.Input.Value(DateTime.Now.ToString()).Attr("data-role", "datepicker").End.End
                        .TData.Text("Đến").End
                        .TData.Input.Value("Hôm nay").Attr("data-role", "input").End.End
                    .End.TRow
                        .TData.Text("Trạng thái").End
                        .TData.Input.Value("Tất cả").Attr("data-role", "input").End.End
                        .TData.Text("Loại").End
                        .TData.Input.Value("Tất cả").Attr("data-role", "input").End.End
                        .TData.End
                        .TData.Button.Text("Lấy dữ liệu").End.End
                .End.End.End.End
            .End.End.End // end of row

            .Div.ClassName("row marginTop20 marginLeft20")
            .Div.ClassName("cell-md-12 cell-lg-12 cell-xl-12")
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
