using Components;
using LogOne.Business;
using LogOne.Business.Dashboard;
using LogOne.Business.TruckManagement;
using System.Threading.Tasks;

namespace LogOne
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
