using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Entity
    {
        public Entity()
        {
            EntityPolicy = new HashSet<EntityPolicy>();
            Feature = new HashSet<Feature>();
            GridPolicyEntity = new HashSet<GridPolicy>();
            GridPolicyReference = new HashSet<GridPolicy>();
            Ledger = new HashSet<Ledger>();
            UserInterface = new HashSet<UserInterface>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<EntityPolicy> EntityPolicy { get; set; }
        public virtual ICollection<Feature> Feature { get; set; }
        public virtual ICollection<GridPolicy> GridPolicyEntity { get; set; }
        public virtual ICollection<GridPolicy> GridPolicyReference { get; set; }
        public virtual ICollection<Ledger> Ledger { get; set; }
        public virtual ICollection<UserInterface> UserInterface { get; set; }
    }
}
