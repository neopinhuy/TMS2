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
            Coordination = new HashSet<Coordination>();
            Coordination1 = new HashSet<Coordination>();
            Order = new HashSet<Order>();
            Quotation = new HashSet<Quotation>();
            Quotation1 = new HashSet<Quotation>();
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


        public virtual ICollection<Coordination> Coordination { get; set; }


        public virtual ICollection<Coordination> Coordination1 { get; set; }

        public virtual Nationality Nationality { get; set; }


        public virtual ICollection<Order> Order { get; set; }

        public virtual Order Order1 { get; set; }


        public virtual ICollection<Quotation> Quotation { get; set; }


        public virtual ICollection<Quotation> Quotation1 { get; set; }

        public virtual User User { get; set; }

        public virtual User User1 { get; set; }
    }
}
