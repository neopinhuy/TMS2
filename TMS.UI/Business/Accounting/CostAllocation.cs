using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.Accounting
{
    public class CostAllocationBL : TabEditor<Order>
    {
        public CostAllocationBL()
        {
            Name = "Cost Allocation";
            Title = "Cost Allocation";
        }
    }
}
