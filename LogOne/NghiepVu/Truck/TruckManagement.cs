using Components;
using MVVM;
using LogAPI.Models;
using System;
using System.Threading.Tasks;
using LogOne.APIClients;
using System.Linq;

namespace LogOne.NghiepVu.TruckManagement
{
    public partial class AllTruck : Component
    {
        public override string Title { get; set; } = "Truck";
        public ObservableArray<Header<Truck>> TruckHeader { get; set; } = new ObservableArray<Header<Truck>>();
        public ObservableArray<Truck> TruckData { get; set; } = new ObservableArray<Truck>();
        public Observable<string> TruckPlate { get; set; } = new Observable<string>();
        public Observable<int> FreightStateId { get; set; } = new Observable<int>();
        public Observable<string> BrandName { get; set; } = new Observable<string>();
        public Observable<string> Version { get; set; } = new Observable<string>();
        public Observable<int> VendorId { get; set; } = new Observable<int>();
        public Observable<decimal> Price { get; set; } = new Observable<decimal>();
        public Observable<string> Currency { get; set; } = new Observable<string>();
        public Observable<DateTime> ActiveDate { get; set; } = new Observable<DateTime>();
        public Observable<DateTime> ExpiredDate { get; set; } = new Observable<DateTime>();

        public AllTruck()
        {
            TruckHeader.Data = new Header<Truck>[]
            {
                new Header<Truck> { EditButton = true, EditEvent = async (Truck truck) => {
                    Console.WriteLine("Delete truck here");
                    await DeleteTruckAsync(truck);
                }},
                new Header<Truck> { HeaderText = "Truck plate", FieldName = "TruckPlate", Sortable = true },
                new Header<Truck> { HeaderText = "Freight state", FieldName = "FreightStateId", Sortable = true },
                new Header<Truck> { HeaderText = "Band name", FieldName = "BrandName", Sortable = true },
                new Header<Truck> { HeaderText = "Version", FieldName = "Version", Sortable = true },
                new Header<Truck> { HeaderText = "Vendor", FieldName = "VendorId", Sortable = true },
                new Header<Truck> { HeaderText = "Long", FieldName = "Long", Sortable = true },
                new Header<Truck> { HeaderText = "Lat", FieldName = "Lat", Sortable = true },
                new Header<Truck> { HeaderText = "Driver", FieldName = "DriverId", Sortable = true },
                new Header<Truck> { HeaderText = "Price", FieldName = "Price", Sortable = true },
                new Header<Truck> { HeaderText = "Currency", FieldName = "Currency", Sortable = true },
                new Header<Truck> { HeaderText = "Bought date", FieldName = "BoughtDate", Sortable = true },
                new Header<Truck> { HeaderText = "Active date", FieldName = "ActiveDate", Sortable = true },
                new Header<Truck> { HeaderText = "Expiry date", FieldName = "ExpiredDate", Sortable = true },
                new Header<Truck> { HeaderText = "Maintenance start", FieldName = "MaintenanceStart", Sortable = true },
                new Header<Truck> { HeaderText = "Maintenance end", FieldName = "MaintenanceEnd", Sortable = true },
                new Header<Truck> { HeaderText = "Next maintenance date", FieldName = "NextMaintenanceDate", Sortable = true },
                new Header<Truck> { HeaderText = "Maintenance period", FieldName = "MaintenancePeriod", Sortable = true },
                new Header<Truck> { HeaderText = "Active", FieldName = "Active", Sortable = true },
                new Header<Truck> { HeaderText = "Inserted date", FieldName = "InsertedDate", Sortable = true },
                new Header<Truck> { HeaderText = "Inserted by", FieldName = "InsertedBy", Sortable = true },
                new Header<Truck> { HeaderText = "Updated date", FieldName = "UpdatedDate", Sortable = true },
                new Header<Truck> { HeaderText = "Updated by", FieldName = "UpdatedBy", Sortable = true },
            };
        }

        public async Task CreateNewTruckAsync()
        {
            TruckPlate.Data = "Test asdasd";
            var truck = new Truck
            {
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
            var addedTruck = await client.Put(truck);
            TruckData.Add(addedTruck);
        }

        public async Task DeleteTruckAsync(Truck truck)
        {
            Console.WriteLine("Delete truck network");
            var client = new BaseClient<Truck>();
            await client.Delete(truck.Id);
            TruckData.Remove(truck);
        }
    }
}
