using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class Role
    {
        public Role()
        {
            GroupMember = new HashSet<GroupMember>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
            User = new HashSet<User>();
        }

        public int Id { get; set; }
        public string RoleName { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ICollection<GroupMember> GroupMember { get; set; }
        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }
        public virtual ICollection<User> User { get; set; }
    }
}
