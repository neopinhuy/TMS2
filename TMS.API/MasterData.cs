using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class MasterData
    {
        public MasterData()
        {
            Customer = new HashSet<Customer>();
            CustomerCareLog = new HashSet<CustomerCareLog>();
            InverseParent = new HashSet<MasterData>();
            TruckFuelType = new HashSet<Truck>();
            TruckTruckType = new HashSet<Truck>();
            Vendor = new HashSet<Vendor>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int? ParentId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual MasterData Parent { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Customer> Customer { get; set; }
        public virtual ICollection<CustomerCareLog> CustomerCareLog { get; set; }
        public virtual ICollection<MasterData> InverseParent { get; set; }
        public virtual ICollection<Truck> TruckFuelType { get; set; }
        public virtual ICollection<Truck> TruckTruckType { get; set; }
        public virtual ICollection<Vendor> Vendor { get; set; }
    }
}
