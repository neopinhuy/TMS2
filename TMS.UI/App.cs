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
            new Dashboard().RenderAsync();
            new MenuComponent().RenderAsync();
            var truck = new TruckList();
            await truck.RenderAsync();
            truck.Focus();
        }
    }
}
