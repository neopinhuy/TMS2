using Components;
using MVVM;
using TMS.API.Models;
using System;
using System.Threading.Tasks;
using System.Linq;
using Common.Clients;
using Components.Forms;

namespace TMS.UI.Business.TruckManagement
{
    public partial class TruckList : TabComponent
    {
        public override string Title { get; set; } = "Truck list";
        public int TruckId { get; set; }
        public ObservableArray<Header<Truck>> TruckHeader = new ObservableArray<Header<Truck>>();
        public ObservableArray<Truck> TruckData = new ObservableArray<Truck>();

        public async Task EditTruck(Truck truck)
        {
            var truckDetail = new PopupEditor<Truck>
            {
                Data = truck
            };
            await truckDetail.RenderAsync();
        }

        public async Task DeleteTruckAsync(Truck truck)
        {
            var client = new Client<Truck>();
            await client.Delete(truck.Id);
            TruckData.Remove(truck);
        }
    }
}
