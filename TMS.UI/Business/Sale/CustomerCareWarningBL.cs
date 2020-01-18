using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components;
using Components.Forms;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class CustomerCareWarningBL : TabEditor<CustomerCareVM>
    {
        public CustomerCareWarningBL()
        {
            Name = "CustomerCareWarning List";
            Title = "CustomerCare Warning";
        }

    }
}
