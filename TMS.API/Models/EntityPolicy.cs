using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class EntityPolicy
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int EntityId { get; set; }
        public int PolicyId { get; set; }
        public bool CanSee { get; set; }
        public bool CanAdd { get; set; }
        public bool CanEdit { get; set; }
        public bool CanDelete { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual Entity Entity { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Policy Policy { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
    }
}
