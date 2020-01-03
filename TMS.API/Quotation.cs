using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class Quotation
    {
        public Quotation()
        {
            OrderDetail = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public int? CustomerId { get; set; }
        public int? CustomerGroupId { get; set; }
        public bool ForGroupOnly { get; set; }
        public int? FromId { get; set; }
        public int? ToId { get; set; }
        public int? EmptyContFromId { get; set; }
        public int? EmptyContToId { get; set; }
        public int? DistanceRangeId { get; set; }
        public int? ContainerTypeId { get; set; }
        public int? TruckTypeId { get; set; }
        public bool IsContainer { get; set; }
        public int? ContainerRangeId { get; set; }
        public int? VendorId { get; set; }
        public int? CommodityTypeId { get; set; }
        public int? WeightRangeId { get; set; }
        public int? VolumeRangeId { get; set; }
        public int? TimeboxId { get; set; }
        public DateTime? EffectiveDate { get; set; }
        public DateTime? ExpiredDate { get; set; }
        public decimal? Price { get; set; }
        public int? CurrencyId { get; set; }
        public int? PriceTypeId { get; set; }
        public decimal? Vat { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual CommodityType CommodityType { get; set; }
        public virtual ContainerRange ContainerRange { get; set; }
        public virtual ContainerType ContainerType { get; set; }
        public virtual Currency Currency { get; set; }
        public virtual CustomerGroup CustomerGroup { get; set; }
        public virtual DistanceRange DistanceRange { get; set; }
        public virtual Terminal EmptyContFrom { get; set; }
        public virtual Terminal EmptyContTo { get; set; }
        public virtual Terminal From { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual PriceType PriceType { get; set; }
        public virtual Timebox Timebox { get; set; }
        public virtual Terminal To { get; set; }
        public virtual TruckType TruckType { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual Vendor Vendor { get; set; }
        public virtual VolumeRange VolumeRange { get; set; }
        public virtual WeightRange WeightRange { get; set; }
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
    }
}
