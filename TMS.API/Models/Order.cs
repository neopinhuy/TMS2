using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderDetail = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public int? CustomerId { get; set; }
        public string ContactFirstName { get; set; }
        public string ContactLastName { get; set; }
        public string ContactNumber { get; set; }
        public string ContactSsn { get; set; }
        public string ContactPassport { get; set; }
        public string ContactAddress { get; set; }
        public int? TotalContainer { get; set; }
        public int? QuotationId { get; set; }
        public decimal? AdvancedPaid { get; set; }
        public bool Paid { get; set; }
        public decimal? DiscountMoney { get; set; }
        public decimal? DiscountPercentage { get; set; }
        public decimal? Vat { get; set; }
        public decimal? TotalPriceBeforeDiscount { get; set; }
        public decimal? TotalPriceAfterDiscount { get; set; }
        public decimal? TotalPriceAfterTax { get; set; }
        public int? CurrencyId { get; set; }
        public DateTime? AdvancedPaidDate { get; set; }
        public DateTime? PaidDate { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Quotation Quotation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
    }
}
