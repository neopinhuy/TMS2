namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("UserBalance")]
    public partial class UserBalance
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        public int UserId { get; set; }

        public double? Debit { get; set; }

        public double? Credit { get; set; }

        [Required]
        [StringLength(50)]
        public string Currency { get; set; }

        public int HasInvoice { get; set; }

        [StringLength(1000)]
        public string InvoiceImage { get; set; }

        public int PaymentObjectiveId { get; set; }

        public bool ShouldCountToSalary { get; set; }

        public int? CoordinatorId { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual Coordination Coordination { get; set; }

        public virtual Objective Objective { get; set; }

        public virtual User User { get; set; }

        public virtual User User1 { get; set; }

        public virtual User User2 { get; set; }
    }
}
