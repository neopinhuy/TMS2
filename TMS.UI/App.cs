using TMS.UI.Business;
using TMS.UI.Business.Dashboard;
using TMS.UI.Business.TruckManagement;

namespace TMS.UI
{
    public static class App
    {
        public static void Main()
        {
            var dashboard = new Dashboard();
            dashboard.Render();
            var menuComponent = new MenuComponent();
            menuComponent.Render();

            var truck = new AllTruck();
            truck.Render();
            truck.Focus();
        }
    }
}
