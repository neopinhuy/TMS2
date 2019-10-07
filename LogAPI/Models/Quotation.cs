namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Quotation")]
    public partial class Quotation
    {
        public int Id { get; set; }

        public int? CustomerId { get; set; }

        public int? CustomerGroupId { get; set; }

        public int FromId { get; set; }

        public int ToId { get; set; }

        public int? ContainerTypeId { get; set; }

        public bool IsContainer { get; set; }

        public int? TotalContainer { get; set; }

        public int? VendorId { get; set; }

        public int CommodityTypeId { get; set; }

        public int? WeightRangeId { get; set; }

        public int? VolumeRangeId { get; set; }

        public int? TimeboxId { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime EffectiveDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime ExpiredDate { get; set; }

        [Column(TypeName = "decimal(20, 5)")]
        public decimal Price { get; set; }

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

        public virtual ContainerType ContainerType { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual CustomerGroup CustomerGroup { get; set; }

        public virtual Terminal FromTerminal { get; set; }

        public virtual Terminal ToTerminal { get; set; }

        public virtual Timebox Timebox { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }

        public virtual Vendor Vendor { get; set; }

        public virtual VolumeRange VolumeRange { get; set; }

        public virtual WeightRange WeightRange { get; set; }
    }
}
