﻿using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class MasterData
    {
        public MasterData()
        {
            AccessoryBranch = new HashSet<Accessory>();
            AccessoryCurrency = new HashSet<Accessory>();
            ContainerContainerType = new HashSet<Container>();
            ContainerCurrency = new HashSet<Container>();
            ContainerFreightState = new HashSet<Container>();
            CustomerCareLogCommodityType = new HashSet<CustomerCareLog>();
            CustomerCareLogContactType = new HashSet<CustomerCareLog>();
            CustomerCareLogOrderPeriod = new HashSet<CustomerCareLog>();
            CustomerCareLogStatus = new HashSet<CustomerCareLog>();
            CustomerCustomerGroup = new HashSet<Customer>();
            CustomerCustomerState = new HashSet<Customer>();
            InverseParent = new HashSet<MasterData>();
            LedgerAccountType = new HashSet<Ledger>();
            LedgerCurrency = new HashSet<Ledger>();
            OrderAccountableDepartment = new HashSet<Order>();
            OrderCurrency = new HashSet<Order>();
            OrderDetailCommodityType = new HashSet<OrderDetail>();
            OrderDetailContainerType = new HashSet<OrderDetail>();
            OrderDetailTruckType = new HashSet<OrderDetail>();
            QuotationCommodityType = new HashSet<Quotation>();
            QuotationContainerType = new HashSet<Quotation>();
            QuotationCurrency = new HashSet<Quotation>();
            QuotationCustomerGroup = new HashSet<Quotation>();
            QuotationPriceType = new HashSet<Quotation>();
            QuotationTruckType = new HashSet<Quotation>();
            Terminal = new HashSet<Terminal>();
            TruckBranch = new HashSet<Truck>();
            TruckCurrency = new HashSet<Truck>();
            TruckDepartment = new HashSet<Truck>();
            TruckFuelType = new HashSet<Truck>();
            TruckMaintenance = new HashSet<TruckMaintenance>();
            TruckTruckType = new HashSet<Truck>();
            User = new HashSet<User>();
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
        public int? Order { get; set; }
        public int? Enum { get; set; }

        public virtual User InsertedByNavigation { get; set; }
        public virtual MasterData Parent { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual ICollection<Accessory> AccessoryBranch { get; set; }
        public virtual ICollection<Accessory> AccessoryCurrency { get; set; }
        public virtual ICollection<Container> ContainerContainerType { get; set; }
        public virtual ICollection<Container> ContainerCurrency { get; set; }
        public virtual ICollection<Container> ContainerFreightState { get; set; }
        public virtual ICollection<CustomerCareLog> CustomerCareLogCommodityType { get; set; }
        public virtual ICollection<CustomerCareLog> CustomerCareLogContactType { get; set; }
        public virtual ICollection<CustomerCareLog> CustomerCareLogOrderPeriod { get; set; }
        public virtual ICollection<CustomerCareLog> CustomerCareLogStatus { get; set; }
        public virtual ICollection<Customer> CustomerCustomerGroup { get; set; }
        public virtual ICollection<Customer> CustomerCustomerState { get; set; }
        public virtual ICollection<MasterData> InverseParent { get; set; }
        public virtual ICollection<Ledger> LedgerAccountType { get; set; }
        public virtual ICollection<Ledger> LedgerCurrency { get; set; }
        public virtual ICollection<Order> OrderAccountableDepartment { get; set; }
        public virtual ICollection<Order> OrderCurrency { get; set; }
        public virtual ICollection<OrderDetail> OrderDetailCommodityType { get; set; }
        public virtual ICollection<OrderDetail> OrderDetailContainerType { get; set; }
        public virtual ICollection<OrderDetail> OrderDetailTruckType { get; set; }
        public virtual ICollection<Quotation> QuotationCommodityType { get; set; }
        public virtual ICollection<Quotation> QuotationContainerType { get; set; }
        public virtual ICollection<Quotation> QuotationCurrency { get; set; }
        public virtual ICollection<Quotation> QuotationCustomerGroup { get; set; }
        public virtual ICollection<Quotation> QuotationPriceType { get; set; }
        public virtual ICollection<Quotation> QuotationTruckType { get; set; }
        public virtual ICollection<Terminal> Terminal { get; set; }
        public virtual ICollection<Truck> TruckBranch { get; set; }
        public virtual ICollection<Truck> TruckCurrency { get; set; }
        public virtual ICollection<Truck> TruckDepartment { get; set; }
        public virtual ICollection<Truck> TruckFuelType { get; set; }
        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }
        public virtual ICollection<Truck> TruckTruckType { get; set; }
        public virtual ICollection<User> User { get; set; }
        public virtual ICollection<Vendor> Vendor { get; set; }
    }
}
