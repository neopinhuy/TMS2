namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("FreightState")]
    public partial class FreightState
    {
        public FreightState()
        {
            Container = new HashSet<Container>();
            Coordination = new HashSet<Coordination>();
            FreightHistory = new HashSet<FreightHistory>();
            Truck = new HashSet<Truck>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Required]
        [StringLength(200)]
        public string Description { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public virtual ICollection<Container> Container { get; set; }

        public virtual ICollection<Coordination> Coordination { get; set; }

        public virtual ICollection<FreightHistory> FreightHistory { get; set; }

        public virtual User UserInserted { get; set; }

        public virtual User UserUpdated { get; set; }

        public virtual ICollection<Truck> Truck { get; set; }
    }
}
