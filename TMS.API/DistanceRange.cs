using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class DistanceRange
    {
        public DistanceRange()
        {
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }
        public decimal MinDistance { get; set; }
        public decimal MaxDistance { get; set; }
        public int? UomId { get; set; }
        public string Note { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual UoM Uom { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
