using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace Common.ViewModels
{
    public class CustomerCareWarningVM
    {
        public int Id { get; set; }
        public DateTime? LastContactDate { get; set; }
        public string GroupName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Avatar { get; set; }
    }
}
