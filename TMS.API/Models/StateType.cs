using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class StateType
    {
        public StateType()
        {
            FreightState = new HashSet<FreightState>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<FreightState> FreightState { get; set; }
    }
}
