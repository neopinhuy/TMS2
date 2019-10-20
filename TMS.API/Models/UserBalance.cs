using Newtonsoft.Json;
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

        [JsonIgnore]
        public virtual Coordination Coordinator { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Objective PaymentObjective { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual User User { get; set; }
    }
}
