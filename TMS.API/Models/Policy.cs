using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Policy
    {
        public Policy()
        {
            EntityPolicy = new HashSet<EntityPolicy>();
            UserInterface = new HashSet<UserInterface>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool? IncludeAll { get; set; }
        public bool? IncludedOwner { get; set; }
        public string IncludedGroupRole { get; set; }
        public string IncludedUser { get; set; }
        public string ExcludedGroupRole { get; set; }
        public string ExcludedUserIds { get; set; }
        public bool? ExcludeAll { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ICollection<EntityPolicy> EntityPolicy { get; set; }
        public virtual ICollection<UserInterface> UserInterface { get; set; }
    }
}
