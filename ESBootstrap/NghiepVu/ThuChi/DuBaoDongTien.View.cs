using Components;
using MVVM;
using System;
using Direction = Components.Direction;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class DuBaoDongTien : Component
    {
        public override void Render()
        {
            if (IsExisted()) return;
            RenderHeader();
            RenderTables();
        }

        private void RenderHeader()
        {
            Html.Instance.Div.MarginRem(Direction.top, 1)
                .Table.TRow
                .TData.Label.Text("Đến ngày").EndOf(ElementType.td)
                .TData.SmallDatePicker(DateTime.Now.ToString()).EndOf(ElementType.td)
                .TData.Button("Lấy dữ liệu").EndOf(ElementType.div).Render();
        }

        private void RenderTables()
        {
            Html.Instance.Div
                .Table(SoChiTienMatHeader, SoChiTienMatData).MarginRem(Direction.top, 1);
        }
    }
}
