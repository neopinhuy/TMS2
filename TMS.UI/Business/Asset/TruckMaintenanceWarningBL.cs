using Bridge.Html5;
using Common.Clients;
using Common.ViewModels;
using Components;
using Components.Forms;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Asset
{
    public class TruckMaintenanceWarningBL : TabEditor<TruckMaintenanceWarning>
    {
        private PopupEditor<Accessory> _accessoryForm;
        private PopupEditor<Truck> _truckForm;
        private PopupEditor<TruckMaintenance> _maintenanceForm;
        public TruckMaintenanceWarningBL()
        {
            Name = "TruckMaintenanceWarning List";
            Title = "Truck Maintenance Warning";
        }
        

        #region Truck

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

        public void DeleteTruck()
        {
            var truckGrid = FindComponentByName("TruckGrid") as GridView;
            truckGrid.DeleteSelected();
        }

        #endregion Truck

        #region Accessory

        public void CreateAccessory()
        {
            _truckForm.Show(false);
            _accessoryForm = new PopupEditor<Accessory>
            {
                Entity = new Accessory()
                {
                    TruckId = (int)_truckForm.Entity[IdField]
                }
            };
            AddAccessoryForm();
        }

        private void AddAccessoryForm()
        {
            _accessoryForm.Disposed += () => _truckForm.Show(true);
            _truckForm.AddChild(_accessoryForm);
        }

        public void UpdateAccessory(Accessory accessory)
        {
            _truckForm.Show(false);
            _accessoryForm = new PopupEditor<Accessory>
            {
                Entity = accessory
            };
            AddAccessoryForm();
        }

        public void DeleteAccessory()
        {
            var accessoryGrid = _truckForm.FindComponentByName("Accessory") as GridView;
            accessoryGrid.DeleteSelected();
        }

        #endregion Accessory

        #region Maintenance

        public void CreateMaintenance()
        {
            _truckForm.Show(false);
            _maintenanceForm = new PopupEditor<TruckMaintenance>
            {
                Name = "TruckMaintenance Detail",
                Title = "Maintenance Detail",
                Entity = new TruckMaintenance()
                {
                    TruckId = (_truckForm.Entity as Truck).Id
                }
            };
            AddMaintenanceForm();
        }

        private void AddMaintenanceForm()
        {
            _maintenanceForm.Disposed += () => _truckForm.Show(true);
            _truckForm.AddChild(_maintenanceForm);
        }

        public void EditMaintenance(TruckMaintenanceWarning entity)
        {
            var tab = new TruckBL();
            _truckForm = new PopupEditor<Truck>
            {
                Id = entity.TruckId ?? 0,
                Entity = entity.Truck,
                Name = "Truck Detail",
                Title = $"Warning - {entity.Truck.TruckPlate}"
            };
            tab.AddChild(_truckForm);
        }

        public void DeleteMaintenance()
        {
            var maintenanceGrid = _truckForm.FindComponentByName("MaintenanceGrid") as GridView;
            maintenanceGrid.DeleteSelected();
        }

        #endregion Maintenance
    }
}
