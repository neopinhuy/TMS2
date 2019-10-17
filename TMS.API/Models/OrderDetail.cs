using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class OrderDetail
    {
        public OrderDetail()
        {
            Coordination = new HashSet<Coordination>();
            Surcharge = new HashSet<Surcharge>();
        }

        public int Id { get; set; }
        public int OrderId { get; set; }
        public bool IsContainer { get; set; }
        public int? TotalContainer { get; set; }
        public int? ContainerTypeId { get; set; }
        public int? VendorId { get; set; }
        public int CommodityTypeId { get; set; }
        public double? Weight { get; set; }
        public double? Volume { get; set; }
        public int? TimeboxId { get; set; }
        public int? QuotationId { get; set; }
        public decimal Price { get; set; }
        public string Currency { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual CommodityType CommodityType { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Order Order { get; set; }
        public virtual Timebox Timebox { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual Vendor Vendor { get; set; }
        public virtual ICollection<Coordination> Coordination { get; set; }
        public virtual ICollection<Surcharge> Surcharge { get; set; }
    }
}
