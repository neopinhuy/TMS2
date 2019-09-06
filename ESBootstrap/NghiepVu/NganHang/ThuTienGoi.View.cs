using Components;
using MVVM;

namespace MisaOnline.NghiepVu.NganHang
{
    public partial class ThuTienGoi : Component
    {
        public override void Render()
        {
            if (IsExisted())
                return;
            ThongTinChung();
            Common.ChungTu();
            HoachToan();
        }

        private void ThongTinChung()
        {
            Html.Instance.H2.Text(Title).End
                .Grid().GridRow().ClassName("marginTop5").GridCell(8)
                .Panel("Thông tin chung")
                .Table.Style("width: 100%")
                    .TBody
                    .TRow
                        .TData.Text("Đối tượng").EndOf(ElementType.td)
                        .TData.SmallInput().Value("Nhân JS").EndOf(ElementType.td)
                        .TData.SmallInput().Value("Nhân JS").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Địa chỉ").EndOf(ElementType.td)
                        .TData.ColSpan(2).SmallInput().Value("387A Lê Văn Khương").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Nộp vào TK").EndOf(ElementType.td)
                        .TData.SmallInput().Value("00057898").EndOf(ElementType.td)
                        .TData.SmallInput().Value("Lan Anh").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Lý do thu").EndOf(ElementType.td)
                        .TData.SmallDropDown(DepositReason, SelectedDepositReason, "Display", "Value").EndOf(ElementType.td)
                        .TData.SmallInput().PlaceHolder("Thu từ...").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Tham chiếu").EndOf(ElementType.td)
                        .TData.ColSpan(2).Button.ClassName("button info small").Span.ClassName("fa fa-search")
                .EndOf(".cell").Render();
        }

        private void HoachToan()
        {
            Html.Instance.EndOf(".row").GridRow().GridCell(12).ClassName("marginTop5")
                .Table(Headers, Data)
                .EndOf(".panel").Render();
        }
    }
}
