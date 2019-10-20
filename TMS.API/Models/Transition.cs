using Newtonsoft.Json;
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

        [JsonIgnore]
        public virtual FreightState CurrentState { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual FreightState NextState { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Workflow Workflow { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TransitionAction> TransitionAction { get; set; }
    }
}
