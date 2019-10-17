using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class ContainerMaintenance
    {
        public int Id { get; set; }
        public int ContainerId { get; set; }
        public int VendorId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public decimal AdvancedPaid { get; set; }
        public bool Paid { get; set; }
        public double Total { get; set; }
        public string Currency { get; set; }
        public int AccountableUserId { get; set; }
        public int TicketId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }
    }
}
