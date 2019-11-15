using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Terminal
    {
        public Terminal()
        {
            CoordinationFrom = new HashSet<Coordination>();
            CoordinationTo = new HashSet<Coordination>();
            OrderFrom = new HashSet<Order>();
            QuotationEmptyContFromNavigation = new HashSet<Quotation>();
            QuotationEmptyContToNavigation = new HashSet<Quotation>();
            QuotationFrom = new HashSet<Quotation>();
            QuotationTo = new HashSet<Quotation>();
        }

        public int Id { get; set; }
        public string FullName { get; set; }
        public string ShortName { get; set; }
        public string Address { get; set; }
        public int NationalityId { get; set; }
        public double Long { get; set; }
        public double Lat { get; set; }
        public string ContactNumber { get; set; }
        public string ContactFirstName { get; set; }
        public string ContactLastName { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User IdNavigation { get; set; }
        public virtual Nationality Nationality { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual Order OrderIdNavigation { get; set; }
        public virtual ICollection<Coordination> CoordinationFrom { get; set; }
        public virtual ICollection<Coordination> CoordinationTo { get; set; }
        public virtual ICollection<Order> OrderFrom { get; set; }
        public virtual ICollection<Quotation> QuotationEmptyContFromNavigation { get; set; }
        public virtual ICollection<Quotation> QuotationEmptyContToNavigation { get; set; }
        public virtual ICollection<Quotation> QuotationFrom { get; set; }
        public virtual ICollection<Quotation> QuotationTo { get; set; }
    }
}
