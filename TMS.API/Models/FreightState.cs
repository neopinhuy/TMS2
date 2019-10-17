using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class FreightState
    {
        public FreightState()
        {
            Container = new HashSet<Container>();
            Coordination = new HashSet<Coordination>();
            FreightHistory = new HashSet<FreightHistory>();
            Truck = new HashSet<Truck>();
            UserInterface = new HashSet<UserInterface>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Container> Container { get; set; }
        public virtual ICollection<Coordination> Coordination { get; set; }
        public virtual ICollection<FreightHistory> FreightHistory { get; set; }
        public virtual ICollection<Truck> Truck { get; set; }
        public virtual ICollection<UserInterface> UserInterface { get; set; }
    }
}
