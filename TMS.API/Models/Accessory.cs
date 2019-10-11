namespace TMS.API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Accessory")]
    public partial class Accessory
    {

        public Accessory()
        {
            TruckMaintenanceDetail = new HashSet<TruckMaintenanceDetail>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
        }

        public int Id { get; set; }

        public int? TruckId { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Required]
        [StringLength(100)]
        public string Version { get; set; }

        public int VendorId { get; set; }

        [Column(TypeName = "decimal(20, 5)")]
        public decimal Price { get; set; }

        [Required]
        [StringLength(50)]
        public string Currency { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime AssembledDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime ExpiredDate { get; set; }

        public TimeSpan MaintenancePeriod { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime NextMaintenanceDate { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual Vendor Vendor { get; set; }

        public virtual Truck Truck { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }

        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetail { get; set; }

        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }

        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }
    }
}
