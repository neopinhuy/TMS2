using Components;
using LogOne.NghiepVu;
using LogOne.NghiepVu.Dashboard;
using LogOne.NghiepVu.ThuChi;
using LogOne.NghiepVu.TruckManagement;
using System.Threading.Tasks;

namespace LogOne
{
    public static class App
    {
        public async static Task Main()
        {
            new Dashboard().Render();
            new DanhSachThuChi().Render();
            new ThuTienKhachHangHangLoat().Render();
            new MenuComponent().Render();
            var truck = new AllTruck();
            await truck.RenderAsync();
            truck.Focus();
        }
    }
}
