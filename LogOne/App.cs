using LogOne.NghiepVu.ThuChi;
using LogOne.NghiepVu.Kho;
using LogOne.NghiepVu;
using LogOne.NghiepVu.Dashboard;
using System.Threading.Tasks;

namespace LogOne
{
    public static class App
    {
        public async static Task Main()
        {
            var tk = new ThongKe();
            tk.Render();
            new DanhSachThuChi().Render();
            new ThuTienKhachHangHangLoat().Render();
            tk.Focus();
            await new MenuComponent().RenderAsync();
        }
    }
}
