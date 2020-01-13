using Common.Extensions;
using Common.ViewModels;
using Components;
using Components.Extensions;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.UnitofMeaure
{
    public class MasterDataBL : TabEditor<MasterDataVM>
    {
        public MasterDataBL()
        {
            Name = "Master Data";
            Title = Name;
            Entity = new MasterDataVM();
        }

        public void EditMasterData(MasterData masterData)
        {
            InitMasterDataForm(masterData);
        }

        private void InitMasterDataForm(MasterData masterData)
        {
            var MasterDataForm = new PopupEditor<MasterData>
            {
                Entity = masterData,
                Name = "MasterData Detail",
                Title = "MasterData Detail"
            };
            AddChild(MasterDataForm);
        }

        public void Search()
        {
            var gridView = FindComponentByName<GridView>("MasterData");
            var originalQuery = gridView.FormattedDataSource;
            var filter = Utils.FormatWith("Active eq true and (contains(Name,'{SearchText}') or contains(Description,'{SearchText}'))", Entity);
            var finalFilter = OdataExtensions.ReplaceFilter(originalQuery, filter);
            gridView.UI.DataSourceFilter = finalFilter;
            gridView.ReloadData();
        }
    }
}
