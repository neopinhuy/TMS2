namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("WeightRange")]
    public partial class WeightRange
    {

        public WeightRange()
        {
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }

        public double WeightStart { get; set; }

        public double? WeightEnd { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }


        public virtual ICollection<Quotation> Quotation { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }
    }
}
