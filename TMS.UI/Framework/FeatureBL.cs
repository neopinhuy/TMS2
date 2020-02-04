using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components;
using Components.Forms;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Framework
{
    public class FeatureBL : TabEditor<SearchFeatureVM>
    {
        public FeatureBL()
        {
            Name = "Feature management";
            Entity = new SearchFeatureVM();
            Title = "Feature";
            Icon = "icons/config.png";
        }

        public override async Task<bool> Save(bool defaultMessage = false)
        {
            var vm = Entity as SearchFeatureVM;
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

        public void Search(SearchFeatureVM vm)
        {
            var gridView = FindComponentByName<GridView>(nameof(vm.Feature));
            var originalQuery = gridView.FormattedDataSource;
            var filter = $"contains(Name,'{vm.SearchText}') " +
                $"or contains(Label,'{vm.SearchText}') " +
                $"or contains(Description,'{vm.SearchText}')";
            filter = OdataExtensions.ReplaceFilter(originalQuery, filter);
            gridView.ReloadData(filter);
        }

        public void EditFeature(FeatureVM feature)
        {
            var editor = new FeatureDetailBL
            {
                Id = feature.Id,
                Entity = feature,
                Title = $"Feature {feature.Name ?? feature.Label ?? feature.Description}"
            };
            AddChild(editor);
            editor.Focus();
        }
    }
}
