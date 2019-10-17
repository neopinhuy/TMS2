using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Coordination
    {
        public Coordination()
        {
            FreightBalance = new HashSet<FreightBalance>();
            FreightHistory = new HashSet<FreightHistory>();
            UserBalance = new HashSet<UserBalance>();
        }

        public int Id { get; set; }
        public int OrderDetailId { get; set; }
        public int TruckId { get; set; }
        public int DriverId { get; set; }
        public int FromId { get; set; }
        public int ToId { get; set; }
        public double Distance { get; set; }
        public int FreightStateId { get; set; }
        public int ContainerId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Container Container { get; set; }
        public virtual User Driver { get; set; }
        public virtual FreightState FreightState { get; set; }
        public virtual Terminal From { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual OrderDetail OrderDetail { get; set; }
        public virtual Terminal To { get; set; }
        public virtual Truck Truck { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<FreightBalance> FreightBalance { get; set; }
        public virtual ICollection<FreightHistory> FreightHistory { get; set; }
        public virtual ICollection<UserBalance> UserBalance { get; set; }
    }
}
