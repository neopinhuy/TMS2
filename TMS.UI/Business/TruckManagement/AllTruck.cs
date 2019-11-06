using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.TruckManagement
{
    public class AllTruck : TabEditor<Truck>
    {
        public void DeleteSelected()
        {
            var grid = Find("TruckGrid") as GridView;
            grid.DeleteSelected();
        }
    }
}
