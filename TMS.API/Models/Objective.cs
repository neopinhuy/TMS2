using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Objective
    {
        public Objective()
        {
            Ledger = new HashSet<Ledger>();
        }

        public int Id { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ICollection<Ledger> Ledger { get; set; }
    }
}
