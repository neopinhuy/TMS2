using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class TruckMonitorConfig
    {
        public int Id { get; set; }
        public int TruckId { get; set; }
        public int? AccessoryId { get; set; }
        public int? PolicyId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Accessory Accessory { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Policy Policy { get; set; }
        public virtual Truck Truck { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
