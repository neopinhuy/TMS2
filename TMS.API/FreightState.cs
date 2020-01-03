using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class FreightState
    {
        public FreightState()
        {
            Component = new HashSet<Component>();
            ComponentGroup = new HashSet<ComponentGroup>();
            Container = new HashSet<Container>();
            Coordination = new HashSet<Coordination>();
            CoordinationDetail = new HashSet<CoordinationDetail>();
            GridPolicy = new HashSet<GridPolicy>();
            Order = new HashSet<Order>();
            StatePolicy = new HashSet<StatePolicy>();
            TransitionCurrentState = new HashSet<Transition>();
            TransitionNextState = new HashSet<Transition>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int? StateTypeId { get; set; }
        public int? WorkflowId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual StateType StateType { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual Workflow Workflow { get; set; }
        public virtual ICollection<Component> Component { get; set; }
        public virtual ICollection<ComponentGroup> ComponentGroup { get; set; }
        public virtual ICollection<Container> Container { get; set; }
        public virtual ICollection<Coordination> Coordination { get; set; }
        public virtual ICollection<CoordinationDetail> CoordinationDetail { get; set; }
        public virtual ICollection<GridPolicy> GridPolicy { get; set; }
        public virtual ICollection<Order> Order { get; set; }
        public virtual ICollection<StatePolicy> StatePolicy { get; set; }
        public virtual ICollection<Transition> TransitionCurrentState { get; set; }
        public virtual ICollection<Transition> TransitionNextState { get; set; }
    }
}
