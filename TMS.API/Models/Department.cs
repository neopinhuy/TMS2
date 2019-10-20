using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Department
    {
        public Department()
        {
            User = new HashSet<User>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int LeaderId { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual User Leader { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<User> User { get; set; }
    }
}
