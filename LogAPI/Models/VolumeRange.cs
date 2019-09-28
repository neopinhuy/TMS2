namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("VolumeRange")]
    public partial class VolumeRange
    {

        public VolumeRange()
        {
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }

        public double VolumeStart { get; set; }

        public double? VolumeEnd { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }


        public virtual ICollection<Quotation> Quotation { get; set; }

        public virtual User User { get; set; }

        public virtual User User1 { get; set; }
    }
}
