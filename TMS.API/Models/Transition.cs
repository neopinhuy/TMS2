using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Transition
    {
        public Transition()
        {
            TransitionAction = new HashSet<TransitionAction>();
        }

        public int Id { get; set; }
        public int WorkflowId { get; set; }
        public int CurrentStateId { get; set; }
        public int NextStateId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual FreightState CurrentState { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual FreightState NextState { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual Workflow Workflow { get; set; }
        public virtual ICollection<TransitionAction> TransitionAction { get; set; }
    }
}
