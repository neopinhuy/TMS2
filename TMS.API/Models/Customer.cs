using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Order = new HashSet<Order>();
        }

        public int Id { get; set; }
        public int? CustomerGroupId { get; set; }
        public int UserId { get; set; }
        public DateTime? LastCall { get; set; }
        public int? CustomerStateId { get; set; }
        public string Note { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual CustomerGroup CustomerGroup { get; set; }
        public virtual CustomerState CustomerState { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Order> Order { get; set; }
    }
}
