using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class TransitionAction
    {
        public int Id { get; set; }
        public int TransitionId { get; set; }
        public int ActionId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Action Action { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Transition Transition { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
