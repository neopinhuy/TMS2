using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class CustomerCareLog
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public int? ContactTypeId { get; set; }
        public string ContactNumber { get; set; }
        public bool IsResponsed { get; set; }
        public string Message { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public string ContactDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual MasterData ContactType { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
