using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Container
    {
        public Container()
        {
            Coordination = new HashSet<Coordination>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
        }

        public int Id { get; set; }
        public int VendorId { get; set; }
        public int ContainerTypeId { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public int? FreightStateId { get; set; }
        public DateTime? RentDate { get; set; }
        public DateTime? EndRentDate { get; set; }
        public decimal? AdvancedPaid { get; set; }
        public DateTime? NextPayment { get; set; }
        public bool ApplyPeriod { get; set; }
        public decimal? PeriodPayment { get; set; }
        public int? CurrencyId { get; set; }
        public bool? InUse { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual FreightState FreightState { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual Vendor Vendor { get; set; }
        public virtual ICollection<Coordination> Coordination { get; set; }
        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }
    }
}
