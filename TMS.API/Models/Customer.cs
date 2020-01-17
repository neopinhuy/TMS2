using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Customer
    {
        public Customer()
        {
            CustomerCare = new HashSet<CustomerCare>();
            CustomerCareLog = new HashSet<CustomerCareLog>();
            Order = new HashSet<Order>();
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }
        public int? CustomerGroupId { get; set; }
        public int UserId { get; set; }
        public int? CustomerStateId { get; set; }
        public string Note { get; set; }
        public string Email { get; set; }
        public string Skype { get; set; }
        public string Zalo { get; set; }
        public string Viber { get; set; }
        public string OtherContact { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public string TaxCode { get; set; }
        public string CompanyLocalShortName { get; set; }
        public string CompanyInterShortName { get; set; }
        public string CompanyLocalFullName { get; set; }
        public string CompanyInterFullName { get; set; }
        public string CompanyLocalAddress { get; set; }
        public string CompanyInterAddress { get; set; }
        public DateTime? LastContactDate { get; set; }

        public virtual MasterData CustomerGroup { get; set; }
        public virtual MasterData CustomerState { get; set; }
        public virtual User User { get; set; }
        public virtual CustomerCareWarning CustomerCareWarning { get; set; }
        public virtual ICollection<CustomerCare> CustomerCare { get; set; }
        public virtual ICollection<CustomerCareLog> CustomerCareLog { get; set; }
        public virtual ICollection<Order> Order { get; set; }
        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
