using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace TMS.UI.ViewModels
{
    public class LedgerVM
    {
        public int? AccountTypeId { get; set; }
        public int? TargetTypeId { get; set; }
        public string FullName { get; set; }
        public DateTime FromDate { get; set; } = DateTime.Now;
        public DateTime ToDate { get; set; } = DateTime.Now;
    }
}
