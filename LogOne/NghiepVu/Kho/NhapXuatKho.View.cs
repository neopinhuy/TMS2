using Components;
using MVVM;
using System;

namespace LogOne.NghiepVu.Kho
{
    public partial class NhapXuatKho : Component
    {
        public override void Render()
        {
            if (IsExisted())
            {
                return;
            }
            RenderSearch();
            RenderTables();
            ChiTiet();
        }

        private void RenderSearch()
        {
            Html.Instance
                .Grid().GridRow().ClassName("row marginTop5").GridCell(12)
                .Form.Table
                    .TBody.TRow
                        .TData.Text("Kỳ").EndOf(ElementType.td)
                        .TData.SmallDropDown(Ranges, SelectedRange, "Display", "Value").EndOf(ElementType.td)
                        .TData.Text("Từ").EndOf(ElementType.td)
                        .TData.SmallDatePicker().Value(DateTime.Now.ToString()).EndOf(ElementType.td)
                        .TData.Text("Đến").End
                        .TData.SmallDatePicker().Value(DateTime.Now.ToString()).EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Trạng thái").EndOf(ElementType.td)
                        .TData.SmallDropDown(States, SelectedState, "Display", "Value").EndOf(ElementType.td)
                        .TData.Text("Loại").EndOf(ElementType.td)
                        .TData.SmallDropDown(Types, SelectedType, "Display", "Value").EndOf(ElementType.td)
                        .TData.EndOf(ElementType.td)
                        .TData.Button.ClassName("button small info").Text("Lấy dữ liệu")
                .EndOf(".row").Render(); // end of row
        }

        private void RenderTables()
        {
            Html.Instance.Div.ClassName("row marginTop5")
                .GridCell(12)
                .Table(NhapXuatKhoHeader, NhapXuatKhoData).EndOf(".cell").Render();
        }

        private void ChiTiet()
        {
            Html.Instance.GridCell(12).ClassName("marginTop5")
                .Table(NhapXuatKhoChiTietHeader, NhapXuatKhoChiTietData).EndOf(".grid").Render();
        }
    }
}
