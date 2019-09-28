namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("Surcharge")]
    public partial class Surcharge
    {
        public int Id { get; set; }

        public int OrderDetailId { get; set; }

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

        public virtual OrderDetail OrderDetail { get; set; }

        public virtual User InsertedUser { get; set; }

        public virtual User UpdatedUser { get; set; }
    }
}
