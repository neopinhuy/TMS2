using Components;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class NopThue : Component
    {
        public override void Render()
        {
            if (IsExisted()) return;
            PhuongThucThanhToan();
            CacLoaiThue();
            ChungTuMuaHang();
        }

        protected void PhuongThucThanhToan()
        {
            Html.Instance.H2.Text(Title).End
                .Form.ClassName("middle").Table.TRow
                .TData.Label.Text("Ngày nộp thuế").EndOf(ElementType.td)
                .TData.SmallDatePicker(DateTime.Now.ToString()).EndOf(ElementType.td)
                .TData.Label.Text("Phương thức thanh toán").EndOf(ElementType.td)
                .TData.SmallRadio("phuongThucTT", "Tiền gửi").EndOf(ElementType.td)
                .TData.SmallRadio("phuongThucTT", "Tiền mặt").EndOf(ElementType.td)
                .EndOf(ElementType.form);
        }

        protected void CacLoaiThue()
        {
            Html.Instance.Panel().Form.ClassName("middle").Table.TRow
                .TData.SmallCheckbox("Thuế nhập khẩu", true).EndOf(ElementType.td)
                .TData.SmallCheckbox("Thuế TTĐB", true).EndOf(ElementType.td)
                .TData.SmallCheckbox("Thuế BVMT", true).EndOf(ElementType.td)
                .TData.SmallCheckbox("Thuế GTGT", true).Event(Bridge.Html5.EventType.Change, ChangeGTGT).EndOf(ElementType.td)
            .End.TRow
                .TData.ColSpan(3).SmallCheckbox("Không lấy thuế GTGT hàng nhập khẩu có TKĐƯ thuế GTGT là 133").EndOf(ElementType.td)
            .End
            .EndOf(".panel");
        }

        private void ChangeGTGT(Bridge.Html5.Event e)
        {
            if (e.Target["checked"].Cast<bool>())
            {
                ChungTuHeader.AddRange(ThueGTGT);
            }
            else
            {
                ThueGTGT.ForEach(ChungTuHeader.Remove);
            }
        }

        protected void ChungTuMuaHang()
        {
            Html.Instance.Ul.Attr("data-role", "tabs").Attr("data-expand", "true").Margin(Direction.top, 5)
                .Li.ClassName("active").Anchor.Href("#chungMuaHang").Text("Chứng từ mua hàng").EndOf(ElementType.ul)
                .Div.ClassName("tabs-content")
                    .Div.Id("chungMuaHang")
                    .Table(ChungTuHeader, ChungTu)
                    .Button("Nộp thuế", "button small primary marginTop5", "fa fa-check").End
                    .Button("Trợ giúp", "button small primary marginTop5", "fa fa-question-circle").Margin(Direction.left, 5).End
                .Render();
        }
    }
}