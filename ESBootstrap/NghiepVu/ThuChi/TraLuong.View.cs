using Components;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class TraLuong : Component
    {
        public override void Render()
        {
            if (IsExisted()) return;
            PhuongThucThanhToan();
            ChungTuMuaHang();
        }

        protected void PhuongThucThanhToan()
        {
            Html.Instance.H2.Text(Title).End
                .Form.ClassName("middle").Table.TRow
                .TData.Label.Text("Ngày trả lương").EndOf(ElementType.td)
                .TData.SmallDatePicker(DateTime.Now.ToString()).EndOf(ElementType.td)
                .TData.Label.Text("Phương thức thanh toán").EndOf(ElementType.td)
                .TData.SmallRadio("phuongThucTT", "Ủy nhiệm chi").EndOf(ElementType.td)
                .TData.SmallRadio("phuongThucTT", "Tiền mặt").EndOf(ElementType.td)
                .EndOf(ElementType.form);
        }

        protected void ChungTuMuaHang()
        {
            Html.Instance.Tab().Margin(Direction.top, 5)
                .Li.ClassName("active").Anchor.Href("#traLuong").Text("Thông tin trả lương").EndOf(ElementType.ul)
                .Div.ClassName("tabs-content")
                    .Div.Id("traLuong")
                    .Table(TraLuongHeader, TraLuongData)
                    .Button("Trả lương", "button small primary marginTop5", "fa fa-check").End
                    .Button("Trợ giúp", "button small primary marginTop5", "fa fa-question-circle").Margin(Direction.left, 5).End
                .Render();
        }
    }
}