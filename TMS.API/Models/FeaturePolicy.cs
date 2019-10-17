using System;
using System.Collections.Generic;

namespace TMS.API.Models
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
    }
}
