using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class Feature
    {
        public Feature()
        {
            ComponentGroup = new HashSet<ComponentGroup>();
            FeaturePolicy = new HashSet<FeaturePolicy>();
            GridPolicy = new HashSet<GridPolicy>();
            InverseParent = new HashSet<Feature>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Label { get; set; }
        public int? ParentId { get; set; }
        public string Icon { get; set; }
        public bool IsDevider { get; set; }
        public bool IsGroup { get; set; }
        public bool IsMenu { get; set; }
        public string ViewClass { get; set; }
        public int? EntityId { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Entity Entity { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Feature Parent { get; set; }
        public virtual ICollection<ComponentGroup> ComponentGroup { get; set; }
        public virtual ICollection<FeaturePolicy> FeaturePolicy { get; set; }
        public virtual ICollection<GridPolicy> GridPolicy { get; set; }
        public virtual ICollection<Feature> InverseParent { get; set; }
    }
}
