using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class LiabilitiesWarning
    {
        public int Id { get; set; }
        public int? LedgerId { get; set; }
        public DateTime? DueDate { get; set; }
        public int? ProcessStatusId { get; set; }
        public string Note { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual Ledger Ledger { get; set; }
        public virtual MasterData ProcessStatus { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
