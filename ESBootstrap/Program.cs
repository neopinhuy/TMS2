using MisaOnline.NghiepVu.ThuChi;
using MisaOnline.NghiepVu.Kho;
using MisaOnline.NghiepVu;

namespace ESBootstrap
{
    public static class Program
    {
        public static void Main()
        {
            new MenuComponent().Render();
            var thuChi = new DanhSachThuChi();
            thuChi.Render();
            thuChi.Focus();
        }
    }
}
