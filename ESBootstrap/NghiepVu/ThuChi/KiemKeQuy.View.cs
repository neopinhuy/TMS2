using Components;
using MisaOnline.NghiepVu;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class KiemKeQuy : Component
    {
        public override void Render()
        {
            if (IsExisted()) return;
            KiemKeThongTinChung();
            ChungTuMuaHang();
        }

        protected void KiemKeThongTinChung()
        {
            Html.Instance.Ul.Attr("data-role", "tabs").Attr("data-expand", "true")
                .Li.ClassName("active").Anchor.Href("#kiemKe").Text("Kiểm kê").EndOf(ElementType.li)
                .Li.ClassName("active").Anchor.Href("#thanhVienThamGia").Text("Thành viên tham gia").EndOf(ElementType.li)
                .Li.ClassName("active").Anchor.Href("#ketQuaXuLy").Text("Kết quả xử lý").EndOf(ElementType.ul)
                .Div.ClassName("tabs-content border-right-bottom-left bd-lightGray")
                .Style("top: -1px; padding: 5px 10px 0px;")
                    .Div.Id("kiemKe").Padding(Direction.top, 5)
                    .Grid().GridRow().GridCell(8)
                    .Panel("Thông tin chung")
                        .Table.Style("width: 100%;")
                        .TRow
                            .TData.Label.Text("Mục đích").EndOf(ElementType.td).TData.ColSpan(3).SmallInput().EndOf(ElementType.tr)
                        .TRow
                            .TData.Label.Text("Kiểm kê đến ngày").EndOf(ElementType.td)
                            .TData.SmallInput().EndOf(ElementType.td)
                            .TData.Label.Text("Loại tiền").EndOf(ElementType.td)
                            .TData.SmallInput("VND").Attr("readonly", "readonly").EndOf(ElementType.tr)
                        .TRow
                            .TData.Label.Text("Tham chiếu").EndOf(ElementType.td)
                            .TData.ColSpan(3).Button("", "button info small", "fa fa-search").ClassName("right").EndOf(ElementType.tr)
                .EndOf(".cell").Render();

            BienBan();
            NguoiThamGia();
            KetQuaXuLy();
        }

        private static void BienBan()
        {
            Html.Instance.GridCell(4).Panel("Biên bản").Table.TBody
                .TRow
                    .TData.Text("Số").End
                    .TData.SmallInput().Value("KKQ00001")
                .EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Ngày").End
                    .TData.SmallDatePicker().Value(DateTime.Now.ToString())
                .EndOf(ElementType.tr)
                .TRow
                    .TData.Text("Giờ").End
                    .TData.SmallInput()
                .EndOf(ElementType.tr)
                .EndOf("#kiemKe").Render();
        }

        private void NguoiThamGia()
        {
            Html.Instance.Div.Id("thanhVienThamGia").Padding(Direction.top, 5)
                .Table(NguoiThamGiaHeader, NguoiThamGiaData)
                .EndOf("#thanhVienThamGia")
                .Render();
        }

        private void KetQuaXuLy()
        {
            Html.Instance.Div.Id("ketQuaXuLy").Padding(Direction.top, 5)
                .Table.Style("width: 100%")
                    .TRow.TData.Style("width: 100px").Text("Lý do").End.TData.SmallInput().EndOf(ElementType.tr)
                    .TRow.TData.Text("Kết luận").End.TData.SmallInput().EndOf(ElementType.tr)
                    .TRow.TData.End.TData.SmallCheckbox("Đã xử lý chênh lệch")
                .EndOf(".tabs-content")
                .Render();
        }

        protected void ChungTuMuaHang()
        {
            Html.Instance.Ul.Attr("data-role", "tabs").Attr("data-expand", "true").Margin(Direction.top, 10)
                .Li.ClassName("active").Anchor.Href("#kiemKeThucTe").Text("Kiểm kê thực tế").EndOf(ElementType.ul)
                .Div.ClassName("tabs-content")
                    .Div.Id("kiemKeThucTe")
                    .Table(KiemKeHeader, KiemKeData)
                    .Table
                        .TRow
                            .TData.Text("I. Số dư theo sổ kế toán tiền mặt").EndOf(ElementType.td)
                            .TData.SmallInput("0", "right").Attr("readonly", "readonly").EndOf(ElementType.tr)
                        .TRow
                            .TData.Text("II. Số dư kiểm kê thực tế").EndOf(ElementType.td)
                            .TData.SmallInput("0", "right").Attr("readonly", "readonly").EndOf(ElementType.tr)
                        .TRow
                            .TData.Text("III. Số dư chênh lệch").EndOf(ElementType.td)
                            .TData.SmallInput("0", "right").Attr("readonly", "readonly").EndOf(ElementType.td)
                            .TData.ClassName("middle").Button("Đối chiếu...", "button small primary", "fa fa-check").EndOf(".tabs-content")
                .Render();
        }
    }
}