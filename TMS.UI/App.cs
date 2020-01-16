using TMS.UI.Business;
using TMS.UI.Business.Sale;
using TMS.UI.Notifications;

namespace TMS.UI
{
    public static class App
    {
        public static void Main()
        {
            var menuComponent = new MenuComponent();
            menuComponent.Render();

            var order = new SaleOrderBL();
            order.Id = order.GetHashCode();
            order.Render();
            order.Focus();

            var notification = new LiabilitiesNotification();
            notification.Render();
        }
    }
}
