﻿using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Currency
    {
        public Currency()
        {
            Ledger = new HashSet<Ledger>();
            Quotation = new HashSet<Quotation>();
            Truck = new HashSet<Truck>();
            TruckMaintenance = new HashSet<TruckMaintenance>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Symbol { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Ledger> Ledger { get; set; }
        public virtual ICollection<Quotation> Quotation { get; set; }
        public virtual ICollection<Truck> Truck { get; set; }
        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }
    }
}
