using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu
{
    public static class Common
    {
        public static void ChungTu()
        {
            Html.Instance.GridCell(4).Panel("Chứng từ").Table.TBody
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
                .EndOf(".cell").Render();
        }

        public static void PhuongThucThanhToan(List<SelectListItem> Currencies)
        {
            Html.Instance.Panel()
                .Form.ClassName("middle").Table.ClassName("subcompact").TRow
                    .TData.Label.Text("Phương thức thanh toán").EndOf(ElementType.td)
                    .TData.SmallRadio("PhuongThucThanhToan", "Tiền mặt").EndOf(ElementType.td)
                    .TData.SmallRadio("PhuongThucThanhToan", "Tiền gởi").EndOf(ElementType.td)
                    .TData.Label.Text("Loại tiền").EndOf(ElementType.td)
                    .TData.SmallDropDown(Currencies, Currencies[0], "Display", "Value").EndOf(ElementType.td)
                    .TData.Label.Text("Tỷ giá").EndOf(ElementType.td)
                    .TData.SmallInput("", "right").Value("1.00").Attr("readonly", "readonly").EndOf(ElementType.td)
                    .EndOf(ElementType.form)
                .Hr.Render();
        }
    }
}
