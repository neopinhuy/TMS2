using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class ThuTienKhachHangHangLoat : ThuTienKhachHang
    {
        public override string ControlName { get; set; } = "ThuTienKhachHangHangLoat";
        public override string Title { get; set; } = "Thu tiền khách hàng hàng loạt";
        public List<SelectListItem> Ranges { get; set; } = new List<SelectListItem>
        {
            new SelectListItem { Value = 1, Display = "Tháng trước" },
            new SelectListItem { Value = 2, Display = "Quý trước" },
            new SelectListItem { Value = 3, Display = "Năm trước" },
        };

        public ThuTienKhachHangHangLoat() : base()
        {
            
        }

        protected override void RenderSearch()
        {
            Html.Instance.Form.Table.ClassName("subcompact marginTop5 table-border")
            .TRow
                .TData.Label.Text("Khoảng thời gian").EndOf(ElementType.td)
                .TData.ColSpan(3).SmallDropDown(Ranges, Ranges[0], "Display", "Value").EndOf(ElementType.td)
                .TData.Label.Text("Ngày thu tiền").EndOf(ElementType.td)
                .TData.SmallDatePicker().Value(DateTime.Now.ToString()).EndOf(ElementType.td)
                .TData.Label.Text("NV bán hàng").EndOf(ElementType.td)
                .TData.SmallInput().Value("Nhân JS").EndOf(ElementType.tr)
            .TRow
                .TData.Label.Text("Từ").EndOf(ElementType.td)
                .TData.SmallDatePicker().Value(DateTime.Now.ToString()).EndOf(ElementType.td)
                .TData.Label.Text("Đến").EndOf(ElementType.td)
                .TData.SmallDatePicker().Value(DateTime.Now.ToString()).EndOf(ElementType.td)
                .TData.Label.Text("Số tiền").EndOf(ElementType.td)
                .TData.SmallInput("right").Value("0").EndOf(ElementType.td)
                .TData.Button("Lấy dữ liệu", "button small info", "fa fa-search").EndOf(ElementType.tr)
            .EndOf(".panel")
            .Render();
        }
    }
}