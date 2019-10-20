using Newtonsoft.Json;
using System;

namespace TMS.API.Models
{
    public partial class FreightBalance
    {
        public int Id { get; set; }
        public int? CoordinationId { get; set; }
        public double Debit { get; set; }
        public double Credit { get; set; }
        public string Curency { get; set; }
        public int ObjectiveId { get; set; }
        public int? RefferenceId { get; set; }
        public string Entity { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual Coordination Coordination { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Objective Objective { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
    }
}
