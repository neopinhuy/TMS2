using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
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
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Coordination Coordinator { get; set; }
        public virtual FreightState FreightState { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<FreightProof> FreightProof { get; set; }
    }
}
