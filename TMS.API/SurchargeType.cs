using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class SurchargeType
    {
        public SurchargeType()
        {
            Surcharge = new HashSet<Surcharge>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public decimal? UnitPrice { get; set; }
        public int? PriceTypeId { get; set; }
        public string Description { get; set; }
        public int? CurrencyId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual PriceType PriceType { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Surcharge> Surcharge { get; set; }
    }
}
