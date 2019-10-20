using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Nationality
    {
        public Nationality()
        {
            Customer = new HashSet<Customer>();
            Terminal = new HashSet<Terminal>();
            User = new HashSet<User>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User IdNavigation { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Customer> Customer { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Terminal> Terminal { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<User> User { get; set; }
    }
}
