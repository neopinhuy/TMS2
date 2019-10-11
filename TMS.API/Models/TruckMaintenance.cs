namespace TMS.API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("TruckMaintenance")]
    public partial class TruckMaintenance
    {

        public TruckMaintenance()
        {
            TruckMaintenanceDetail = new HashSet<TruckMaintenanceDetail>();
        }

        public int Id { get; set; }

        public int? TruckId { get; set; }

        public int VendorId { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime StartDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime EndDate { get; set; }

        [Column(TypeName = "decimal(20, 5)")]
        public decimal AdvancedPaid { get; set; }

        public bool Paid { get; set; }

        public double Total { get; set; }

        [Required]
        [StringLength(50)]
        public string Currency { get; set; }

        public int AccountableUserId { get; set; }

        public int TicketId { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual MaintenanceTicket MaintenanceTicket { get; set; }

        public virtual Truck Truck { get; set; }

        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetail { get; set; }

        public virtual User AccoutableUser { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }

        public virtual Vendor Vendor { get; set; }
    }
}
