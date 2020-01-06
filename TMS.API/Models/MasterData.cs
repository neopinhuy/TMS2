using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class MasterData
    {
        public MasterData()
        {
            Accessory = new HashSet<Accessory>();
            Container = new HashSet<Container>();
            CustomerCareLogCommodityType = new HashSet<CustomerCareLog>();
            CustomerCareLogContactType = new HashSet<CustomerCareLog>();
            CustomerCareLogOrderPeriod = new HashSet<CustomerCareLog>();
            CustomerCareLogStatus = new HashSet<CustomerCareLog>();
            CustomerCustomerGroup = new HashSet<Customer>();
            CustomerCustomerState = new HashSet<Customer>();
            InverseParent = new HashSet<MasterData>();
            QuotationCommodityType = new HashSet<Quotation>();
            QuotationContainerType = new HashSet<Quotation>();
            QuotationCurrency = new HashSet<Quotation>();
            QuotationCustomerGroup = new HashSet<Quotation>();
            QuotationPriceType = new HashSet<Quotation>();
            QuotationTruckType = new HashSet<Quotation>();
            TruckBranch = new HashSet<Truck>();
            TruckCurrency = new HashSet<Truck>();
            TruckFuelType = new HashSet<Truck>();
            TruckMaintenance = new HashSet<TruckMaintenance>();
            TruckTruckType = new HashSet<Truck>();
            Vendor = new HashSet<Vendor>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int? ParentId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual MasterData Parent { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Accessory> Accessory { get; set; }
        public virtual ICollection<Container> Container { get; set; }
        public virtual ICollection<CustomerCareLog> CustomerCareLogCommodityType { get; set; }
        public virtual ICollection<CustomerCareLog> CustomerCareLogContactType { get; set; }
        public virtual ICollection<CustomerCareLog> CustomerCareLogOrderPeriod { get; set; }
        public virtual ICollection<CustomerCareLog> CustomerCareLogStatus { get; set; }
        public virtual ICollection<Customer> CustomerCustomerGroup { get; set; }
        public virtual ICollection<Customer> CustomerCustomerState { get; set; }
        public virtual ICollection<MasterData> InverseParent { get; set; }
        public virtual ICollection<Quotation> QuotationCommodityType { get; set; }
        public virtual ICollection<Quotation> QuotationContainerType { get; set; }
        public virtual ICollection<Quotation> QuotationCurrency { get; set; }
        public virtual ICollection<Quotation> QuotationCustomerGroup { get; set; }
        public virtual ICollection<Quotation> QuotationPriceType { get; set; }
        public virtual ICollection<Quotation> QuotationTruckType { get; set; }
        public virtual ICollection<Truck> TruckBranch { get; set; }
        public virtual ICollection<Truck> TruckCurrency { get; set; }
        public virtual ICollection<Truck> TruckFuelType { get; set; }
        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }
        public virtual ICollection<Truck> TruckTruckType { get; set; }
        public virtual ICollection<Vendor> Vendor { get; set; }
    }
}
