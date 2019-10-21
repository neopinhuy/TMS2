using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Surcharge
    {
        public int Id { get; set; }
        public int OrderDetailId { get; set; }
        public decimal Price { get; set; }
        public string Currency { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User IdNavigation { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual OrderDetail OrderDetail { get; set; }
    }
}
