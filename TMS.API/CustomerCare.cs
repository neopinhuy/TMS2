using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class CustomerCare
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public int AssignedUserId { get; set; }
        public string Note { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User AssignedUser { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
