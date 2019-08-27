using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class ThuTienKhachHang : Component
    {
        public override string ControlName { get; set; } = "ThuTienKhachHang";
        public override string Title { get; set; } = "Thu tiền khách hàng";
        public List<SelectListItem> Currencies { get; set; }
        public ObservableArray<Header<object>> ChungTuHeader { get; set; }
        public ObservableArray<object> ChungTu { get; set; }

        public ThuTienKhachHang()
        {
            Currencies = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Việt Nam đồng" },
                new SelectListItem { Value = 2, Display = "Đô la Mỹ" },
            };
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
                    DienGiai = "Chứng từ hóa đơn của ", HanThanhToan = "20/08/2020",
                    SoPhaiThu = "11.000.000", SoChuaThu = "9.000.000", SoThu = "2.000.000", TKPhaiThu = "162", DieuKhoanTT = "",
                    TyLeChietKhau = "0", TienChietKhau = "0", TKChietKhau = ""
                },
                new
                {
                    NgayChungTu = "27/08/2019", SoChungTu = "CT00004", SoHoaDon = "HD909122",
                    DienGiai = "Chứng từ hóa đơn của ", HanThanhToan = "20/08/2020",
                    SoPhaiThu = "11.000.000", SoChuaThu = "9.000.000", SoThu = "2.000.000", TKPhaiThu = "162", DieuKhoanTT = "",
                    TyLeChietKhau = "0", TienChietKhau = "0", TKChietKhau = ""
                },
            });
        }

        public override void Render()
        {
            if (IsExisted())
                return;
            RenderPhuongThucTT();
            RenderSearch();
            RenderChungTuCongNo();
        }

        private void RenderPhuongThucTT()
        {
            Html.Instance.H2.Text(Title).End.Render();
            Html.Instance.Grid().GridRow().GridCell(12)
                .Form.ClassName("middle").Table.ClassName("subcompact").TRow
                    .TData.Label.Text("Phương thức thanh toán").EndOf(ElementType.td)
                    .TData.SmallRadio("PhuongThucThanhToan", "Tiền mặt").EndOf(ElementType.td)
                    .TData.SmallRadio("PhuongThucThanhToan", "Tiền gởi").EndOf(ElementType.td)
                    .TData.Label.Text("Loại tiền").EndOf(ElementType.td)
                    .TData.SmallDropDown(Currencies, Currencies[0], "Display", "Value").EndOf(ElementType.td)
                    .TData.Label.Text("Tỷ giá").EndOf(ElementType.td)
                    .TData.SmallInput("right").Value("1.00").Attr("readonly", "readonly").EndOf(ElementType.td)
                    .EndOf(ElementType.tr)
                .EndOf(".grid")
                .Render();
        }

        private void RenderSearch()
        {
            Html.Instance.Panel().Table.ClassName("subcompact").TRow
                    .TData.Label.Text("Khách hàng").End.End
                    .TData.SmallInput().Value("KH00001").End.End
                    .TData.Label.Text("Ngày thu tiền").End.End
                    .TData.SmallDatePicker().Value(DateTime.Now.ToString()).End.End
                    .TData.Button("Lấy dữ liệu", "button small info", "fa fa-search").EndOf(ElementType.tr)
                .TRow
                    .TData.Label.Text("NV bán hàng").End.End
                    .TData.SmallInput().Value("NV34501").End.End
                    .TData.Label.Text("Số tiền").EndOf(ElementType.td)
                    .TData.SmallInput("right").Value("0").EndOf(".panel")
                .Render();
        }

        private void RenderChungTuCongNo()
        {
            Html.Instance.Panel().Ul.Attr("data-role", "tabs").Attr("data-expand", "true")
                .Li.ClassName("active").Anchor.Href("chungTuCongNo").Text("Chứng từ công nợ").EndOf(ElementType.ul)
                .Div
                    .Div.Id("chungTuCongNo")
                    .Table(ChungTuHeader, ChungTu).ClassName("margin0 borderTop0").End
                    .Button("Thu tiền", "button small primary marginTop5", "mif-floppy-disk")
                    .End
                .Render();
        }
    }

}