using System;
using System.Collections.Generic;
using Bridge;
using Components;
using MVVM;
using Newtonsoft.Json;

namespace MisaOnline.NghiepVu.NganHang
{
    public partial class DoiChieuNganHang : Component
    {
        public override string Title { get; set; } = "Đối chiếu ngân hàng";
        public List<SelectListItem> KySelectList { get; set; }
        public ObservableArray<Header<object>> DoiChieuOnlineHeaders { get; set; }
        public ObservableArray<object> DoiChieuData { get; set; }
        public List<SelectListItem> Currencies = new List<SelectListItem>
        {
            new SelectListItem { Value = 1, Display = "Việt Nam đồng" },
            new SelectListItem { Value = 2, Display = "Đô la Mỹ" },
        };

        public DoiChieuNganHang()
        {
            KySelectList = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Đầu tháng đến hiện tại" },
                new SelectListItem { Value = 2, Display = "Quý này" },
                new SelectListItem { Value = 3, Display = "Đầu quý đến hiện tại" },
            };

            DoiChieuOnlineHeaders = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Đã khớp đối chiếu", FieldName = "DaKhopDoiChieu" },
                new Header<object> { HeaderText = "Loại giao dịch", FieldName = "LoaiGiaoDich" },
                new Header<object> { HeaderText = "Số giao dịch", FieldName = "SPNH_SoGiaoDich", GroupName = "Sổ phụ ngân hàng" },
                new Header<object> { HeaderText = "Ngày giao dịch", FieldName = "SPNH_NgayGiaoDich", GroupName = "Sổ phụ ngân hàng" },
                new Header<object> { HeaderText = "Số tiền thu", FieldName = "SPNH_SoTienThu", GroupName = "Sổ phụ ngân hàng" },
                new Header<object> { HeaderText = "Số tiền chi", FieldName = "SPNH_SoTienChi", GroupName = "Sổ phụ ngân hàng" },
                new Header<object> { HeaderText = "Nội dung", FieldName = "SPNH_NoiDung", GroupName = "Sổ phụ ngân hàng" },
                
                new Header<object> { HeaderText = "Số chứng từ", FieldName = "SKTTG_SoGiaoDich", GroupName = "Sổ kế toán tiền gởi" },
                new Header<object> { HeaderText = "Ngày hạch toán", FieldName = "SKTTG_NgayHachToan", GroupName = "Sổ kế toán tiền gởi" },
                new Header<object> { HeaderText = "Số tiền thu", FieldName = "SKTTG_SoTienThu", GroupName = "Sổ kế toán tiền gởi" },
                new Header<object> { HeaderText = "Số tiền chi", FieldName = "SKTTG_SoTienChi", GroupName = "Sổ kế toán tiền gởi" },
                new Header<object> { HeaderText = "Đối tượng", FieldName = "SKTTG_DoiTuong", GroupName = "Sổ kế toán tiền gởi" },
                new Header<object> { HeaderText = "Nội dung", FieldName = "SKTTG_NoiDung", GroupName = "Sổ kế toán tiền gởi" },
                
                new Header<object> { HeaderText = "Chênh lệch", FieldName = "ChechLech" },
            });

            DoiChieuData = new ObservableArray<object>(new object[] {
                new {
                    DaKhopDoiChieu = "Thu tiền gởi", LoaiGiaoDich = "123 - Gởi tiền", SPNH_SoGiaoDich = "874 - ddd", SPNH_NgayGiaoDich = "15.000.000",
                    SPNH_SoTienThu = "Thu tiền khách hàng trả cọc", SPNH_SoTienChi = "Nhân JS", SPNH_NoiDung = "Nhân JS", 
                    SKTTG_SoGiaoDich = "Kế toán", SKTTG_NgayHachToan = "Vin Homes", SKTTG_SoTienThu = "DH129389",
                    SKTTG_SoTienChi = "HDB989899", SKTTG_DoiTuong = "MTK9i8989", SKTTG_NoiDung = "ahihi", ChechLech = "123.456"
                }
            });
            DoiChieuData.AddRange(DoiChieuData.Data);
            DoiChieuData.AddRange(DoiChieuData.Data);
            DoiChieuData.AddRange(DoiChieuData.Data);
        }
    }
}
