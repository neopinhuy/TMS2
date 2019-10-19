using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class PaymentApproval
    {
        public int Id { get; set; }
        public int ApproverId { get; set; }
        public int LedgerId { get; set; }
        public bool Approved { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }
    }
}
