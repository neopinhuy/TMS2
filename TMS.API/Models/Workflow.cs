using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Workflow
    {
        public Workflow()
        {
            FreightState = new HashSet<FreightState>();
            Transition = new HashSet<Transition>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime? EffectiveDate { get; set; }
        public DateTime? ExpiredDate { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User IdNavigation { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual ICollection<FreightState> FreightState { get; set; }
        public virtual ICollection<Transition> Transition { get; set; }
    }
}
