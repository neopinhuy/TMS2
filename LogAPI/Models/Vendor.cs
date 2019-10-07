namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Vendor")]
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

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        public int VendorTypeId { get; set; }

        [Required]
        public string Description { get; set; }

        [Required]
        [StringLength(50)]
        public string PhoneNumber { get; set; }

        [StringLength(50)]
        public string PhoneNumber2 { get; set; }

        [Required]
        [StringLength(200)]
        public string Address { get; set; }

        [StringLength(200)]
        public string Address2 { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual ICollection<Accessory> Accessory { get; set; }

        public virtual ICollection<Container> Container { get; set; }

        public virtual ICollection<OrderDetail> OrderDetail { get; set; }

        public virtual ICollection<Quotation> Quotation { get; set; }

        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }

        public virtual VendorType VendorType { get; set; }
    }
}
