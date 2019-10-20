using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Accessory
    {
        public Accessory()
        {
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
            TruckMaintenanceDetail = new HashSet<TruckMaintenanceDetail>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
        }

        public int Id { get; set; }
        public int? TruckId { get; set; }
        public string Name { get; set; }
        public string Version { get; set; }
        public int VendorId { get; set; }
        public decimal Price { get; set; }
        public string Currency { get; set; }
        public DateTime AssembledDate { get; set; }
        public DateTime ExpiredDate { get; set; }
        public TimeSpan MaintenancePeriod { get; set; }
        public DateTime NextMaintenanceDate { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Truck Truck { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Vendor Vendor { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetail { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }
    }
}
