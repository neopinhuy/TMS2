using TMS.UI.Business;
using TMS.UI.Business.Dashboard;
using TMS.UI.Business.Asset;
using TMS.UI.Business.Sale;

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

            var truck = new TruckBL();
            truck.Render();
            var so = new SaleOrderBL();
            so.Render();
            so.Focus();
        }
    }
}
