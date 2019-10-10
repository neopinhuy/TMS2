using Components;
using MVVM;
using LogAPI.Models;
using System;
using System.Threading.Tasks;
using System.Linq;
using Common.Interfaces;

namespace LogOne.Business.TruckManagement
{
    public partial class AllTruck : Component
    {
        public override string Title { get; set; } = "Truck";
        public int TruckId { get; set; }
        public ObservableArray<Header<Truck>> TruckHeader = new ObservableArray<Header<Truck>>();
        public ObservableArray<Truck> TruckData = new ObservableArray<Truck>();
        public Observable<string> TruckPlate = new Observable<string>();
        public Observable<int> FreightStateId = new Observable<int>();
        public Observable<string> BrandName = new Observable<string>();
        public Observable<string> Version = new Observable<string>();
        public Observable<int> VendorId = new Observable<int>();
        public Observable<decimal> Price = new Observable<decimal>();
        public Observable<string> Currency = new Observable<string>();
        public Observable<DateTime?> ActiveDate = new Observable<DateTime?>();
        public Observable<DateTime?> ExpiredDate = new Observable<DateTime?>();
        public Observable<int> DriverId = new Observable<int>();

        public AllTruck()
        {
            TruckHeader.Data = new Header<Truck>[]
            {
                new Header<Truck> { EditEvent = EditTruck },
                new Header<Truck> { HeaderText = "Truck plate", FieldName = "TruckPlate", Sortable = true },
                new Header<Truck> { 
                    HeaderText = "Freight state", FieldName = "FreightStateId", Sortable = true,
                    Reference = typeof(FreightState), RefDisplayField = nameof(FreightState.Name), RefValueField = nameof(FreightState.Id),
                },
                new Header<Truck> { HeaderText = "Band name", FieldName = "BrandName", Sortable = true },
                new Header<Truck> { HeaderText = "Version", FieldName = "Version", Sortable = true },
                new Header<Truck> { 
                    HeaderText = "Vendor", FieldName = "VendorId", Sortable = true,
                    Reference = typeof(Vendor), RefDisplayField = nameof(Vendor.Name), RefValueField = nameof(Vendor.Id),
                },
                new Header<Truck> { HeaderText = "Long", FieldName = "Long", TextAlign = TextAlign.right, Sortable = true },
                new Header<Truck> { HeaderText = "Lat", FieldName = "Lat", TextAlign = TextAlign.right, Sortable = true },
                new Header<Truck> { 
                    HeaderText = "Driver", FieldName = "DriverId", Sortable = true,
                    Reference = typeof(User), RefDisplayField = nameof(User.FullName), RefValueField = nameof(User.Id),
                },
                new Header<Truck> { HeaderText = "Price", FieldName = "Price", Sortable = true },
                new Header<Truck> { HeaderText = "Currency", FieldName = "Currency", Sortable = true },
                new Header<Truck> { HeaderText = "Bought date", FieldName = "BoughtDate", Sortable = true },
                new Header<Truck> { HeaderText = "Active date", FieldName = "ActiveDate", Sortable = true },
                new Header<Truck> { HeaderText = "Maintenance start", FieldName = "MaintenanceStart", Sortable = true },
                new Header<Truck> { HeaderText = "Maintenance end", FieldName = "MaintenanceEnd", Sortable = true },
                new Header<Truck> { HeaderText = "Next maintenance date", FieldName = "NextMaintenanceDate", Sortable = true },
                new Header<Truck> { HeaderText = "Maintenance period", FieldName = "MaintenancePeriod", Sortable = true },
                new Header<Truck> { HeaderText = "Active", FieldName = "Active", Sortable = true },
                new Header<Truck> { HeaderText = "Expiry date", FieldName = "ExpiredDate", Sortable = true },
                new Header<Truck> { HeaderText = "Inserted date", FieldName = "InsertedDate", Sortable = true },
                new Header<Truck> { HeaderText = "Inserted by", FieldName = "InsertedBy", Sortable = true },
                new Header<Truck> { HeaderText = "Updated date", FieldName = "UpdatedDate", Sortable = true },
                new Header<Truck> { HeaderText = "Updated by", FieldName = "UpdatedBy", Sortable = true },
            };
        }

        public async Task CreateNewTruckAsync()
        {
            var truck = new Truck
            {
                Id = TruckId,
                TruckPlate = TruckPlate.Data,
                FreightStateId = FreightStateId.Data,
                BrandName = BrandName.Data,
                Version = Version.Data,
                VendorId = VendorId.Data,
                Price = Price.Data,
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
            FreightStateId.Data = 0;
            FreightStateId.Data = 0;
            BrandName.Data = null;
            Version.Data = null;
            VendorId.Data = 0;
            Price.Data = 0;
            Currency.Data = null;
            ActiveDate.Data = null;
            ExpiredDate.Data = null;
            DriverId.Data = 0;
        }

        public async Task EditTruck(Truck truck)
        {
            TruckId = truck.Id;
            TruckPlate.Data = truck.TruckPlate;
            FreightStateId.Data = truck.FreightStateId;
            BrandName.Data = truck.BrandName;
            Version.Data = truck.Version;
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
