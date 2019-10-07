namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Objective")]
    public partial class Objective
    {

        public Objective()
        {
            FreightBalance = new HashSet<FreightBalance>();
            UserBalance = new HashSet<UserBalance>();
        }

        public int Id { get; set; }

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

        public virtual ICollection<FreightBalance> FreightBalance { get; set; }

        public virtual ICollection<UserBalance> UserBalance { get; set; }
    }
}
