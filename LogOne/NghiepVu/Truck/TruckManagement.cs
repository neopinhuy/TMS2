using Components;
using MVVM;
using LogAPI.Models;
using System;
using System.Threading.Tasks;
using LogOne.APIClients;

namespace LogOne.NghiepVu.TruckManagement
{
    public partial class AllTruck : Component
    {
        public override string Title { get; set; } = "Truck";
        public ObservableArray<Header<Truck>> TruckHeader { get; set; }
        public ObservableArray<Truck> TruckData { get; set; }

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
            TruckHeader = new ObservableArray<Header<Truck>>(new Header<Truck>[]
            {
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
            });

            TruckData = new ObservableArray<Truck>(new Truck[] 
            { 
                new Truck {
                    TruckPlate = "0982-K8", FreightStateId = 1, BrandName = "Honda", Version = "Everest",
                    VendorId = 1, Long = 10.1233, Lat = 11.22209, DriverId = 1, Price = 10000, Currency = "USD",
                    BoughtDate = new DateTime(2018, 1, 1), ActiveDate = new DateTime(2018, 1, 1), ExpiredDate = new DateTime(2019, 1, 1),
                    MaintenanceStart = null, MaintenanceEnd = null, Active = true, InsertedBy = 1, InsertedDate = new DateTime(2018, 1, 1),
                    UpdatedBy = null, UpdatedDate = null
                }
            });
        }

        public async Task CreateNewTruckAsync()
        {
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
    }
}
