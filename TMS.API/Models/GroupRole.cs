using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class GroupRole
    {
        public GroupRole()
        {
            ContainerMonitorConfig = new HashSet<ContainerMonitorConfig>();
            GroupMember = new HashSet<GroupMember>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
            PaymentApprovalConfig = new HashSet<PaymentApprovalConfig>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<ContainerMonitorConfig> ContainerMonitorConfig { get; set; }
        public virtual ICollection<GroupMember> GroupMember { get; set; }
        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }
        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfig { get; set; }
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }
    }
}
