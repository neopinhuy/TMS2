using LogOne.NghiepVu.ThuChi;
using LogOne.NghiepVu.Kho;
using LogOne.NghiepVu;

namespace LogOne
{
    public static class App
    {
        public async static void Main()
        {
            var thuChi = new DanhSachThuChi();
            thuChi.Render();
            new ThuTienKhachHangHangLoat().Render();
            thuChi.Focus();
            await new MenuComponent().RenderAsync();
        }
    }
}
