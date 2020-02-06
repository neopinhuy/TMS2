
using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace Common.ViewModels
{
    class WarningAndNotificationsVM
    {
        public List<TruckWarningVM> LWarningsTruck { get; set; }
        public List<LiabilitiWarningVM> LWarningsLiabilities { get; set; }
        public List<CustomerCareWarningVM> LWarningsCustomerCare { get; set; }

        public int CountLWarningsTruck { get; set; }
        public int CountLWarningsLiabilities { get; set; }
        public int CountLWarningsCustomerCare { get; set; }
    }
}
