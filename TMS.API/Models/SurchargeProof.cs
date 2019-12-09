using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class SurchargeProof
    {
        public int Id { get; set; }
        public int SurchargeId { get; set; }
        public string Image { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual Surcharge Surcharge { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
