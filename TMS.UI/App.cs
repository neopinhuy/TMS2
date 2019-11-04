using Components.Forms;
using System;
using System.Threading.Tasks;
using TMS.API.Models;
using TMS.UI.Business;
using TMS.UI.Business.Dashboard;
using TMS.UI.Business.TruckManagement;

namespace TMS.UI
{
    public static class App
    {
        public static async Task Main()
        {
            var dashboard = new Dashboard();
            await dashboard.RenderAsync();
            var menuComponent = new MenuComponent();
            await menuComponent.RenderAsync();

            var truck = new AllTruck();
            await truck.RenderAsync();
            truck.Focus();
        }
    }
}
