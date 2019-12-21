using TMS.UI.Business;
using TMS.UI.Business.Dashboard;
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

            var ledger = new CustomerCareBL();
            ledger.Render();
            ledger.Focus();
        }
    }
}
