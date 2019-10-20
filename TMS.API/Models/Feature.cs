using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Feature
    {
        public Feature()
        {
            Children = new HashSet<Feature>();
            UserInterface = new HashSet<UserInterface>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }
        public int? ParentId { get; set; }
        public string Icon { get; set; }
        public bool? IsDevider { get; set; }
        public bool? IsGroup { get; set; }
        public string ViewClass { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Feature Parent { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Feature> Children { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<UserInterface> UserInterface { get; set; }
    }
}
