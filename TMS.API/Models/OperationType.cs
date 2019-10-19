using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class OperationType
    {
        public OperationType()
        {
            Ledger = new HashSet<Ledger>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ICollection<Ledger> Ledger { get; set; }
    }
}
