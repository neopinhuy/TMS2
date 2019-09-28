using Components;
using MVVM;
using System;

namespace LogOne.NghiepVu.Truck
{
    public partial class TruckManagement : Component
    {
        public override string Title { get; set; } = "Truck";
        public ObservableArray<Header<object>> TruckHeader { get; set; }
        public ObservableArray<object> TruckData { get; set; }

        public TruckManagement()
        {
            TruckHeader = new ObservableArray<Header<object>>(new Header<object>[]
            {
                new Header<object> { HeaderText = "Truck plate", FieldName = "TruckPlate", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "FreightStateId", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "BrandName", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "Version", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "VendorId", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "Long", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "Lat", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "DriverId", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "Price", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "Currency", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "BoughtDate", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "ActiveDate", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "ExpiredDate", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "MaintenanceStart", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "MaintenanceEnd", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "NextMaintenanceDate", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "MaintenancePeriod", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "Active", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "InsertedDate", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "InsertedBy", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "UpdatedDate", Sortable = true },
                new Header<object> { HeaderText = "Truck plate", FieldName = "UpdatedBy", Sortable = true },
            });
        }
    }
}
