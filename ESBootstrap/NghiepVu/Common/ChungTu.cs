using Components;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MisaOnline.NghiepVu.Common
{
    public static class ChungTu
    {
        public static void Render()
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
    }
}
