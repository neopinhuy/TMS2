using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class WeightRange
    {
        public WeightRange()
        {
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }
        public double WeightStart { get; set; }
        public double? WeightEnd { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
