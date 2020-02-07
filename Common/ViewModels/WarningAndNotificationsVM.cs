
using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace Common.ViewModels
{
    public class WarningAndNotificationsVM
    {
        public List<TruckMaintenanceWarning> LWarningsTruck { get; set; }
        public List<LiabilitiesWarning> LWarningsLiabilities { get; set; }
        public List<CustomerCareWarning> LWarningsCustomerCare { get; set; }

        public int CountLWarningsTruck { get; set; }
        public int CountLWarningsLiabilities { get; set; }
        public int CountLWarningsCustomerCare { get; set; }
    }
}
