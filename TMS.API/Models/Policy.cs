using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Policy
    {
        public Policy()
        {
            ActionPolicy = new HashSet<ActionPolicy>();
            Component = new HashSet<Component>();
            ComponentGroup = new HashSet<ComponentGroup>();
            EntityPolicy = new HashSet<EntityPolicy>();
            FeaturePolicy = new HashSet<FeaturePolicy>();
            GridPolicy = new HashSet<GridPolicy>();
            PaymentPolicy = new HashSet<PaymentPolicy>();
            StatePolicy = new HashSet<StatePolicy>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool? IncludeAll { get; set; }
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

        public virtual ICollection<ActionPolicy> ActionPolicy { get; set; }
        public virtual ICollection<Component> Component { get; set; }
        public virtual ICollection<ComponentGroup> ComponentGroup { get; set; }
        public virtual ICollection<EntityPolicy> EntityPolicy { get; set; }
        public virtual ICollection<FeaturePolicy> FeaturePolicy { get; set; }
        public virtual ICollection<GridPolicy> GridPolicy { get; set; }
        public virtual ICollection<PaymentPolicy> PaymentPolicy { get; set; }
        public virtual ICollection<StatePolicy> StatePolicy { get; set; }
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }
    }
}
