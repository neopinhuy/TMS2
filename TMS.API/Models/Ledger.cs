using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Ledger
    {
        public int Id { get; set; }
        public double? Debit { get; set; }
        public double? Credit { get; set; }
        public int? CurrencyId { get; set; }
        public bool Cash { get; set; }
        public bool HasInvoice { get; set; }
        public string InvoiceNo { get; set; }
        public DateTime? InvoiceDate { get; set; }
        public string InvoiceImage { get; set; }
        public int? DebitAccountId { get; set; }
        public int? CreditAccountId { get; set; }
        public decimal? ExchangeRate { get; set; }
        public int? EntityId { get; set; }
        public int? TargetId { get; set; }
        public bool? Approved { get; set; }
        public int? ApproverId { get; set; }
        public string ReceivedAccount { get; set; }
        public string ReceiverFullName { get; set; }
        public int? ReceiverBankId { get; set; }
        public int? ReceiverBankBranchId { get; set; }
        public string Note { get; set; }
        public bool Active { get; set; }
        public DateTime? InsertedDate { get; set; }
        public int? InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User Approver { get; set; }
        public virtual AccountType CreditAccount { get; set; }
        public virtual Currency Currency { get; set; }
        public virtual AccountType DebitAccount { get; set; }
        public virtual Entity Entity { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Bank ReceiverBank { get; set; }
        public virtual BankBranch ReceiverBankBranch { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
