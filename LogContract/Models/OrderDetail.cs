namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("OrderDetail")]
    public partial class OrderDetail
    {

        public OrderDetail()
        {
            Coordination = new HashSet<Coordination>();
            Surcharge = new HashSet<Surcharge>();
        }

        public int Id { get; set; }

        public int OrderId { get; set; }

        public bool IsContainer { get; set; }

        public int? TotalContainer { get; set; }

        public int? ContainerTypeId { get; set; }

        public int? VendorId { get; set; }

        public int CommodityTypeId { get; set; }

        public double? Weight { get; set; }

        public double? Volume { get; set; }

        public int? TimeboxId { get; set; }

        public int? QuotationId { get; set; }

        public double Price { get; set; }

        [Required]
        [StringLength(50)]
        public string Currency { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual CommodityType CommodityType { get; set; }


        public virtual ICollection<Coordination> Coordination { get; set; }

        public virtual Order Order { get; set; }

        public virtual Timebox Timebox { get; set; }

        public virtual User User { get; set; }

        public virtual User User1 { get; set; }

        public virtual Vendor Vendor { get; set; }


        public virtual ICollection<Surcharge> Surcharge { get; set; }
    }
}
