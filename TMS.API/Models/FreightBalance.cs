using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class FreightBalance
    {
        public int Id { get; set; }
        public int? CoordinationId { get; set; }
        public double Debit { get; set; }
        public double Credit { get; set; }
        public string Curency { get; set; }
        public int ObjectiveId { get; set; }
        public int? RefferenceId { get; set; }
        public string Entity { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Coordination Coordination { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Objective Objective { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
