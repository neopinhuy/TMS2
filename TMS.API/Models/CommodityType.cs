﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class CommodityType
    {
        public CommodityType()
        {
            OrderDetail = new HashSet<OrderDetail>();
            Quotation = new HashSet<Quotation>();
        }

        public int Id { get; set; }
        public string TypeName { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Quotation> Quotation { get; set; }
    }
}
