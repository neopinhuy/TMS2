﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Ledger
    {
        public int Id { get; set; }
        public double? Debit { get; set; }
        public double? Credit { get; set; }
        public string Curency { get; set; }
        public int ObjectiveId { get; set; }
        public bool? HasInvoice { get; set; }
        public string InvoiceImage { get; set; }
        public int OperationTypeId { get; set; }
        public int? EntityId { get; set; }
        public int? TargetId { get; set; }
        public bool? Approved { get; set; }
        public int? ApproverId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User Approver { get; set; }
        
        [JsonIgnore]
        public virtual Entity Entity { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Objective Objective { get; set; }
        
        [JsonIgnore]
        public virtual OperationType OperationType { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
    }
}
