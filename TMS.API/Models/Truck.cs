﻿using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class Truck
    {
        public Truck()
        {
            Accessory = new HashSet<Accessory>();
            CoordinationDetail = new HashSet<CoordinationDetail>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
            TruckMaintenance = new HashSet<TruckMaintenance>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
        }

        public int Id { get; set; }
        public string TruckPlate { get; set; }
        public int? BranchId { get; set; }
        public string Model { get; set; }
        public decimal? Year { get; set; }
        public string Color { get; set; }
        public string Vin { get; set; }
        public int? TruckTypeId { get; set; }
        public int? FuelTypeId { get; set; }
        public double? KmPerLit { get; set; }
        public double? MaxCapacity { get; set; }
        public string PlateRenewal { get; set; }
        public int? DepartmentId { get; set; }
        public string Note { get; set; }
        public string Image { get; set; }
        public bool InUse { get; set; }
        public double? MaxCbm { get; set; }
        public int? VendorId { get; set; }
        public double? Long { get; set; }
        public double? Lat { get; set; }
        public int? FreightStateId { get; set; }
        public int? DriverId { get; set; }
        public decimal? Price { get; set; }
        public int? CurrencyId { get; set; }
        public DateTime? BoughtDate { get; set; }
        public DateTime? ActiveDate { get; set; }
        public DateTime? ExpiredDate { get; set; }
        public DateTime? MaintenanceStart { get; set; }
        public DateTime? MaintenanceEnd { get; set; }
        public DateTime? NextMaintenanceDate { get; set; }
        public TimeSpan? MaintenancePeriod { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual MasterData Branch { get; set; }
        public virtual MasterData Currency { get; set; }
        public virtual MasterData Department { get; set; }
        public virtual User Driver { get; set; }
        public virtual MasterData FuelType { get; set; }
        public virtual MasterData TruckType { get; set; }
        public virtual Vendor Vendor { get; set; }
        public virtual TruckMaintenanceWarning TruckMaintenanceWarning { get; set; }
        public virtual ICollection<Accessory> Accessory { get; set; }
        public virtual ICollection<CoordinationDetail> CoordinationDetail { get; set; }
        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }
        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }
    }
}
