using Common.Clients;
using Components;
using Components.Extensions;
using Components.Forms;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.TruckManagement
{
    public class AllTruck : TabEditor<Truck>
    {
        public void DeleteTruck()
        {
            var grid = FindComponent("TruckGrid") as GridView;
            grid.DeleteSelected();
        }

        public void DeleteAccessory()
        {
            var grid = FindComponent("Accessory") as GridView;
            grid.DeleteSelected();
        }

        public void CreateAccessory()
        {
            var truckGrid = FindComponent("Truck Detail") as PopupEditor<Truck>;
            truckGrid.Show(false);
            var editor = new PopupEditor<Accessory>
            {
                Entity = new Accessory() 
                {
                    TruckId = (int)truckGrid.Entity["Id"]
                },
                Disposed = () =>
                {
                    truckGrid.Show(true);
                }
            };
            AddChild(editor);
        }

        public async Task SaveAccessory()
        {
            var form = FindComponent("Accessory Detail") as PopupEditor<Accessory>;
            var accessory = (Accessory)form.Entity;
            var client = new Client<Accessory>();
            var created = await client.CreateAsync(accessory);
            if (created != null)
            {
                Toast.Success($"Create Accessory succeeded");
                form.Entity = accessory;
            }
            else
            {
                Toast.Warning("Create Accessory failed");
            }
        }

        public void DisposeAccessoryDetail()
        {
            var form = FindComponent("Accessory Detail") as PopupEditor<Accessory>;
            form.Dispose();
        }
    }
}
