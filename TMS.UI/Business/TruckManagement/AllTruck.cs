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
        PopupEditor<Truck> _truckForm;

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
            _truckForm.Show(false);
            _accessoryForm = new PopupEditor<Accessory>
            {
                Entity = new Accessory() 
                {
                    TruckId = (int)_truckForm.Entity["Id"]
                },
                Disposed = () =>
                {
                    _truckForm.Show(true);
                }
            };
            _truckForm.AddChild(_accessoryForm);
        }

        public void CreateTruck()
        {
            _truckForm = new PopupEditor<Truck>
            {
                Entity = new Truck()
            };
            AddChild(_truckForm);
        }

        public void EditTruck(Truck truck)
        {
            _truckForm = new PopupEditor<Truck>
            {
                Entity = truck
            };
            AddChild(_truckForm);
        }

        public void UpdateAccessory(Accessory accessory)
        {
            _truckForm.Show(false);
            _accessoryForm = new PopupEditor<Accessory>
            {
                Entity = accessory,
                Disposed = () =>
                {
                    _truckForm.Show(true);
                }
            };
            _truckForm.AddChild(_accessoryForm);
        }

        public void DisposeTruckDetail()
        {
            _truckForm.Dispose();
            RemoveChild(_truckForm);
            _truckForm = null;
        }

        public void DisposeAccessoryDetail()
        {
            _accessoryForm.Dispose();
            _truckForm.RemoveChild(_accessoryForm);
            _accessoryForm = null;
        }
    }
}
