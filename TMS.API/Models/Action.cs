using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Action
    {
        public Action()
        {
            ActionPolicy = new HashSet<ActionPolicy>();
            FreightHistory = new HashSet<FreightHistory>();
            TransitionAction = new HashSet<TransitionAction>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
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
        public virtual ICollection<ActionPolicy> ActionPolicy { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightHistory> FreightHistory { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TransitionAction> TransitionAction { get; set; }
    }
}
