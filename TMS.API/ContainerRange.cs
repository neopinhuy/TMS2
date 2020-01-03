using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class ContainerRange
    {
        public ContainerRange()
        {
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }
        public int MinContainer { get; set; }
        public int MaxContainer { get; set; }
        public string Note { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
