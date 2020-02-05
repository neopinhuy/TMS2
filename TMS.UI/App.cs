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

            var notification = new LiabilitiesNotification();
            notification.Render();
        }
    }
}
