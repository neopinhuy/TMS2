using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class UserInterface
    {
        public int Id { get; set; }
        public int FeatureId { get; set; }
        public int? FieldId { get; set; }
        public int? PolicyId { get; set; }
        public int? StateId { get; set; }
        public bool Disabled { get; set; }
        public bool Visibility { get; set; }
        public int ComponentTypeId { get; set; }
        public int? ComponentGroupId { get; set; }
        public int? Column { get; set; }
        public int? Row { get; set; }
        public int? Order { get; set; }
        public string Renderer { get; set; }
        public string Events { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ComponentGroup ComponentGroup { get; set; }
        public virtual ComponentType ComponentType { get; set; }
        public virtual Feature Feature { get; set; }
        public virtual Field Field { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Policy Policy { get; set; }
        public virtual FreightState State { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
