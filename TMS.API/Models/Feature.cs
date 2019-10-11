namespace TMS.API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Feature")]
    public partial class Feature
    {

        public Feature()
        {
            RightByGroup = new HashSet<RightByGroup>();
            RightByRole = new HashSet<RightByRole>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string FeatureName { get; set; }

        [StringLength(500)]
        public string Description { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual ICollection<RightByGroup> RightByGroup { get; set; }

        public virtual ICollection<RightByRole> RightByRole { get; set; }
    }
}
