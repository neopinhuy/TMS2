using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.Asset
{
    public class AccessoryBL : TabEditor<Accessory>
    {
        public AccessoryBL() : base()
        {
            Name = "AccessoryTab";
        }

        private void ReloadAccessoryGrid()
        {
            var accessoryGrid = FindComponent("Accessory") as GridView;
            accessoryGrid.LoadData();
        }

        public void CreateAccessory()
        {
            var accessoryForm = new PopupEditor<Accessory>
            {
                Entity = new Accessory(),
                Name = "Accessory Detail"
            };
            accessoryForm.AfterSaved += ReloadAccessoryGrid;
            accessoryForm.AfterRendered += () =>
            {
                var truck = accessoryForm.FindComponent("TruckId") as SearchEntry;
                truck.DataSourceFilter = "?$filter=Active eq true";
                truck.Disabled = false;
            };
            AddChild(accessoryForm);
        }

        public void UpdateAccessory(Accessory accessory)
        {
            var accessoryForm = new PopupEditor<Accessory>
            {
                Entity = accessory,
                Name = "Accessory Detail"
            };
            accessoryForm.AfterSaved += ReloadAccessoryGrid;
            AddChild(accessoryForm);
        }

        public void DeleteAccessory()
        {
            var accessoryGrid = FindComponent("Accessory") as GridView;
            accessoryGrid.DeleteSelected();
        }
    }
}
