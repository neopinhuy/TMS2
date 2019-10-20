using Newtonsoft.Json;
using System;

namespace TMS.API.Models
{
    public partial class ContainerMonitorConfig
    {
        public int Id { get; set; }
        public int ContainerId { get; set; }
        public int? AssigneeId { get; set; }
        public int? RoleId { get; set; }
        public int? GroupRoleId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User Assignee { get; set; }
        
        [JsonIgnore]
        public virtual Container Container { get; set; }
        
        [JsonIgnore]
        public virtual GroupRole GroupRole { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Role Role { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
    }
}
