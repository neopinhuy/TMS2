using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Order = new HashSet<Order>();
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }
        public string PhoneNumber2 { get; set; }
        public string Address { get; set; }
        public string Address2 { get; set; }
        public int NationalityId { get; set; }
        public DateTime? DoB { get; set; }
        public string Ssn { get; set; }
        public string Passport { get; set; }
        public string Avatar { get; set; }
        public int? CustomerGroupId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual CustomerGroup CustomerGroup { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Nationality Nationality { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Order> Order { get; set; }
        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
