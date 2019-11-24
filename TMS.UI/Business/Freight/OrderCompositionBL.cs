using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.Freight
{
    public class OrderCompositionBL : TabEditor<OrderComposition>
    {
        public OrderCompositionBL()
        {
            Name = "Order Composition List";
            Title = "Order composition";
        }
    }
}
