using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class CustomerGroup
    {
        public CustomerGroup()
        {
            Customer = new HashSet<Customer>();
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }
        public string GroupName { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ICollection<Customer> Customer { get; set; }
        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
