using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components.Forms;
using System.Threading.Tasks;
using TMS.API.Models;
namespace TMS.UI.Business.Sale
{
    public class PolicyManagementBL : TabEditor<PolicyManagementVM>
    {
        public PolicyManagementBL()
        {
            Entity = new PolicyManagementVM();
            Name = "ListPolicy";
            Title = Name;
        }

        public override async Task<bool> Save(bool defaultMessage = false)
        {
            var vm = Entity as PolicyManagementVM;
            // Save changes to features
            var ok = await Client<Policy>.Instance.BulkUpdateAsync(vm.ListPolicy);
            if (ok)
            {
                Toast.Success("Save feature succeeded!");
            }
            else
            {
                Toast.Warning("Save feature failed!");
            }
            return true;
        }
    }
}
