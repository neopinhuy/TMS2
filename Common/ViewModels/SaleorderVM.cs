using System;

namespace Common.ViewModels
{
    public class SaleorderVM
    {
        public string SearchTerm { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
    }
}
