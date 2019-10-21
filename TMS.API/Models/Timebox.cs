using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Timebox
    {
        public Timebox()
        {
            OrderDetail = new HashSet<OrderDetail>();
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }
        public TimeSpan TimeboxStart { get; set; }
        public TimeSpan TimeboxEnd { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
