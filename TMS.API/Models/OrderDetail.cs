using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class OrderDetail
    {
        public OrderDetail()
        {
            CoordinationDetail = new HashSet<CoordinationDetail>();
            OrderComposition = new HashSet<OrderComposition>();
            Surcharge = new HashSet<Surcharge>();
        }

        public int Id { get; set; }
        public int OrderId { get; set; }
        public string GoodsName { get; set; }
        public DateTime? ExpectedTransportDate { get; set; }
        public int? FromId { get; set; }
        public int? ToId { get; set; }
        public int? EmptyContFromId { get; set; }
        public int? EmptyContToId { get; set; }
        public int? ContainerTypeId { get; set; }
        public int? TruckTypeId { get; set; }
        public bool IsContainer { get; set; }
        public int? CommodityTypeId { get; set; }
        public int? VendorId { get; set; }
        public decimal? BoxLength { get; set; }
        public decimal? BoxWidth { get; set; }
        public decimal? BoxHeight { get; set; }
        public decimal? BoxVolume { get; set; }
        public decimal? BoxWeight { get; set; }
        public decimal? TotalWeight { get; set; }
        public decimal? TotalVolume { get; set; }
        public int? TotalBox { get; set; }
        public int? TotalContainer { get; set; }
        public int? StackDirectionId { get; set; }
        public int? MinStack { get; set; }
        public int? MaxStack { get; set; }
        public decimal? TransportDistance { get; set; }
        public int? TimeboxId { get; set; }
        public int? QuotationId { get; set; }
        public decimal? TotalPriceBeforeDiscount { get; set; }
        public decimal? DiscountMoney { get; set; }
        public decimal? DiscountPercentage { get; set; }
        public decimal? TotalPriceAfterDiscount { get; set; }
        public decimal? Vat { get; set; }
        public decimal? TotalDiscountAfterTax { get; set; }
        public int? CurrencyId { get; set; }
        public string Note { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual CommodityType CommodityType { get; set; }
        public virtual ContainerType ContainerType { get; set; }
        public virtual Terminal EmptyContFrom { get; set; }
        public virtual Terminal EmptyContTo { get; set; }
        public virtual Terminal From { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Order Order { get; set; }
        public virtual Quotation Quotation { get; set; }
        public virtual StackDirection StackDirection { get; set; }
        public virtual Timebox Timebox { get; set; }
        public virtual Terminal To { get; set; }
        public virtual TruckType TruckType { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual Vendor Vendor { get; set; }
        public virtual ICollection<CoordinationDetail> CoordinationDetail { get; set; }
        public virtual ICollection<OrderComposition> OrderComposition { get; set; }
        public virtual ICollection<Surcharge> Surcharge { get; set; }
    }
}
