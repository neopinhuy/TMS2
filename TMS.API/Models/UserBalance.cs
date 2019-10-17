using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class UserBalance
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public double? Debit { get; set; }
        public double? Credit { get; set; }
        public string Currency { get; set; }
        public int HasInvoice { get; set; }
        public string InvoiceImage { get; set; }
        public int PaymentObjectiveId { get; set; }
        public bool ShouldCountToSalary { get; set; }
        public int? CoordinatorId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Coordination Coordinator { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Objective PaymentObjective { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual User User { get; set; }
    }
}
