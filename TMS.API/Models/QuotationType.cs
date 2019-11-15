using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class QuotationType
    {
        public QuotationType()
        {
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
