using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class ThuTienKhachHang : Component
    {
        public override string ControlName { get; set; } = "ThuTienKhachHang";
        public override string Title { get; set; } = "Thu tiền khách hàng";
        public List<SelectListItem> Currencies { get; set; }

        public ThuTienKhachHang()
        {
            Currencies = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Việt Nam đồng" },
                new SelectListItem { Value = 2, Display = "Đô la Mỹ" },
            };
        }

        public override void Render()
        {
            if (IsExisted())
                return;
            RenderPhuongThucTT();
            RenderSearch();
        }

        private void RenderPhuongThucTT()
        {
            Html.Instance.H2.Text(Title).End.Render();
            Html.Instance.Grid().GridRow().GridCell(12)
                .Form.ClassName("middle").Table.TRow
                .TData.Label.Text("Phương thức thanh toán").EndOf(ElementType.td)
                .TData.SmallRadio("PhuongThucThanhToan", "Tiền mặt").EndOf(ElementType.td)
                .TData.SmallRadio("PhuongThucThanhToan", "Tiền gởi").EndOf(ElementType.td)
                .TData.Label.Text("Loại tiền").EndOf(ElementType.td)
                .TData.SmallDropDown(Currencies, Currencies[0], "Display", "Value").EndOf(ElementType.td)
                .TData.Label.Text("Tỷ giá").EndOf(ElementType.td)
                .TData.SmallInput("right").Value("1.00").Attr("readonly", "readonly").EndOf(ElementType.td)
                .EndOf(".grid")
                .Render();
        }

        private void RenderSearch()
        {
            Html.Instance.Panel().Table.TRow
                .TData.Label.Text("Khách hàng").End.End
                .TData.SmallInput().Value("KH00001").End.End
                .TData.Label.Text("Ngày thu tiền").End.End
                .TData.SmallDatePicker().Value(DateTime.Now.ToString()).End.End
                .TData.Label.Text("NV bán hàng").End.End
                .TData.SmallInput().Value("NV34501").End.End
                .Render();
        }
    }

}