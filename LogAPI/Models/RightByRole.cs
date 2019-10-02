namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("RightByRole")]
    public partial class RightByRole
    {
        public int Id { get; set; }

        public int RoleId { get; set; }

        public int FeatureId { get; set; }

        public bool CanRead { get; set; }

        public bool CanWrite { get; set; }

        public bool CanDelete { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual Feature Feature { get; set; }

        public virtual Role Role { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }
    }
}
