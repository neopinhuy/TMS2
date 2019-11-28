using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class StackDirection
    {
        public StackDirection()
        {
            OrderDetail = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
    }
}
