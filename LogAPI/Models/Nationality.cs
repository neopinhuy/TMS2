namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("Nationality")]
    public partial class Nationality
    {

        public Nationality()
        {
            Customer = new HashSet<Customer>();
            Terminal = new HashSet<Terminal>();
            User2 = new HashSet<User>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }


        public virtual ICollection<Customer> Customer { get; set; }

        public virtual User User { get; set; }

        public virtual User User1 { get; set; }


        public virtual ICollection<Terminal> Terminal { get; set; }


        public virtual ICollection<User> User2 { get; set; }
    }
}
