using Components;
using Components.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class SaleOrderBL : TabEditor<Order>
    {
        public SaleOrderBL()
        {
            Name = "SaleOrder";
        }
    }
}
