using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Truck
    {
        public Truck()
        {
            Accessory = new HashSet<Accessory>();
            Coordination = new HashSet<Coordination>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
            TruckMaintenance = new HashSet<TruckMaintenance>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
        }

        public int Id { get; set; }
        public string TruckPlate { get; set; }
        public int FreightStateId { get; set; }
        public string BrandName { get; set; }
        public string Version { get; set; }
        public int VendorId { get; set; }
        public double? Long { get; set; }
        public double? Lat { get; set; }
        public int DriverId { get; set; }
        public decimal Price { get; set; }
        public string Currency { get; set; }
        public DateTime BoughtDate { get; set; }
        public DateTime? ActiveDate { get; set; }
        public DateTime? ExpiredDate { get; set; }
        public DateTime? MaintenanceStart { get; set; }
        public DateTime? MaintenanceEnd { get; set; }
        public DateTime? NextMaintenanceDate { get; set; }
        public TimeSpan? MaintenancePeriod { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual FreightState FreightState { get; set; }
        public virtual ICollection<Accessory> Accessory { get; set; }
        public virtual ICollection<Coordination> Coordination { get; set; }
        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }
        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }
    }
}
