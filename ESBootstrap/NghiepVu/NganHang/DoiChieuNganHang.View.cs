using System;
using Components;
using MVVM;

namespace MisaOnline.NghiepVu.NganHang
{
    public partial class DoiChieuNganHang : Component
    {
        public override void Render()
        {
            if (IsExisted())
                return;
            Html.Instance.H2.Text(Title).End.Tab()
                .TabItem("Đối chiếu online", "DoiChieuOnline")
                .TabItem("Đối chiếu offline", "DoiChieuOffline").EndOf(ElementType.ul);

            DoiChieuOnline();
            DoiChieuOffline();
        }

        private void DoiChieuOnline()
        {
            Html.Instance.TabContent().Panel()
                .Grid().GridRow().GridCell(8).MarginRem(Direction.top, 0.5m)
                .Panel("Lọc")
                .Table
                    .TBody
                    .TRow
                        .TData.Text("TK ngân hàng").EndOf(ElementType.td)
                        .TData.SmallInput().Value("01293129 - Nhân JS").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Kỳ").EndOf(ElementType.td)
                        .TData.SmallDropDown(KySelectList, KySelectList[0], "Display", "Value").EndOf(ElementType.td)
                        .TData.Text("Từ").EndOf(ElementType.td)
                        .TData.SmallDatePicker(DateTime.Now.ToString()).EndOf(ElementType.td)
                        .TData.Text("Đến").EndOf(ElementType.td)
                        .TData.SmallDatePicker(DateTime.Now.ToString()).EndOf(ElementType.td)
                        .TData.Text("Loại tiền").EndOf(ElementType.td)
                        .TData.SmallDropDown(Currencies, Currencies[0], "Display", "Value").EndOf(ElementType.td)
                        .TData.Button("Lấy dữ liệu")
                    .EndOf(".row")
                    .GridRow().GridCell(12)
                    .Table(DoiChieuOnlineHeaders, DoiChieuData)
                    .EndOf(".row")

                .GridRow().GridCell(12).Panel()
                .Table.TBody
                    .TRow.TData.EndOf(ElementType.td)
                    .TData.Text("Sổ phụ ngân hàng").EndOf(ElementType.td)
                    .TData.Text("Sổ kế toán tiền gởi").EndOf(ElementType.td)
                    .TData.Text("Chênh lệch").EndOf(ElementType.tr)

                    .TRow.TData.Text("Số dư đầu kỳ").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.tr)

                    .TRow.TData.Text("Tổng thu").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.tr)

                    .TRow.TData.Text("Tổng chi").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.tr)

                    .TRow.TData.Text("Số dư cuối kỳ").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.td)
                    .TData.SmallInput("0", "right").EndOf(ElementType.tr)
                .EndOf(".tabs-content").Render();
        }

        private void DoiChieuOffline()
        {
            // Html.Instance.EndOf(".row").GridRow().GridCell(12).ClassName("marginTop5")
            //     .Table(DoiChieuOnlineHeaders, Data)
            //     .EndOf(".panel").Render();
        }
    }
}
