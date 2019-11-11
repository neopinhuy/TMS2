using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.Asset
{
    public class TruckBL : TabEditor<Truck>
    {
        private PopupEditor<Accessory> _accessoryForm;
        private PopupEditor<Truck> _truckForm;
        private PopupEditor<TruckMaintenance> _maintenanceForm;

        #region Truck

        public void CreateTruck()
        {
            _truckForm = new PopupEditor<Truck>
            {
                Entity = new Truck()
            };
            _truckForm.AfterSaved += ReloadTruckGrid;
            AddChild(_truckForm);
        }

        public void EditTruck(Truck truck)
        {
            _truckForm = new PopupEditor<Truck>
            {
                Entity = truck
            };
            _truckForm.AfterSaved += ReloadTruckGrid;
            AddChild(_truckForm);
        }

        public void DeleteTruck()
        {
            var truckGrid = FindComponent("TruckGrid") as GridView;
            truckGrid.DeleteSelected();
        }

        private void ReloadTruckGrid()
        {
            var truckGrid = FindComponent("TruckGrid") as GridView;
            truckGrid.LoadData();
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
                    TruckId = (int)_truckForm.Entity["Id"]
                }
            };
            AddAccessoryForm();
        }

        private void AddAccessoryForm()
        {
            _accessoryForm.Disposed += () => _truckForm.Show(true);
            _accessoryForm.AfterSaved += () =>
            {
                var accessoryGrid = _truckForm.FindComponent("Accessory") as GridView;
                accessoryGrid.LoadData();
            };
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
            var accessoryGrid = _truckForm.FindComponent("Accessory") as GridView;
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
            _maintenanceForm.AfterSaved += () =>
            {
                var maintenanceGrid = _truckForm.FindComponent("MaintenanceGrid") as GridView;
                maintenanceGrid.LoadData();
                var detailGrid = _truckForm.FindComponent("TruckMaintenanceDetail") as GridView;
                // Reload to update maintenance detail Id
                detailGrid.LoadData();
            };
            _truckForm.AddChild(_maintenanceForm);
        }

        public void EditMaintenance(TruckMaintenance maintenance)
        {
            _truckForm.Show(false);
            _maintenanceForm = new PopupEditor<TruckMaintenance>
            {
                Entity = maintenance
            };
            AddMaintenanceForm();
        }

        public void DeleteMaintenance()
        {
            var maintenanceGrid = _truckForm.FindComponent("MaintenanceGrid") as GridView;
            maintenanceGrid.DeleteSelected();
        }

        #endregion Maintenance
    }
}
