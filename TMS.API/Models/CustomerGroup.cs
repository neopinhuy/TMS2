namespace TMS.API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("CustomerGroup")]
    public partial class CustomerGroup
    {

        public CustomerGroup()
        {
            Customer = new HashSet<Customer>();
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string GroupName { get; set; }

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

        public virtual ICollection<Customer> Customer { get; set; }

        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
