using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace Common.ViewModels
{
    class LiabilitiWarningVM
    {
        public int Id { get; set; }
        public DateTime? DueDate { get; set; }
        public string ReceiverFullName { get; set; }
        public string ReceiverBank { get; set; }
        public string AccountType { get; set; }
    }
}
