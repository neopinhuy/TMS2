namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("FreightBalance")]
    public partial class FreightBalance
    {
        public int Id { get; set; }

        public int? CoordinationId { get; set; }

        public double Debit { get; set; }

        public double Credit { get; set; }

        [Required]
        [StringLength(50)]
        public string Curency { get; set; }

        public int ObjectiveId { get; set; }

        public int? RefferenceId { get; set; }

        [StringLength(30)]
        public string Entity { get; set; }

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

        public virtual User UserUpdated { get; set; }
    }
}
