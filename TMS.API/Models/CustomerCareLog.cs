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
        public decimal? Volume { get; set; }
        public decimal? Weight { get; set; }
        public decimal? Distance { get; set; }
        public int? StatusId { get; set; }
        public int? QuotationId { get; set; }
        public decimal? EstimatedCost { get; set; }
        public string Message { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public string ContactDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public int? CommodityTypeId { get; set; }
        public int? OrderPeriodId { get; set; }

        public virtual MasterData CommodityType { get; set; }
        public virtual MasterData ContactType { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual MasterData OrderPeriod { get; set; }
        public virtual Quotation Quotation { get; set; }
        public virtual MasterData Status { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
    }
}
