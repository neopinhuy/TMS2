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
        PopupEditor<Accessory> _accessoryForm;
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
            _accessoryForm = new PopupEditor<Accessory>
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
            AddChild(_accessoryForm);
        }

        public void UpdateAccessory(Accessory accessory)
        {
            var truckGrid = FindComponent("Truck Detail") as PopupEditor<Truck>;
            truckGrid.Show(false);
            _accessoryForm = new PopupEditor<Accessory>
            {
                Entity = accessory,
                Disposed = () =>
                {
                    truckGrid.Show(true);
                }
            };
            AddChild(_accessoryForm);
        }

        public async Task SaveAccessory()
        {
            _accessoryForm = FindComponent("Accessory Detail") as PopupEditor<Accessory>;
            var accessory = (Accessory)_accessoryForm.Entity;
            var client = new Client<Accessory>();
            if (accessory.Id == 0)
            {
                var created = await client.CreateAsync(accessory);
                if (created != null)
                {
                    Toast.Success($"Create Accessory succeeded");
                    _accessoryForm.Entity = accessory;
                }
                else
                {
                    Toast.Warning("Create Accessory failed");
                }
            }
            else
            {
                var updated = await client.UpdateAsync(accessory);
                if (updated != null)
                {
                    Toast.Success($"Update Accessory succeeded");
                    _accessoryForm.Entity = accessory;
                }
                else
                {
                    Toast.Warning("Update Accessory failed");
                }
            }
        }

        public void DisposeAccessoryDetail()
        {
            RemoveChild(_accessoryForm);
            _accessoryForm = null;
        }
    }
}
