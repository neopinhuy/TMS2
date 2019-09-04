using Components;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class KiemKeQuy : Component
    {
        public override string ControlName { get; set; } = "KiemKeQuy";
        public override string Title { get; set; } = "Bảng kiểm kê quỹ";
        public ObservableArray<Header<object>> KiemKeHeader { get; set; }
        public ObservableArray<object> KiemKeData { get; set; }

        public KiemKeQuy()
        {
            KiemKeHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Mã nhân viên", FieldName = "MaNhanVien" },
                new Header<object> { HeaderText = "Tên nhân viên", FieldName = "TenNhanVien" },
                new Header<object> { HeaderText = "Đơn vị", FieldName = "DonVi" },
                new Header<object> { HeaderText = "Số tài khoản", FieldName = "SoTaiKhoan" },
                new Header<object> { HeaderText = "Tên ngân hàng", FieldName = "TenNganHang" },
                new Header<object> { HeaderText = "Số còn phải trả", FieldName = "SoConPhaiTra" },
                new Header<object> { HeaderText = "Số trả", FieldName = "SoTra" },
            });
            KiemKeData = new ObservableArray<object>(new object[]
            {
                new
                {
                    MaNhanVien = "NV09002", TenNhanVien = "Nhân JS", DonVi = "Bán hàng",
                    SoTaiKhoan = "00085569", TenNganHang = "Tiên phong bank", SoConPhaiTra = "10.000.000", SoTra = "10.000.000"
                },
            });
            KiemKeData.Add(KiemKeData.Data[0]);
            KiemKeData.Add(KiemKeData.Data[0]);
            KiemKeData.AddRange(KiemKeData.Data);
            KiemKeData.AddRange(KiemKeData.Data);
        }

        public override void Render()
        {
            if (IsExisted()) return;
            KiemKeThongTinChung();
            ChungTuMuaHang();
        }

        protected void KiemKeThongTinChung()
        {
            Html.Instance.Ul.Attr("data-role", "tabs").Attr("data-expand", "true").Margin(Direction.top, 5)
                .Li.ClassName("active").Anchor.Href("#kiemKe").Text("Kiểm kê").EndOf(ElementType.ul)
                .Div.ClassName("tabs-content")
                    .Div.Id("kiemKe")
                    .Panel("Thông tin chung")
                        .Table
                        .TRow
                            .TData.Label.Text("Mục đích").EndOf(ElementType.td).TData.ColSpan(3).SmallInput().EndOf(ElementType.tr)
                        .TRow
                            .TData.Label.Text("Kiểm kê đến ngày").EndOf(ElementType.td)
                            .TData.SmallInput().EndOf(ElementType.td)
                            .TData.Label.Text("Loại tiền").EndOf(ElementType.td)
                            .TData.SmallInput().Attr("readonly", "readonly").EndOf(ElementType.tr)
                        .TRow
                            .TData.Label.Text("Tham chiếu").EndOf(ElementType.td)
                            .TData.ColSpan(3).Button("", "button info small", "fa fa-search").ClassName("right").EndOf(ElementType.tr)
                .EndOf(".tabs-content").Render();
        }

        protected void ChungTuMuaHang()
        {
            Html.Instance.Ul.Attr("data-role", "tabs").Attr("data-expand", "true").Margin(Direction.top, 5)
                .Li.ClassName("active").Anchor.Href("#kiemKeThucTe").Text("Kiểm kê thực tế").EndOf(ElementType.ul)
                .Div.ClassName("tabs-content")
                    .Div.Id("kiemKeThucTe")
                    .Table(KiemKeHeader, KiemKeData)
                    .Table
                        .TRow
                            .TData.Text("I. Số dư theo sổ kế toán tiền mặt").EndOf(ElementType.td)
                            .TData.SmallInput("0", "right").EndOf(ElementType.tr)
                        .TRow
                            .TData.Text("II. Số dư kiểm kê thực tế").EndOf(ElementType.td)
                            .TData.SmallInput("0", "right").EndOf(ElementType.tr)
                        .TRow
                            .TData.Text("III. Số dư chênh lệch").EndOf(ElementType.td)
                            .TData.SmallInput("0", "right").EndOf(ElementType.td)
                            .TData.Button("Đối chiếu...", "button small primary", "fa fa-check").EndOf(".tabs-content")
                .Render();
        }
    }
}