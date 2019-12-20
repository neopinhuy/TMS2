using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Coordination
    {
        public Coordination()
        {
            CoordinationDetail = new HashSet<CoordinationDetail>();
            OrderComposition = new HashSet<OrderComposition>();
        }

        public int Id { get; set; }
        public int? FromId { get; set; }
        public int? ToId { get; set; }
        public int? EmptyContFromId { get; set; }
        public int? EmptyContToId { get; set; }
        public int? TruckTypeId { get; set; }
        public int? CommodityTypeId { get; set; }
        public int? TotalContainer { get; set; }
        public bool IsComposited { get; set; }
        public decimal? Weight { get; set; }
        public decimal? Volume { get; set; }
        public decimal? Distance { get; set; }
        public int? TimeboxId { get; set; }
        public int? FreightStateId { get; set; }
        public int? TaskStateId { get; set; }
        public int? ContainerTypeId { get; set; }
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
        public virtual FreightState FreightState { get; set; }
        public virtual Terminal From { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual TaskState TaskState { get; set; }
        public virtual Timebox Timebox { get; set; }
        public virtual Terminal To { get; set; }
        public virtual TruckType TruckType { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<CoordinationDetail> CoordinationDetail { get; set; }
        public virtual ICollection<OrderComposition> OrderComposition { get; set; }
    }
}
