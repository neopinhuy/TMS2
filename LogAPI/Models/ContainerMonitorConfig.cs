namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("ContainerMonitorConfig")]
    public partial class ContainerMonitorConfig
    {
        public int Id { get; set; }

        public int ContainerId { get; set; }

        public int? AssigneeId { get; set; }

        public int? RoleId { get; set; }

        public int? GroupRoleId { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual Container Container { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual GroupRole GroupRole { get; set; }

        public virtual Role Role { get; set; }

        public virtual User UserUpdated { get; set; }

        public virtual User User { get; set; }
    }
}
