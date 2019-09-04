using Components;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class TraLuong : Component
    {
        public override string ControlName { get; set; } = "TraLuong";
        public override string Title { get; set; } = "Trả lương";
        public ObservableArray<Header<object>> TraLuongHeader { get; set; }
        public ObservableArray<object> TraLuongData { get; set; }

        public TraLuong()
        {
            TraLuongHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Mã nhân viên", FieldName = "MaNhanVien" },
                new Header<object> { HeaderText = "Tên nhân viên", FieldName = "TenNhanVien" },
                new Header<object> { HeaderText = "Đơn vị", FieldName = "DonVi" },
                new Header<object> { HeaderText = "Số tài khoản", FieldName = "SoTaiKhoan" },
                new Header<object> { HeaderText = "Tên ngân hàng", FieldName = "TenNganHang" },
                new Header<object> { HeaderText = "Số còn phải trả", FieldName = "SoConPhaiTra" },
                new Header<object> { HeaderText = "Số trả", FieldName = "SoTra" },
            });
            TraLuongData = new ObservableArray<object>(new object[]
            {
                new
                {
                    MaNhanVien = "NV09002", TenNhanVien = "Nhân JS", DonVi = "Bán hàng",
                    SoTaiKhoan = "00085569", TenNganHang = "Tiên phong bank", SoConPhaiTra = "10.000.000", SoTra = "10.000.000"
                },
            });
            TraLuongData.Add(TraLuongData.Data[0]);
            TraLuongData.Add(TraLuongData.Data[0]);
            TraLuongData.AddRange(TraLuongData.Data);
            TraLuongData.AddRange(TraLuongData.Data);
        }

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
            Html.Instance.Ul.Attr("data-role", "tabs").Attr("data-expand", "true").Margin(Direction.top, 5)
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