namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("CommodityType")]
    public partial class CommodityType
    {

        public CommodityType()
        {
            OrderDetail = new HashSet<OrderDetail>();
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string TypeName { get; set; }

        [Required]
        [StringLength(200)]
        public string Description { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual User User { get; set; }

        public virtual User User1 { get; set; }


        public virtual ICollection<OrderDetail> OrderDetail { get; set; }


        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
