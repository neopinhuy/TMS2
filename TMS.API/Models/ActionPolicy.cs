using Newtonsoft.Json;
using System;

namespace TMS.API.Models
{
    public partial class ActionPolicy
    {
        public int Id { get; set; }
        public int ActionId { get; set; }
        public int PolicyId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual Action Action { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Policy Policy { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
    }
}
