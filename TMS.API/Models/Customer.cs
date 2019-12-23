using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Customer
    {
        public Customer()
        {
            CustomerCare = new HashSet<CustomerCare>();
            Order = new HashSet<Order>();
        }

        public int Id { get; set; }
        public int? CustomerGroupId { get; set; }
        public int UserId { get; set; }
        public DateTime? LastCall { get; set; }
        public DateTime? LastEmail { get; set; }
        public DateTime? LastChat { get; set; }
        public DateTime? LastText { get; set; }
        public int? CustomerStateId { get; set; }
        public string Note { get; set; }
        public string Email { get; set; }
        public string Skype { get; set; }
        public string Zalo { get; set; }
        public string Viber { get; set; }
        public string OtherContact { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual CustomerGroup CustomerGroup { get; set; }
        public virtual CustomerState CustomerState { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<CustomerCare> CustomerCare { get; set; }
        public virtual ICollection<Order> Order { get; set; }
    }
}
