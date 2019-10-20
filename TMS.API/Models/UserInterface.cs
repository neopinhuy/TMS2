using Newtonsoft.Json;
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
        public bool CanEdit { get; set; }
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

        [JsonIgnore]
        public virtual ComponentDesc ComponentDesc { get; set; }
        
        [JsonIgnore]
        public virtual Feature Feature { get; set; }
        
        [JsonIgnore]
        public virtual Field Field { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual UserInterface Parent { get; set; }
        
        [JsonIgnore]
        public virtual Policy Policy { get; set; }
        
        [JsonIgnore]
        public virtual FreightState State { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<UserInterface> InverseParent { get; set; }
    }
}
