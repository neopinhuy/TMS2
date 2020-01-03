using System;
using System.Collections.Generic;

namespace TMS.API
{
    public partial class Contract
    {
        public Contract()
        {
            UserNavigation = new HashSet<User>();
        }

        public int Id { get; set; }
        public int UserId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public double Salary { get; set; }
        public string Currency { get; set; }
        public double Allowance { get; set; }
        public string Details { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<User> UserNavigation { get; set; }
    }
}
