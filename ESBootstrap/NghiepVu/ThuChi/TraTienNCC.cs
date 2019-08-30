using Components;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class TraTienNCC : ThuTienKhachHang
    {
        public override string ControlName { get; set; } = "TraTienNCC";
        public override string Title { get; set; } = "Trả tiền NCC";

        public TraTienNCC(): base()
        {

        }

        public override void Render()
        {
            if (IsExisted())
                return;
            PhuongThucThanhToan();
            RenderChungTuCongNo();
        }

        protected override void RenderSearch()
        {
            Html.Instance.Form.Table.ClassName("subcompact marginTop5 table-border")
            .TRow
                .TData.Label.Text("Nhà cung cấp").End.End
                .TData.SmallInput().Value("NCC02923").End.End
                .TData.Label.Text("Ngày trả tiền").End.End
                .TData.SmallDatePicker().Value(DateTime.Now.ToString()).End.End
                .TData.Button("Lấy dữ liệu", "button small info", "fa fa-search").EndOf(ElementType.tr)
            .TRow
                .TData.Label.Text("NV mua hàng").End.End
                .TData.SmallInput().Value("NV34501").End.End
                .TData.Label.Text("Số tiền").EndOf(ElementType.td)
                .TData.SmallInput("right").Value("0").EndOf(".panel")
            .Render();
        }

        private void RenderChungTuCongNo()
        {
            Html.Instance.Ul.Attr("data-role", "tabs").Attr("data-expand", "true").Margin(Direction.top, 5)
                .Li.ClassName("active").Anchor.Href("chungTuCongNo").Text("Chứng từ công nợ").EndOf(ElementType.ul)
                .Div
                    .Div.Id("chungTuCongNo")
                    .Table(ChungTuHeader, ChungTu).ClassName("margin0 borderTop0").End
                    .Button("Trả tiền", "button small primary marginTop5", "mif-floppy-disk")
                    .End
                .Render();
        }
    }

}