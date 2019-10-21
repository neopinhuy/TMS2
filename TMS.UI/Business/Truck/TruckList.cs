using Components;
using MVVM;
using TMS.API.Models;
using System;
using System.Threading.Tasks;
using System.Linq;
using Common.Clients;

namespace TMS.UI.Business.TruckManagement
{
    public partial class TruckList : TabComponent
    {
        public override string Title { get; set; } = "Truck list";
        public int TruckId { get; set; }
        public ObservableArray<Header<Truck>> TruckHeader = new ObservableArray<Header<Truck>>();
        public ObservableArray<Truck> TruckData = new ObservableArray<Truck>();
        public Observable<string> TruckPlate = new Observable<string>();
        public Observable<string> BrandName = new Observable<string>();
        public Observable<string> Version = new Observable<string>();
        public Observable<int?> VendorId = new Observable<int?>();
        public Observable<int?> TruckTypeId = new Observable<int?>();
        public Observable<decimal?> Price = new Observable<decimal?>();
        public Observable<string> Currency = new Observable<string>();
        public Observable<DateTime?> ActiveDate = new Observable<DateTime?>();
        public Observable<DateTime?> ExpiredDate = new Observable<DateTime?>();
        public Observable<int?> DriverId = new Observable<int?>();
        public MasterData _masterData;

        public TruckList()
        {
            
        }

        public async Task CreateNewTruckAsync()
        {
            var truck = new Truck
            {
                Id = TruckId,
                TruckPlate = TruckPlate.Data,
                BrandName = BrandName.Data,
                Model = Version.Data,
                VendorId = VendorId.Data ?? 0,
                Price = Price.Data ?? 0,
                Currency = Currency.Data,
                Active = true,
                ActiveDate = ActiveDate.Data,
                ExpiredDate = ExpiredDate.Data,
                InsertedBy = 1,
                InsertedDate = DateTime.Now,
                DriverId = 1
            };
            var client = new BaseClient<Truck>();
            if (TruckId == 0)
            {
                var addedTruck = await client.PostAsync(truck);
                TruckData.Add(addedTruck);
            }
            else
            {
                var updatedTruck = await client.PutAsync(truck);
                var oldTruck = TruckData.Data.First(x => x.Id == TruckId);
                TruckData.Replace(oldTruck, updatedTruck);
            }
            ResetTruck();
        }

        private void ResetTruck()
        {
            TruckId = 0;
            TruckPlate.Data = null;
            BrandName.Data = null;
            Version.Data = null;
            VendorId.Data = null;
            Price.Data = null;
            Currency.Data = null;
            ActiveDate.Data = null;
            ExpiredDate.Data = null;
            DriverId.Data = null;
        }

        public async Task EditTruck(Truck truck)
        {
            TruckId = truck.Id;
            TruckPlate.Data = truck.TruckPlate;
            BrandName.Data = truck.BrandName;
            Version.Data = truck.Model;
            VendorId.Data = truck.VendorId;
            Price.Data = truck.Price;
            Currency.Data = truck.Currency;
            ActiveDate.Data = truck.ActiveDate;
            ExpiredDate.Data = truck.ExpiredDate;
            DriverId.Data = truck.DriverId;
        }

        public async Task DeleteTruckAsync(Truck truck)
        {
            var client = new BaseClient<Truck>();
            await client.Delete(truck.Id);
            TruckData.Remove(truck);
        }
    }
}
