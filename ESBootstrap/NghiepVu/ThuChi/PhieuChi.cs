using Bridge.Html5;
using Components;
using MisaOnline.NghiepVu.Common;
using MVVM;
using System;
using System.Collections.Generic;
using ElementType = MVVM.ElementType;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class PhieuChi : Component
    {
        public override string ControlName { get; set; } = "PhieuChi";
        public override string Title { get; set; } = "Phiếu chi";
        public List<SelectListItem> WithdrawReason { get; set; } = new List<SelectListItem>()
        {
            new SelectListItem { Value = 1, Display = "Tạm ứng cho nhân viên" },
            new SelectListItem { Value = 2, Display = "Gởi tiền vào ngân hàng" },
            new SelectListItem { Value = 3, Display = "Chi khác" },
        };

        public PhieuChi()
        {
        }

        public override void Render()
        {
            if (IsExisted()) return;
            ThongTinChung();
            ChungTu.Render();
        }

        private void ThongTinChung()
        {
            Html.Instance.H1.Text("Phiếu chi").End.Panel()
                .Grid().GridRow().ClassName("marginTop5").GridCell(6)
                .Panel("")
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
    }

}