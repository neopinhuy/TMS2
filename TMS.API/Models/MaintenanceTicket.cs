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
        public int? AccessoryId { get; set; }
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

        public virtual Accessory Accessory { get; set; }
        public virtual User Assignee { get; set; }
        public virtual Container Container { get; set; }
        public virtual GroupRole GroupRole { get; set; }
        public virtual TicketState IdNavigation { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Role Role { get; set; }
        public virtual Truck Truck { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }
    }
}
