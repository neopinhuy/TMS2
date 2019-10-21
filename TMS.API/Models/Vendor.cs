using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Vendor
    {
        public Vendor()
        {
            Accessory = new HashSet<Accessory>();
            Container = new HashSet<Container>();
            OrderDetail = new HashSet<OrderDetail>();
            Quotation = new HashSet<Quotation>();
            TruckMaintenance = new HashSet<TruckMaintenance>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int VendorTypeId { get; set; }
        public string Description { get; set; }
        public string PhoneNumber { get; set; }
        public string PhoneNumber2 { get; set; }
        public string Address { get; set; }
        public string Address2 { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual VendorType VendorType { get; set; }
        public virtual ICollection<Accessory> Accessory { get; set; }
        public virtual ICollection<Container> Container { get; set; }
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
        public virtual ICollection<Quotation> Quotation { get; set; }
        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }
    }
}
