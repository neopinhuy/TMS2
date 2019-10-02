namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("GroupRole")]
    public partial class GroupRole
    {

        public GroupRole()
        {
            ContainerMonitorConfig = new HashSet<ContainerMonitorConfig>();
            PaymentApprovalConfig = new HashSet<PaymentApprovalConfig>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(200)]
        public string Description { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }


        public virtual ICollection<ContainerMonitorConfig> ContainerMonitorConfig { get; set; }


        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfig { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }


        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }


        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }
    }
}
