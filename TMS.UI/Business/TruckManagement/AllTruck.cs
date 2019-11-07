using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.TruckManagement
{
    public class AllTruck : TabEditor<Truck>
    {
        public void DeleteTruck()
        {
            var grid = Find("TruckGrid") as GridView;
            grid.DeleteSelected();
        }

        public void DeleteAccessory()
        {
            var grid = Find("Accessory") as GridView;
            grid.DeleteSelected();
        }

        public void CreateAccessory()
        {
            var truckGrid = Find("Truck Detail") as PopupEditor<Truck>;
            truckGrid.Show(false);
            var editor = new PopupEditor<Accessory>();
            editor.Disposed += () =>
            {
                truckGrid.Show(true);
            };
            AddChild(editor);
        }
    }
}
