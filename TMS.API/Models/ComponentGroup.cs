using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class ComponentGroup
    {
        public ComponentGroup()
        {
            InverseParent = new HashSet<ComponentGroup>();
            UserInterface = new HashSet<UserInterface>();
        }

        public int Id { get; set; }
        public int FeatureId { get; set; }
        public string Name { get; set; }
        public string ClassName { get; set; }
        public bool IsTab { get; set; }
        public string TabGroup { get; set; }
        public string Width { get; set; }
        public string Style { get; set; }
        public int Column { get; set; }
        public int Row { get; set; }
        public int? PolicyId { get; set; }
        public int? StateId { get; set; }
        public bool Hidden { get; set; }
        public int? ParentId { get; set; }
        public int? Order { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Feature Feature { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual ComponentGroup Parent { get; set; }
        public virtual Policy Policy { get; set; }
        public virtual FreightState State { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<ComponentGroup> InverseParent { get; set; }
        public virtual ICollection<UserInterface> UserInterface { get; set; }
    }
}
