using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components;
using Components.Extensions;
using Components.Forms;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Framework
{
    public class FeatureBL : TabEditor<FeatureVM>
    {
        public FeatureBL()
        {
            Name = "Feature management";
            Entity = new FeatureVM();
            Title = "Feature";
        }

        public override async Task<bool> Save(bool defaultMessage = false)
        {
            var vm = Entity as FeatureVM;
            // Save changes to features
            var ok = await Client<Feature>.Instance.BulkUpdateAsync(vm.Feature);
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

        public void Search(FeatureVM vm)
        {
            var gridView = FindComponentByName<GridView>(nameof(vm.Feature));
            var originalQuery = gridView.FormattedDataSource;
            var filter = $"contains(Name,'{vm.SearchText}') " +
                $"or contains(Label,'{vm.SearchText}') " +
                $"or contains(Description,'{vm.SearchText}')";
            filter = OdataExtensions.ReplaceFilter(originalQuery, filter);
            gridView.ReloadData(filter);
        }
    }
}
