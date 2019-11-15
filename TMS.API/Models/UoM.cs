using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class UoM
    {
        public UoM()
        {
            DistanceRange = new HashSet<DistanceRange>();
            VolumeRange = new HashSet<VolumeRange>();
            WeightRange = new HashSet<WeightRange>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int? UomTypeId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual UomType UomType { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<DistanceRange> DistanceRange { get; set; }
        public virtual ICollection<VolumeRange> VolumeRange { get; set; }
        public virtual ICollection<WeightRange> WeightRange { get; set; }
    }
}
