using Components;
using Components.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Asset
{
    public class MaintenanceBL : TabEditor<TruckMaintenance>
    {
        public MaintenanceBL() : base()
        {
            Name = "MaintenanceTab";
            Title = "Maintenance";
        }

        public void CreateMaintenance()
        {
            var maintenaceForm = new PopupEditor<TruckMaintenance>
            {
                Entity = new TruckMaintenance(),
                Name = "TruckMaintenance Detail",
                Title = "Maintenance Detail"
            };
            maintenaceForm.AfterSaved += ReloadMaintenanceGrid;
            maintenaceForm.AfterRendered += () =>
            {
                var truck = maintenaceForm.FindComponent("TruckId") as SearchEntry;
                truck.DataSourceFilter = "?$filter=Active eq true";
                truck.Disabled = false;
            };
            AddChild(maintenaceForm);
        }

        private void ReloadMaintenanceGrid()
        {
            var maintenanceGrid = FindComponent("Maintenance") as GridView;
            maintenanceGrid.LoadData();
        }

        public void EditMaintenance(TruckMaintenance maintenance)
        {
            var maintenanceForm = new PopupEditor<TruckMaintenance>
            {
                Entity = maintenance,
                Name = "TruckMaintenance Detail",
                Title = "Maintenance Detail"
            };
            maintenanceForm.AfterSaved += ReloadMaintenanceGrid;
            AddChild(maintenanceForm);
        }

        public void DeleteAccessory()
        {
            var accessoryGrid = FindComponent("Accessory") as GridView;
            accessoryGrid.DeleteSelected();
        }
    }
}
