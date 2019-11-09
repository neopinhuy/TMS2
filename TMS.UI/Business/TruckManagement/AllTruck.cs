using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.TruckManagement
{
    public class AllTruck : TabEditor<Truck>
    {
        private PopupEditor<Accessory> _accessoryForm;
        private PopupEditor<Truck> _truckForm;
        private PopupEditor<TruckMaintenance> _maintenanceForm;
        private GridView _truckGrid;
        private GridView _accessoryGrid;
        private GridView _maintenanceGrid;

        #region Truck

        private GridView FindTruckGrid()
        {
            _truckGrid = FindComponent("TruckGrid") as GridView;
            return _truckGrid;
        }

        public void CreateTruck()
        {
            _truckForm = new PopupEditor<Truck>
            {
                Entity = new Truck()
            };
            _truckForm.Saved += ReloadTruckGrid;
            AddChild(_truckForm);
        }

        public void EditTruck(Truck truck)
        {
            _truckForm = new PopupEditor<Truck>
            {
                Entity = truck
            };
            _truckForm.Saved += ReloadTruckGrid;
            AddChild(_truckForm);
        }

        public void DeleteTruck()
        {
            _truckGrid = FindTruckGrid();
            _truckGrid.DeleteSelected();
            ReloadTruckGrid();
        }

        private void ReloadTruckGrid()
        {
            _truckGrid = FindTruckGrid();
            _truckGrid.LoadData();
        }

        public void DisposeTruckDetail()
        {
            _truckForm.Dispose();
            RemoveChild(_truckForm);
            _truckForm = null;
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
            _accessoryForm.Saved += () =>
            {
                _accessoryGrid = FindAccessoryGrid();
                _accessoryGrid.LoadData();
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

        private GridView FindAccessoryGrid()
        {
            _accessoryGrid = _truckForm.FindComponent("Accessory") as GridView;
            return _accessoryGrid;
        }

        public void DeleteAccessory()
        {
            _accessoryGrid = FindAccessoryGrid();
            _accessoryGrid.DeleteSelected();
        }

        public void DisposeAccessoryDetail()
        {
            _accessoryForm.Dispose();
            _truckForm.RemoveChild(_accessoryForm);
            _accessoryForm = null;
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
            _maintenanceForm.Saved += () =>
            {
                FindMaintenanceGrid();
                _maintenanceGrid.LoadData();
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

        private void FindMaintenanceGrid()
        {
            _maintenanceGrid = _truckForm.FindComponent("MaintenanceGrid") as GridView;
        }

        public void DeleteMaintenance()
        {
            FindMaintenanceGrid();
            _maintenanceGrid.DeleteSelected();
        }

        public void DisposeMaintenanceDetail()
        {
            _maintenanceForm.Dispose();
            _truckForm.RemoveChild(_maintenanceForm);
            _maintenanceForm = null;
        }

        #endregion Maintenance
    }
}
