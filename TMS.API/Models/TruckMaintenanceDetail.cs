using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class TruckMaintenanceDetail
    {
        public int Id { get; set; }
        public int? MaintenanceId { get; set; }
        public int? AccessaryId { get; set; }
        public string Detail { get; set; }
        public decimal? Price { get; set; }
        public int? CurrencyId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Accessory Accessary { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual TruckMaintenance Maintenance { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
