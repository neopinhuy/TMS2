﻿using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class TruckMonitorConfig
    {
        public int Id { get; set; }
        public int TruckId { get; set; }
        public int? AccessaryId { get; set; }
        public int? UserId { get; set; }
        public int? RoleId { get; set; }
        public int? GroupRoleId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Accessory Accessary { get; set; }
        public virtual GroupRole GroupRole { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Role Role { get; set; }
        public virtual Truck Truck { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual User User { get; set; }
    }
}
