using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class MaintenanceTicket
    {
        public MaintenanceTicket()
        {
            TruckMaintenance = new HashSet<TruckMaintenance>();
        }

        public int Id { get; set; }
        public int? TruckId { get; set; }
        public int? AccessaryId { get; set; }
        public int? ContainerId { get; set; }
        public int? AssigneeId { get; set; }
        public int? RoleId { get; set; }
        public int? GroupRoleId { get; set; }
        public int TicketStateId { get; set; }
        public bool HasAction { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual Accessory Accessary { get; set; }
        
        [JsonIgnore]
        public virtual User Assignee { get; set; }
        
        [JsonIgnore]
        public virtual Container Container { get; set; }
        
        [JsonIgnore]
        public virtual GroupRole GroupRole { get; set; }
        
        [JsonIgnore]
        public virtual TicketState IdNavigation { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Role Role { get; set; }
        
        [JsonIgnore]
        public virtual Truck Truck { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }
    }
}
