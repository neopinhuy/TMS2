using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class TransitionAction
    {
        public int TransitionId { get; set; }
        public int ActionId { get; set; }

        [JsonIgnore]
        public virtual Action Action { get; set; }
        
        [JsonIgnore]
        public virtual Transition Transition { get; set; }
    }
}
