using Components;
using MVVM;

namespace LogOne.NghiepVu.ThuChi
{
    public partial class TraLuong : Component
    {
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
    }
}