using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class FreightState
    {
        public FreightState()
        {
            Container = new HashSet<Container>();
            Coordination = new HashSet<Coordination>();
            FreightHistory = new HashSet<FreightHistory>();
            StatePolicy = new HashSet<StatePolicy>();
            TransitionCurrentState = new HashSet<Transition>();
            TransitionNextState = new HashSet<Transition>();
            UserInterface = new HashSet<UserInterface>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int? WorkflowId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }

        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Workflow Workflow { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Container> Container { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Coordination> Coordination { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightHistory> FreightHistory { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<StatePolicy> StatePolicy { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Transition> TransitionCurrentState { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Transition> TransitionNextState { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<UserInterface> UserInterface { get; set; }
    }
}
