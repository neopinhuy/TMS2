using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class OrderComposition
    {
        public int Id { get; set; }
        public int CoordinationId { get; set; }
        public int? OrderDetailId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Coordination Coordination { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual OrderDetail OrderDetail { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
