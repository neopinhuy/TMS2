using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Nationality
    {
        public Nationality()
        {
            Terminal = new HashSet<Terminal>();
            User = new HashSet<User>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User IdNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Terminal> Terminal { get; set; }
        public virtual ICollection<User> User { get; set; }
    }
}
