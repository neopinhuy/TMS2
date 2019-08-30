using Components;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class NopThue : Component
    {
        public override string ControlName { get; set; } = "NopThue";
        public override string Title { get; set; } = "Nộp thuế";
        public ObservableArray<Header<object>> ChungTuHeader { get; set; }
        public ObservableArray<object> ChungTu { get; set; }

        public NopThue()
        {
            ChungTuHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Ngày chứng từ", FieldName = "NgayChungTu" },
                new Header<object> { HeaderText = "Số chứng từ", FieldName = "SoChungTu" },
                new Header<object> { HeaderText = "Số hóa đơn", FieldName = "SoHoaDon" },
                new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                new Header<object> { HeaderText = "Hạn thanh toán", FieldName = "HanThanhToan" },
                new Header<object> { HeaderText = "Số phải thu", FieldName = "SoPhaiThu" },
                new Header<object> { HeaderText = "Số chưa thu", FieldName = "SoChuaThu" },
                new Header<object> { HeaderText = "Số thu", FieldName = "SoThu" },
                new Header<object> { HeaderText = "TK phải thu", FieldName = "TKPhaiThu" },
                new Header<object> { HeaderText = "Điều khoản TT", FieldName = "DieuKhoanTT" },
                new Header<object> { HeaderText = "Tỷ lệ CK (%)", FieldName = "TyLeChietKhau" },
                new Header<object> { HeaderText = "Tiền chiết khấu", FieldName = "TienChietKhau" },
                new Header<object> { HeaderText = "TK chiết khấu", FieldName = "TKChietKhau" },
            });
            ChungTu = new ObservableArray<object>(new object[]
            {
                new
                {
                    NgayChungTu = "27/08/2019", SoChungTu = "CT00004", SoHoaDon = "HD909122",
                    DienGiai = "Chứng từ hóa đơn", HanThanhToan = "20/08/2020",
                    SoPhaiThu = "11.000.000", SoChuaThu = "9.000.000", SoThu = "2.000.000", TKPhaiThu = "162", DieuKhoanTT = "",
                    TyLeChietKhau = "0", TienChietKhau = "0", TKChietKhau = ""
                },
                new
                {
                    NgayChungTu = "27/08/2019", SoChungTu = "CT00004", SoHoaDon = "HD909122",
                    DienGiai = "Chứng từ hóa đơn", HanThanhToan = "20/08/2020",
                    SoPhaiThu = "11.000.000", SoChuaThu = "9.000.000", SoThu = "2.000.000", TKPhaiThu = "162", DieuKhoanTT = "",
                    TyLeChietKhau = "0", TienChietKhau = "0", TKChietKhau = ""
                },
                new
                {
                    NgayChungTu = "27/08/2019", SoChungTu = "CT00004", SoHoaDon = "HD909122",
                    DienGiai = "Chứng từ hóa đơn", HanThanhToan = "20/08/2020",
                    SoPhaiThu = "11.000.000", SoChuaThu = "9.000.000", SoThu = "2.000.000", TKPhaiThu = "162", DieuKhoanTT = "",
                    TyLeChietKhau = "0", TienChietKhau = "0", TKChietKhau = ""
                },
                new
                {
                    NgayChungTu = "27/08/2019", SoChungTu = "CT00004", SoHoaDon = "HD909122",
                    DienGiai = "Chứng từ hóa đơn", HanThanhToan = "20/08/2020",
                    SoPhaiThu = "11.000.000", SoChuaThu = "9.000.000", SoThu = "2.000.000", TKPhaiThu = "162", DieuKhoanTT = "",
                    TyLeChietKhau = "0", TienChietKhau = "0", TKChietKhau = ""
                },
            });
        }

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
                .TData.SmallCheckbox("Thuế nhập khẩu").EndOf(ElementType.td)
                .TData.SmallCheckbox("Thuế TTĐB").EndOf(ElementType.td)
                .TData.SmallCheckbox("Thuế BVMT").EndOf(ElementType.td)
                .TData.SmallCheckbox("Thuế GTGT").EndOf(ElementType.td)
            .End.TRow
                .TData.ColSpan(3).SmallCheckbox("Không lấy thuế GTGT hàng nhập khẩu có TKĐƯ thuế GTGT là 133").EndOf(ElementType.td)
            .End
            .EndOf(".panel");
        }

        protected void ChungTuMuaHang()
        {
            Html.Instance.Ul.Attr("data-role", "tabs").Attr("data-expand", "true").Margin(Direction.top, 5)
                .Li.ClassName("active").Anchor.Href("#chungMuaHang").Text("Chứng từ mua hàng").EndOf(ElementType.ul)
                .Div
                    .Div.Id("chungMuaHang")
                    .Table(ChungTuHeader, ChungTu).ClassName("margin0 borderTop0").End
                    .Button("Nộp thuế", "button small primary marginTop5", "fa fa-check").End
                    .Button("Trợ giúp", "button small primary marginTop5", "fa fa-question-circle").Margin(Direction.left, 5).End
                .Render();
        }
    }
}