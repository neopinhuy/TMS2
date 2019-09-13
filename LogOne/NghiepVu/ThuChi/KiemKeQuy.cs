using Components;
using LogOne.NghiepVu;
using MVVM;
using System;

namespace LogOne.NghiepVu.ThuChi
{
    public partial class KiemKeQuy : Component
    {
        public override string Title { get; set; } = "Bảng kiểm kê quỹ";
        public ObservableArray<Header<object>> KiemKeHeader { get; set; }
        public ObservableArray<object> KiemKeData { get; set; }

        public ObservableArray<Header<object>> NguoiThamGiaHeader { get; set; }
        public ObservableArray<object> NguoiThamGiaData { get; set; }

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

            NguoiThamGiaHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Họ và tên", FieldName = "HoTen" },
                new Header<object> { HeaderText = "Chức danh", FieldName = "ChucDanh" },
                new Header<object> { HeaderText = "Đại diện", FieldName = "DaiDien" },
            });
            NguoiThamGiaData = new ObservableArray<object>(new object[]
            {
                new
                {
                    HoTen = "Nhân JS", ChucDanh = "Lập trình viên", DaiDien = "Thanh toán",
                },
            });
            NguoiThamGiaData.Add(NguoiThamGiaData.Data[0]);
            NguoiThamGiaData.Add(NguoiThamGiaData.Data[0]);
            NguoiThamGiaData.AddRange(NguoiThamGiaData.Data);
        }
    }
}