namespace TMS.API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Timebox")]
    public partial class Timebox
    {

        public Timebox()
        {
            OrderDetail = new HashSet<OrderDetail>();
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }

        public TimeSpan TimeboxStart { get; set; }

        public TimeSpan TimeboxEnd { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual ICollection<OrderDetail> OrderDetail { get; set; }

        public virtual ICollection<Quotation> Quotation { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }
    }
}
