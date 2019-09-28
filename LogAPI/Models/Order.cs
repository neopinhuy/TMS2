namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("Order")]
    public partial class Order
    {

        public Order()
        {
            OrderDetail = new HashSet<OrderDetail>();
        }

        public int Id { get; set; }

        public int CustomerId { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactFirstName { get; set; }

        [Required]
        [StringLength(100)]
        public string ContactLastName { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactNumber { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactSSN { get; set; }

        [StringLength(50)]
        public string ContactPassport { get; set; }

        [StringLength(200)]
        public string ContactAddress { get; set; }

        public int FromId { get; set; }

        public int ToId { get; set; }

        public int? TotalContainer { get; set; }

        public double TotalPrice { get; set; }

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

        public virtual Customer Customer { get; set; }

        public virtual Terminal FromTerminal { get; set; }

        public virtual Terminal ToTerminal { get; set; }

        public virtual User User { get; set; }

        public virtual User User1 { get; set; }


        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
    }
}
