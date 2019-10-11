using Components;
using TMS.UI.Business;
using TMS.UI.Business.Dashboard;
using TMS.UI.Business.TruckManagement;
using System.Threading.Tasks;

namespace TMS.UI
{
    public static class App
    {
        public async static Task Main()
        {
            new Dashboard().Render();
            new MenuComponent().Render();
            var truck = new AllTruck();
            await truck.RenderAsync();
            truck.Focus();
        }
    }
}
