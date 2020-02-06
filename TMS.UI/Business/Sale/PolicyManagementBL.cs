using Components.Forms;
using TMS.API.Models;
namespace TMS.UI.Business.Sale
{
    public class PolicyManagementBL : TabEditor<Policy>
    {
        public PolicyManagementBL()
        {
            Name = "PolicyManagement List";
            Title = Name;
        }
    }
}
