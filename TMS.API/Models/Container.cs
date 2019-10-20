using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Container
    {
        public Container()
        {
            Coordination = new HashSet<Coordination>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
        }

        public int Id { get; set; }
        public int VendorId { get; set; }
        public int ContainerTypeId { get; set; }
        public string Code { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }
        public int FreightStateId { get; set; }
        public DateTime RentDate { get; set; }
        public DateTime EndRentDate { get; set; }
        public double Price { get; set; }
        public string Currency { get; set; }
        public bool InUse { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual FreightState FreightState { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Vendor Vendor { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Coordination> Coordination { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }
    }
}
