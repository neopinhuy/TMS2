namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("FreightHistory")]
    public partial class FreightHistory
    {

        public FreightHistory()
        {
            FreightProof = new HashSet<FreightProof>();
        }

        public int Id { get; set; }

        public int CoordinatorId { get; set; }

        public int FreightStateId { get; set; }

        public double Long { get; set; }

        public double Lat { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual Coordination Coordination { get; set; }

        public virtual FreightState FreightState { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }

        public virtual ICollection<FreightProof> FreightProof { get; set; }
    }
}
