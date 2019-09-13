using System;
using System.Collections.Generic;
using Bridge;
using Components;
using MVVM;

namespace LogOne.NghiepVu.NganHang
{
    public partial class ThuTienKhachHang : Component
    {
        public override void Render()
        {
            if (IsExisted())
                return;
            Html.Instance.H2.Text(Title).End.Render();
            Common.PhuongThucThanhToan(Currencies);
            ThongTinChung();
            HoachToan();
        }

        private void ThongTinChung()
        {
            Html.Instance
                .Grid().GridRow().ClassName("marginTop5").GridCell(12)
                .Panel()
                .Table.Style("width: 100%")
                    .TBody
                    .TRow
                        .TData.Text("Khách hàng").EndOf(ElementType.td)
                        .TData.SmallInput().Value("Nhân JS").EndOf(ElementType.td)
                        .TData.Text("Ngày thu tiền").EndOf(ElementType.td)
                        .TData.SmallDatePicker(DateTime.Now.ToString()).EndOf(ElementType.td)
                        .TData.Button("Lấy dữ liệu", "button info small", "fa fa-search").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Nhân viên bán hàng").EndOf(ElementType.td)
                        .TData.SmallInput("Lan Anh").EndOf(ElementType.td)
                        .TData.Text("Số tiền").EndOf(ElementType.td)
                        .TData.SmallInput("20.000.000").EndOf(ElementType.tr)
                .EndOf(".row").Render();
        }

        private void HoachToan()
        {
            Html.Instance.EndOf(".row").GridRow().GridCell(12).ClassName("marginTop5")
                .Table(Headers, Data)
                .EndOf(".panel").Render();
        }
    }
}
