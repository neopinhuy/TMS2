using Components;
using MVVM;
using Direction = Components.Direction;
using ElementType = MVVM.ElementType;

namespace LogOne.NghiepVu.ThuChi
{
    public partial class PhieuChi : Component
    {
        public override void Render()
        {
            if (IsExisted()) return;
            ThongTinChung();
            Common.ChungTu();
            ChiTiet();
        }

        private void ThongTinChung()
        {
            Html.Instance.H2.Text(Title).End
                .Grid().GridRow().ClassName("marginTop5").GridCell(6)
                .Panel("Thông tin chung")
                .Table.TBody.TRow
                    .TData.Text("Đối tượng").End
                    .TData.SmallInput().Value("KH00001").EndOf(ElementType.td)
                    .TData.ColSpan(4).SmallInput().Value("Nhân JS").EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Người nhận").End
                    .TData.ColSpan(4).SmallInput().Value("Nhân JS").EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Địa chỉ").End
                    .TData.ColSpan(4).SmallInput().Value("387A Lê văn khương").EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Lý do nộp").End
                    .TData.SmallDropDown(WithdrawReason, WithdrawReason[0], "Display", "Value").EndOf(ElementType.td)
                    .TData.ColSpan(4).SmallInput().Value("Tạm ứng cho nhân viên").EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Nhân viên").End
                    .TData.SmallInput().End.End
                    .TData.Text("Kèm theo").End
                    .TData.SmallInput().End.End
                    .TData.Span.Text("Chứng từ gốc").EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Tham chiếu").End
                    .TData.ColSpan(4).Button
                        .ClassName("button small").Span.ClassName("fa fa-search")
                .EndOf(".cell").Render();
        }

        public void ChiTiet()
        {
            Html.Instance.EndOf(".row").GridRow().GridCell(12).Margin(Direction.top, 10)
                .Ul.Attr("data-role", "tabs").Attr("data-expand", "true")
                .Li.ClassName("active").Anchor.Href("#hachToan").Text("1. Hạch toán").EndOf(ElementType.li)
                .Li.Anchor.Href("#thue").Text("2. Thuế").EndOf(ElementType.ul)
                .Div.ClassName("tabs-content")
                    .Div.Id("hachToan")
                    .Table(HachToanHeader, HachToan)
                    .EndOf("#hachToan")
                    
                    .Div.Id("thue")
                    .Table(ThueHeader, Thue)
                    .EndOf("#thue")
                .Render();
        }
    }
}