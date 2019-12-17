using TMS.UI.Business;
using TMS.UI.Business.Dashboard;

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

            var ledger = new LedgerBL();
            ledger.Render();
            ledger.Focus();
        }
    }
}
