using Components;
using MVVM;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.Kho
{
    public partial class NhapXuatKho : Component
    {
        public override string ControlName { get; set; } = "NhapXuatKho";
        public override string Title { get; set; } = "Nhập xuất kho";
        public List<SelectListItem> Ranges { get; set; }
        public SelectListItem SelectedRange { get; set; }
        public List<SelectListItem> States { get; set; }
        public SelectListItem SelectedState { get; set; }
        public List<SelectListItem> Types { get; set; }
        public SelectListItem SelectedType { get; set; }
        public ObservableArray<Header<object>> NhapXuatKhoHeader { get; set; }
        public ObservableArray<object> NhapXuatKhoData { get; set; }
        public ObservableArray<Header<object>> NhapXuatKhoChiTietHeader { get; set; }
        public ObservableArray<object> NhapXuatKhoChiTietData { get; set; }

        public NhapXuatKho()
        {
            Ranges = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Đầu tháng đến hiện tại" },
                new SelectListItem { Value = 2, Display = "Quý này" },
                new SelectListItem { Value = 3, Display = "Đầu quý đến hiện tại" },
                new SelectListItem { Value = 4, Display = "Năm nay" },
                new SelectListItem { Value = 5, Display = "Đầu năm đến hiện tại" },
                new SelectListItem { Value = 6, Display = "6 tháng đầu năm" },
                new SelectListItem { Value = 7, Display = "6 tháng cuối năm" },
                new SelectListItem { Value = 8, Display = "Tháng 1" },
                new SelectListItem { Value = 9, Display = "Tháng 2" },
                new SelectListItem { Value = 10, Display = "Tháng 3" },
                new SelectListItem { Value = 11, Display = "Tháng 4" },
                new SelectListItem { Value = 12, Display = "Tháng 5" },
                new SelectListItem { Value = 13, Display = "Tháng 6" },
                new SelectListItem { Value = 14, Display = "Tháng 7" },
                new SelectListItem { Value = 15, Display = "Tháng 8" },
                new SelectListItem { Value = 16, Display = "Tháng 9" },
                new SelectListItem { Value = 17, Display = "Tháng 10" },
                new SelectListItem { Value = 18, Display = "Tháng 11" },
                new SelectListItem { Value = 19, Display = "Tháng 12" },
                new SelectListItem { Value = 20, Display = "Quý 1" },
                new SelectListItem { Value = 21, Display = "Quý 2" },
                new SelectListItem { Value = 21, Display = "Quý 3" },
                new SelectListItem { Value = 22, Display = "Quý 4" },
            };
            SelectedRange = Ranges[0];
            States = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Đã ghi sổ" },
                new SelectListItem { Value = 2, Display = "Chưa ghi sổ" },
                new SelectListItem { Value = 3, Display = "Tất cả" },
            };
            SelectedState = States[2];

            Types = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Phiếu thu" },
                new SelectListItem { Value = 2, Display = "Phiếu chi" },
                new SelectListItem { Value = 3, Display = "Tất cả" },
            };
            SelectedType = Types[2];

            NhapXuatKhoHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Ngày hạch toán", FieldName = "NgayHachToan" },
                new Header<object> { HeaderText = "Ngày chứng từ", FieldName = "NgayChungTu" },
                new Header<object> { HeaderText = "Số chứng từ", FieldName = "SoChungTu" },
                new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                new Header<object> { HeaderText = "Tổng tiền", FieldName = "TongTien" },
                new Header<object> { HeaderText = "Người giao nhận", FieldName = "NguoiGiaoNhan" },
                new Header<object> { HeaderText = "Đối tượng", FieldName = "DoiTuong" },
                new Header<object> { HeaderText = "Đã lập CT bán hàng", FieldName = "DaLapCTBanHang" },
                new Header<object> { HeaderText = "Ngày ghi sổ kho", FieldName = "NgayGhiSoKho" },
                new Header<object> { HeaderText = "Loại chứng từ", FieldName = "LoaiChungTu" },
                new Header<object> {
                    EditButton = true,
                },
            });

            NhapXuatKhoData = new ObservableArray<object>(new object[] {
                new
                {
                    NgayHachToan = "20/08/2019", NgayChungTu = "20/08/2019", SoChungTu = "CT00001", DienGiai = "Chug tu 000001",
                    TongTien = "100.000.000", NguoiGiaoNhan = "Lan Anh", DoiTuong = "Nhân JS", DaLapCTBanHang = false,
                    NgayGhiSoKho = "20/08/2019", LoaiChungTu = "Công nợ"
                },
            });

            NhapXuatKhoData.AddRange(NhapXuatKhoData.Data);
            NhapXuatKhoData.AddRange(NhapXuatKhoData.Data);
            NhapXuatKhoData.AddRange(NhapXuatKhoData.Data);

            NhapXuatKhoChiTietHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Mã hàng", FieldName = "MaHang" },
                new Header<object> { HeaderText = "Tên hàng", FieldName = "TenHang" },
                new Header<object> { HeaderText = "Kho", FieldName = "Kho" },
                new Header<object> { HeaderText = "TK nợ", FieldName = "TKNo" },
                new Header<object> { HeaderText = "TK có", FieldName = "TKCo" },
                new Header<object> { HeaderText = "ĐVT", FieldName = "DVT" },
                new Header<object> { HeaderText = "Số lượng", FieldName = "SoLuong" },
                new Header<object> { HeaderText = "Đơn giá", FieldName = "DonGia" },
                new Header<object> { HeaderText = "Thành tiền", FieldName = "ThanhTien" },
                new Header<object> { HeaderText = "Số lô", FieldName = "SoLo" },
                new Header<object> { HeaderText = "Hạn sử dụng", FieldName = "HanSuDung" },
            });

            NhapXuatKhoChiTietData = new ObservableArray<object>(new object[] {
                new
                {
                    MaHang = "HH00003", TenHang = "Áo vest", Kho = "Kho quần áo", TKNo = "123 - Việt Nam đồng",
                    TKCo = "444 - Bán hàng", DVT = "Cái", SoLuong = 12, DonGia = 10000000m,
                    ThanhTien = 120000000, SoLo = "LO00002", HanSuDung = "20/08/2020",
                }
            });
            NhapXuatKhoChiTietData.AddRange(NhapXuatKhoChiTietData.Data);
            NhapXuatKhoChiTietData.AddRange(NhapXuatKhoChiTietData.Data);
            NhapXuatKhoChiTietData.AddRange(NhapXuatKhoChiTietData.Data);
        }
    }
}
