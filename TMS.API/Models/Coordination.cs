using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Coordination
    {
        public Coordination()
        {
            FreightHistory = new HashSet<FreightHistory>();
            OrderComposition = new HashSet<OrderComposition>();
        }

        public int Id { get; set; }
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

        [JsonIgnore]
        public virtual Container Container { get; set; }
        
        [JsonIgnore]
        public virtual User Driver { get; set; }
        
        [JsonIgnore]
        public virtual FreightState FreightState { get; set; }
        
        [JsonIgnore]
        public virtual Terminal From { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Terminal To { get; set; }
        
        [JsonIgnore]
        public virtual Truck Truck { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightHistory> FreightHistory { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<OrderComposition> OrderComposition { get; set; }
    }
}
