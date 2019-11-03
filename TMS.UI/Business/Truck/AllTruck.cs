using Components.Forms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.TruckManagement
{
    public class AllTruck : TabEditor<Truck>
    {
        public async Task EditTruck(Truck truck)
        {
            var truckDetail = new PopupEditor<Truck>
            {
                Data = truck
            };
            await truckDetail.RenderAsync();
        }
    }
}
