using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace Common.ViewModels
{
    public class TruckWarningVM
    {
        public int Id { get; set; }
        public DateTime? NextMaintenanceDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string TruckPlate { get; set; }
        public string Color { get; set; }
    }
}
