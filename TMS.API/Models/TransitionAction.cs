using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class TransitionAction
    {
        public int TransitionId { get; set; }
        public int ActionId { get; set; }

        public virtual Action Action { get; set; }
        public virtual Transition Transition { get; set; }
    }
}
