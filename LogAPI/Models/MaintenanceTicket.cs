namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("MaintenanceTicket")]
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

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual Accessory Accessory { get; set; }

        public virtual Container Container { get; set; }

        public virtual GroupRole GroupRole { get; set; }

        public virtual User Assignee { get; set; }

        public virtual Role Role { get; set; }

        public virtual TicketState TicketState { get; set; }

        public virtual Truck Truck { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }

        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }
    }
}
