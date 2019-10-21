using TMS.UI.Business;
using TMS.UI.Business.Dashboard;
using TMS.UI.Business.TruckManagement;
using System.Threading.Tasks;

namespace TMS.UI
{
    public static class App
    {
        public static async Task Main()
        {
            Dashboard dashboard = new Dashboard();
            await dashboard.RenderAsync();
            MenuComponent menuComponent = new MenuComponent();
            await menuComponent.RenderAsync();
            var truck = new TruckList();
            await truck.RenderAsync();
            truck.Focus();
        }
    }
}
