namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("Truck")]
    public partial class Truck
    {
        public Truck()
        {
            Accessory = new HashSet<Accessory>();
            Coordination = new HashSet<Coordination>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
            TruckMaintenance = new HashSet<TruckMaintenance>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string TruckPlate { get; set; }

        public int FreightStateId { get; set; }

        [Required]
        [StringLength(100)]
        public string BrandName { get; set; }

        [Required]
        [StringLength(50)]
        public string Version { get; set; }

        public int VendorId { get; set; }

        public double? Long { get; set; }

        public double? Lat { get; set; }

        public int DriverId { get; set; }

        public double Price { get; set; }

        [Required]
        [StringLength(50)]
        public string Currency { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime BoughtDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime ActiveDate { get; set; }

        [StringLength(10)]
        public string ExpiredDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? MaintenanceStart { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? MaintenanceEnd { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime NextMaintenanceDate { get; set; }

        public TimeSpan MaintenancePeriod { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual ICollection<Accessory> Accessory { get; set; }

        public virtual ICollection<Coordination> Coordination { get; set; }

        public virtual FreightState FreightState { get; set; }

        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }


        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }


        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }
    }
}
