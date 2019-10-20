using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class TruckMaintenance
    {
        public TruckMaintenance()
        {
            TruckMaintenanceDetail = new HashSet<TruckMaintenanceDetail>();
        }

        public int Id { get; set; }
        public int? TruckId { get; set; }
        public int VendorId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public decimal AdvancedPaid { get; set; }
        public bool Paid { get; set; }
        public double Total { get; set; }
        public string Currency { get; set; }
        public int AccountableUserId { get; set; }
        public int TicketId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User AccountableUser { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual MaintenanceTicket Ticket { get; set; }
        
        [JsonIgnore]
        public virtual Truck Truck { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Vendor Vendor { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetail { get; set; }
    }
}
