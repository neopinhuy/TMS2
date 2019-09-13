using Components;
using MVVM;
using System;

namespace LogOne.NghiepVu.ThuChi
{
    public partial class ThuTienKhachHang : Component
    {
        public override void Render()
        {
            if (IsExisted())
                return;
            PhuongThucThanhToan();
            RenderChungTuCongNo();
        }

        protected void PhuongThucThanhToan()
        {
            Html.Instance.H2.Text(Title).End.Grid().GridRow().GridCell(9).Panel();
            Common.PhuongThucThanhToan(Currencies);
            RenderSearch();
            Html.Instance.EndOf(".grid");
        }

        protected virtual void RenderSearch()
        {
            Html.Instance.Table
            .TRow
                .TData.Label.Text("Khách hàng").End.End
                .TData.SmallInput().Value("KH00001").End.End
                .TData.Label.Text("Ngày thu tiền").End.End
                .TData.SmallDatePicker().Value(DateTime.Now.ToString()).End.End
                .TData.Button("Lấy dữ liệu", "button small info", "fa fa-search").EndOf(ElementType.tr)
            .TRow
                .TData.Label.Text("NV bán hàng").End.End
                .TData.SmallInput().Value("NV34501").End.End
                .TData.Label.Text("Số tiền").EndOf(ElementType.td)
                .TData.SmallInput("", "right").Value("0").EndOf(ElementType.table)
            .Render();
        }

        private void RenderChungTuCongNo()
        {
            Html.Instance.Tab().Margin(Direction.top, 10)
                .TabItem("Chứng từ công nợ", "chungTuCongNo", active: true).EndOf(ElementType.ul)
                .TabContent()
                    .Div.Id("chungTuCongNo")
                    .Table(ChungTuHeader, ChungTu)
                    .Button("Thu tiền", "button small primary marginTop5", "mif-floppy-disk")
                    .End
                .Render();
        }
    }

}