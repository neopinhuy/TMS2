namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Terminal")]
    public partial class Terminal
    {

        public Terminal()
        {
            CoordinationFromTerminal = new HashSet<Coordination>();
            CoordinationToTerminal = new HashSet<Coordination>();
            OrderFromTerminal = new HashSet<Order>();
            QuotationFromTerminal = new HashSet<Quotation>();
            QuotationToTerminal = new HashSet<Quotation>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(200)]
        public string FullName { get; set; }

        [Required]
        [StringLength(50)]
        public string ShortName { get; set; }

        [Required]
        [StringLength(200)]
        public string Address { get; set; }

        public int NationalityId { get; set; }

        public double Long { get; set; }

        public double Lat { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactNumber { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactFirstName { get; set; }

        [Required]
        [StringLength(100)]
        public string ContactLastName { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual ICollection<Coordination> CoordinationFromTerminal { get; set; }

        public virtual ICollection<Coordination> CoordinationToTerminal { get; set; }

        public virtual Nationality Nationality { get; set; }

        public virtual ICollection<Order> OrderFromTerminal { get; set; }

        public virtual ICollection<Order> OrderToTerminal { get; set; }

        public virtual ICollection<Quotation> QuotationFromTerminal { get; set; }

        public virtual ICollection<Quotation> QuotationToTerminal { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }
    }
}
