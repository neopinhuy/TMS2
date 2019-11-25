using TMS.UI.Business;
using TMS.UI.Business.Dashboard;
using TMS.UI.Business.Asset;
using TMS.UI.Business.Sale;
using TMS.UI.Business.Freight;

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

            var so = new SaleOrderBL();
            so.Render();
            var orderComp = new CoordinationBL();
            orderComp.Render();
            orderComp.Focus();
        }
    }
}
