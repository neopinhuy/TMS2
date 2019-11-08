using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.TruckManagement
{
    public class AllTruck : TabEditor<Truck>
    {
        PopupEditor<Accessory> _accessoryForm;
        PopupEditor<Truck> _truckForm;
        GridView _truckGrid;
        GridView _accessoryGrid;

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
    }
}
