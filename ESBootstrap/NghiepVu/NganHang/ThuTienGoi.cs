using System;
using System.Collections.Generic;
using Bridge;
using Components;
using MVVM;
using Newtonsoft.Json;

namespace MisaOnline.NghiepVu.NganHang
{
    public partial class ThuTienGoi : Component
    {
        public override string Title { get; set; } = "Thu tiền gởi";
        public List<SelectListItem> DepositReason { get; set; }
        public SelectListItem SelectedDepositReason { get; set; }
        public ObservableArray<Header<object>> Headers { get; set; }
        public ObservableArray<object> Data { get; set; }

        public ThuTienGoi()
        {
            DepositReason = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Rút tiền gởi về nộp quỹ" },
                new SelectListItem { Value = 2, Display = "Thu hoàn thuế GTGT" },
                new SelectListItem { Value = 3, Display = "Thu hoàn ứng" },
                new SelectListItem { Value = 4, Display = "Thu khác" },
            };
            SelectedDepositReason = DepositReason[0];

            Headers = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                new Header<object> { HeaderText = "TK nợ", FieldName = "TKNo" },
                new Header<object> { HeaderText = "TK có", FieldName = "TKCo" },
                new Header<object> { HeaderText = "Số tiền", FieldName = "SoTien" },
                new Header<object> { HeaderText = "Nghiệp vụ", FieldName = "NghiepVu" },
                new Header<object> { HeaderText = "Đối tượng", FieldName = "DoiTuong" },
                new Header<object> { HeaderText = "Tên đối tượng", FieldName = "TenDoiTuong" },
                new Header<object> { HeaderText = "Đơn vị", FieldName = "DonVi" },
                new Header<object> { HeaderText = "Công trình", FieldName = "CongTrinh" },
                new Header<object> { HeaderText = "Đơn đặt hàng", FieldName = "DonDatHang" },
                new Header<object> { HeaderText = "Hợp đồng bán", FieldName = "HopDongBan" },
                new Header<object> { HeaderText = "Mã thống kê", FieldName = "MaThongKe" },
            });

            Data = new ObservableArray<object>(new object[] {
                new {
                    DienGiai = "Thu tiền gởi", TKNo = "123 - Gởi tiền", TKCo = "874 - ddd", SoTien = "15.000.000",
                    NghiepVu = "Thu tiền khách hàng trả cọc", DoiTuong = "Nhân JS",
                    TenDoiTuong = "Nhân JS", DonVi = "Kế toán", CongTrinh = "Vin Homes", DonDatHang = "DH129389",
                    HopDongBan = "HDB989899", MaThongKe = "MTK9i8989"
                }
            });
            Data.AddRange(Data.Data); Data.AddRange(Data.Data);
            Data.AddRange(Data.Data);
        }
    }
}
