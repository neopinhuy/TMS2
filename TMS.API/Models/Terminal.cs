using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Terminal
    {
        public Terminal()
        {
            CoordinationEmptyContFrom = new HashSet<Coordination>();
            CoordinationEmptyContTo = new HashSet<Coordination>();
            CoordinationFrom = new HashSet<Coordination>();
            CoordinationTo = new HashSet<Coordination>();
            OrderDetailEmptyContFrom = new HashSet<OrderDetail>();
            OrderDetailEmptyContTo = new HashSet<OrderDetail>();
            OrderDetailFrom = new HashSet<OrderDetail>();
            OrderDetailTo = new HashSet<OrderDetail>();
            QuotationEmptyContFrom = new HashSet<Quotation>();
            QuotationEmptyContTo = new HashSet<Quotation>();
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
        public virtual ICollection<Coordination> CoordinationEmptyContFrom { get; set; }
        public virtual ICollection<Coordination> CoordinationEmptyContTo { get; set; }
        public virtual ICollection<Coordination> CoordinationFrom { get; set; }
        public virtual ICollection<Coordination> CoordinationTo { get; set; }
        public virtual ICollection<OrderDetail> OrderDetailEmptyContFrom { get; set; }
        public virtual ICollection<OrderDetail> OrderDetailEmptyContTo { get; set; }
        public virtual ICollection<OrderDetail> OrderDetailFrom { get; set; }
        public virtual ICollection<OrderDetail> OrderDetailTo { get; set; }
        public virtual ICollection<Quotation> QuotationEmptyContFrom { get; set; }
        public virtual ICollection<Quotation> QuotationEmptyContTo { get; set; }
        public virtual ICollection<Quotation> QuotationFrom { get; set; }
        public virtual ICollection<Quotation> QuotationTo { get; set; }
    }
}
