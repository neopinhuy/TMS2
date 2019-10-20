using Newtonsoft.Json;
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

        [JsonIgnore]
        public virtual User IdNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Nationality Nationality { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Order OrderIdNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Coordination> CoordinationFrom { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Coordination> CoordinationTo { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Order> OrderFrom { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Quotation> QuotationFrom { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Quotation> QuotationTo { get; set; }
    }
}
