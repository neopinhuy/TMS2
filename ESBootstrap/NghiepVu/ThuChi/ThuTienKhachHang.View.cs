using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.ThuChi
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
            Common.PhuongThucThanhToan(Currencies);
            RenderSearch();
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
            Html.Instance.Ul.Attr("data-role", "tabs").Attr("data-expand", "true").Margin(Direction.top, 5)
                .Li.ClassName("active").Anchor.Href("#chungTuCongNo").Text("Chứng từ công nợ").EndOf(ElementType.ul)
                .Div.ClassName("tabs-content")
                    .Div.Id("chungTuCongNo")
                    .Table(ChungTuHeader, ChungTu)
                    .Button("Thu tiền", "button small primary marginTop5", "mif-floppy-disk")
                    .End
                .Render();
        }
    }

}