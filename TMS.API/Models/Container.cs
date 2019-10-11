namespace TMS.API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Container")]
    public partial class Container
    {

        public Container()
        {
            ContainerMonitorConfig = new HashSet<ContainerMonitorConfig>();
            Coordination = new HashSet<Coordination>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
        }

        public int Id { get; set; }

        public int VendorId { get; set; }

        public int ContainerTypeId { get; set; }

        [Required]
        [StringLength(20)]
        public string Code { get; set; }

        [Required]
        [StringLength(50)]
        public string Status { get; set; }

        [Required]
        [StringLength(200)]
        public string Description { get; set; }

        public int FreightStateId { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime UsedDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime ExpiredDate { get; set; }

        public TimeSpan MaintenancePeriod { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime NextMaintenanceDate { get; set; }

        public bool IsMaintaining { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual FreightState FreightState { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }

        public virtual Vendor Vendor { get; set; }

        public virtual ICollection<ContainerMonitorConfig> ContainerMonitorConfig { get; set; }

        public virtual ICollection<Coordination> Coordination { get; set; }

        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }
    }
}
