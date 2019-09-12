﻿using System;
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
            Html.Instance.TabContent().Div.Id("DoiChieuOnline").Panel()
                .Grid().GridRow().GridCell(8).MarginRem(Direction.top, 1)
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
                .EndOf("#DoiChieuOnline").Render();
        }

        private void DoiChieuOffline()
        {
            Html.Instance.Div.Id("DoiChieuOffline").Panel()
                .Grid().GridRow().GridCell(8).MarginRem(Direction.top, 1)
                .Panel("Lọc")
                .Table
                    .TBody
                    .TRow
                        .TData.Text("TK ngân hàng").EndOf(ElementType.td)
                        .TData.SmallInput().Value("01293129 - Nhân JS").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Loại tiền").EndOf(ElementType.td)
                        .TData.SmallDropDown(Currencies, Currencies[0], "Display", "Value").EndOf(ElementType.td)
                        .TData.Text("Từ").EndOf(ElementType.td)
                        .TData.SmallDatePicker(DateTime.Now.ToString()).Disabled().EndOf(ElementType.td)
                        .TData.Text("Đến").EndOf(ElementType.td)
                        .TData.SmallDatePicker(DateTime.Now.ToString()).EndOf(ElementType.td)
                        .TData.Button("Lấy dữ liệu")
                .EndOf(".grid").EndOf(".panel")
                .Grid().MarginRem(Direction.top, 1.6m).GridRow().GridCell(6)
                    .Panel("Chứng từ thu tiền")
                    .Table(ChungTuThuTienHeaders, ChungTuThuTienData)
                    .Panel().Table.WidthPercentage(100)
                        .TRow.TData.Text("I. Số dư đầu kỳ").EndOf(ElementType.td)
                            .TData.TextAlign(Direction.right).Text("0").EndOf(ElementType.tr)
                        .TRow.TData.Text("II. Tổng tiền thu đối chiếu trong kỳ").EndOf(ElementType.td)
                            .TData.TextAlign(Direction.right).Text("0").EndOf(ElementType.tr)
                        .TRow.TData.Text("II. Tổng tiền chi đối chiếu trong kỳ").EndOf(ElementType.td)
                            .TData.TextAlign(Direction.right).Text("0").EndOf(".panel")
                    .Panel().Style("border-top: 0").Label.Text("Ngày đối chiếu gần nhất ").End
                        .Label.Text(DateTime.Now.ToString("dd/MM/yyyy")).End
                        .Button("Bỏ đối chiếu")
                .EndOf(".cell").GridCell(6)
                    .Panel("Chứng từ chi tiền")
                    .Table(ChungTuThuTienHeaders, ChungTuThuTienData)
                    .Panel().Table.WidthPercentage(100)
                        .TRow.TData.Text("IV. Số dư cuối kỳ sau khi đối chiếu (I + II - III):").EndOf(ElementType.td)
                            .TData.TextAlign(Direction.right).Text("0").EndOf(ElementType.tr)
                        .TRow.TData.Text("V. Số dư cuối kỳ trên sổ ngân hàng:").EndOf(ElementType.td)
                            .TData.Input.TextAlign(Direction.right).Value("0").EndOf(ElementType.tr)
                        .TRow.TData.Text("VI. Chênh lệch (IV - V):").EndOf(ElementType.td)
                            .TData.TextAlign(Direction.right).Text("0").EndOf(".panel")
                    .Panel().TextAlign(Direction.right).Style("border-top: 0")
                        .Button("Lưu tạm").End.Button("Xác nhận đối chiếu").Margin(Direction.left, 5).End
                .EndOf("#DoiChieuOffline");
        }
    }
}
