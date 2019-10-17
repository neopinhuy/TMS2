using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class UserInterface
    {
        public UserInterface()
        {
            InverseParent = new HashSet<UserInterface>();
        }

        public int Id { get; set; }
        public int FeatureId { get; set; }
        public int? PolicyId { get; set; }
        public int? StateId { get; set; }
        public bool CanSee { get; set; }
        public bool CanAdd { get; set; }
        public bool CanEdit { get; set; }
        public bool CanDelete { get; set; }
        public bool Disabled { get; set; }
        public bool? Visibility { get; set; }
        public int ComponentId { get; set; }
        public int? FieldId { get; set; }
        public int? ParentId { get; set; }
        public string ParamName { get; set; }
        public string Renderer { get; set; }
        public string Events { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Feature Feature { get; set; }
        public virtual Field Field { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual UserInterface Parent { get; set; }
        public virtual Policy Policy { get; set; }
        public virtual FreightState State { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<UserInterface> InverseParent { get; set; }
    }
}
