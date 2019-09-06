using Components;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class ThuTienKhachHangHangLoat : ThuTienKhachHang
    {
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
                .TData.SmallInput("", "right").Value("0").EndOf(ElementType.td)
                .TData.Button("Lấy dữ liệu", "button small info", "fa fa-search").EndOf(ElementType.tr)
            .EndOf(ElementType.form)
            .Render();
        }
    }
}