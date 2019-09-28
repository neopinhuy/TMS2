namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("Contract")]
    public partial class Contract
    {

        public Contract()
        {
        }

        public int Id { get; set; }

        public int UserId { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime StartDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime EndDate { get; set; }

        public double Salary { get; set; }

        [Required]
        [StringLength(50)]
        public string Currency { get; set; }

        public double Allowance { get; set; }

        public string Details { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual User User { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }
    }
}
