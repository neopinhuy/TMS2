namespace TMS.API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Role")]
    public partial class Role
    {

        public Role()
        {
            ContainerMonitorConfig = new HashSet<ContainerMonitorConfig>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
            PaymentApprovalConfig = new HashSet<PaymentApprovalConfig>();
            RightByRole = new HashSet<RightByRole>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
            User = new HashSet<User>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string RoleName { get; set; }

        [StringLength(100)]
        public string Description { get; set; }

        public int? GroupId { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual ICollection<ContainerMonitorConfig> ContainerMonitorConfig { get; set; }

        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }

        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfig { get; set; }

        public virtual ICollection<RightByRole> RightByRole { get; set; }

        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }

        public virtual ICollection<User> User { get; set; }
    }
}
