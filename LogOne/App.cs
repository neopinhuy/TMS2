using LogOne.NghiepVu.ThuChi;
using LogOne.NghiepVu.Kho;
using LogOne.NghiepVu;

namespace LogOne
{
    public class App
    {
        public static void Main()
        {
            new MenuComponent().Render();
            var thuChi = new DanhSachThuChi();
            thuChi.Render();
            new ThuTienKhachHangHangLoat().Render();
            thuChi.Focus();
        }
    }
}
