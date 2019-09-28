using Bridge;
using LogOne.NghiepVu;
using LogOne.NghiepVu.Dashboard;
using LogOne.NghiepVu.ThuChi;
using System.Threading.Tasks;

namespace LogOne
{
    public static class App
    {
        public async static Task Main()
        {
            var tk = new Dashboard();
            tk.Render();
            new DanhSachThuChi().Render();
            new ThuTienKhachHangHangLoat().Render();
            tk.Focus();
            await new MenuComponent().RenderAsync();
        }
    }
}
