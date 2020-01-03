using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class CoordinationDetail
    {
        public CoordinationDetail()
        {
            Surcharge = new HashSet<Surcharge>();
        }

        public int Id { get; set; }
        public int? TruckId { get; set; }
        public int? DriverId { get; set; }
        public int? ContainerId { get; set; }
        public int? CoordinationId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EstimatedEndDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int? PackageId { get; set; }
        public int? FreightStateId { get; set; }
        public string Note { get; set; }
        public string SurchargeImages { get; set; }
        public string PackageImages { get; set; }
        public bool Active { get; set; }
        public DateTime? InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Container Container { get; set; }
        public virtual Coordination Coordination { get; set; }
        public virtual User Driver { get; set; }
        public virtual FreightState FreightState { get; set; }
        public virtual OrderDetail Package { get; set; }
        public virtual Truck Truck { get; set; }
        public virtual ICollection<Surcharge> Surcharge { get; set; }
    }
}
