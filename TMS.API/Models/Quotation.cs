using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Quotation
    {
        public int Id { get; set; }
        public int? CustomerId { get; set; }
        public int? CustomerGroupId { get; set; }
        public int FromId { get; set; }
        public int ToId { get; set; }
        public int? ContainerTypeId { get; set; }
        public bool IsContainer { get; set; }
        public int? TotalContainer { get; set; }
        public int? VendorId { get; set; }
        public int CommodityTypeId { get; set; }
        public int? WeightRangeId { get; set; }
        public int? VolumeRangeId { get; set; }
        public int? TimeboxId { get; set; }
        public DateTime EffectiveDate { get; set; }
        public DateTime ExpiredDate { get; set; }
        public decimal Price { get; set; }
        public string Currency { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual CommodityType CommodityType { get; set; }
        public virtual ContainerType ContainerType { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual CustomerGroup CustomerGroup { get; set; }
        public virtual Terminal From { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Timebox Timebox { get; set; }
        public virtual Terminal To { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual Vendor Vendor { get; set; }
        public virtual VolumeRange VolumeRange { get; set; }
        public virtual WeightRange WeightRange { get; set; }
    }
}
