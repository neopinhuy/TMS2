using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderDetail = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }
        public int CustomerId { get; set; }
        public string ContactFirstName { get; set; }
        public string ContactLastName { get; set; }
        public string ContactNumber { get; set; }
        public string ContactSsn { get; set; }
        public string ContactPassport { get; set; }
        public string ContactAddress { get; set; }
        public int FromId { get; set; }
        public int ToId { get; set; }
        public int? TotalContainer { get; set; }
        public double TotalPrice { get; set; }
        public string Currency { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual Terminal From { get; set; }
        public virtual Terminal IdNavigation { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
    }
}
