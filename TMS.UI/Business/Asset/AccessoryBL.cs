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

        public void CreateAccessory()
        {
            var accessoryForm = new PopupEditor<Accessory>
            {
                Entity = new Accessory(),
                Name = "Accessory Detail"
            };
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
            AddChild(accessoryForm);
        }

        public void DeleteAccessory()
        {
            var accessoryGrid = FindComponent("Accessory") as GridView;
            accessoryGrid.DeleteSelected();
        }
    }
}
