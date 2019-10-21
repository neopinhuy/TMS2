using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Feature
    {
        public Feature()
        {
            FeaturePolicy = new HashSet<FeaturePolicy>();
            InverseParent = new HashSet<Feature>();
            UserInterface = new HashSet<UserInterface>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }
        public int? ParentId { get; set; }
        public string Icon { get; set; }
        public bool? IsDevider { get; set; }
        public bool? IsGroup { get; set; }
        public string ViewClass { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual Feature Parent { get; set; }
        public virtual ICollection<FeaturePolicy> FeaturePolicy { get; set; }
        public virtual ICollection<Feature> InverseParent { get; set; }
        public virtual ICollection<UserInterface> UserInterface { get; set; }
    }
}
