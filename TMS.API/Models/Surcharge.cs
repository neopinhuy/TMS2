using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Surcharge
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public int? OrderDetailId { get; set; }
        public int? CoordinationDetailId { get; set; }
        public int? SurchargeTypeId { get; set; }
        public int? PriceTypeId { get; set; }
        public decimal? UnitPrice { get; set; }
        public decimal? Quantity { get; set; }
        public decimal? Vat { get; set; }
        public decimal? PriceAfterTax { get; set; }
        public string Note { get; set; }
        public int? CurrencyId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual CoordinationDetail CoordinationDetail { get; set; }
        public virtual Currency Currency { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Order Order { get; set; }
        public virtual OrderDetail OrderDetail { get; set; }
        public virtual PriceType PriceType { get; set; }
        public virtual SurchargeType SurchargeType { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
