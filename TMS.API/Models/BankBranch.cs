using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class BankBranch
    {
        public BankBranch()
        {
            Ledger = new HashSet<Ledger>();
        }

        public int Id { get; set; }
        public int BankId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public bool? Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Bank Bank { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Ledger> Ledger { get; set; }
    }
}
