using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class FeaturePolicy
    {
        public int Id { get; set; }
        public int FeatureId { get; set; }
        public int PolicyId { get; set; }
        public bool CanSee { get; set; }
        public bool CanAdd { get; set; }
        public bool CanEdit { get; set; }
        public bool CanDelete { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Feature Feature { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Policy Policy { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
