using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class ThuTienKhachHang : Component
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
                    DienGiai = "Chứng từ hóa đơn", HanThanhToan = "20/08/2020",
                    SoPhaiThu = "11.000.000", SoChuaThu = "9.000.000", SoThu = "2.000.000", TKPhaiThu = "162", DieuKhoanTT = "",
                    TyLeChietKhau = "0", TienChietKhau = "0", TKChietKhau = ""
                }
            });
            ChungTu.AddRange(ChungTu.Data);
            ChungTu.AddRange(ChungTu.Data);
            ChungTu.AddRange(ChungTu.Data);
            ChungTu.AddRange(ChungTu.Data);
        }
    }

}