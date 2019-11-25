using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class CoordinationDetail
    {
        public int Id { get; set; }
        public int? TruckId { get; set; }
        public int? DriverId { get; set; }
        public int? ContainerId { get; set; }
        public int? CoordinationId { get; set; }
        public int? FrieghtStateId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Container Container { get; set; }
        public virtual Coordination Coordination { get; set; }
        public virtual User Driver { get; set; }
        public virtual FreightState FrieghtState { get; set; }
        public virtual Truck Truck { get; set; }
    }
}
