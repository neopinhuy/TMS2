namespace LogAPI.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;


    [Table("User")]
    public partial class User
    {

        public User()
        {
            InsertedAccessory = new HashSet<Accessory>();
            UpdatedAccessory = new HashSet<Accessory>();
            InsertedCommodityType = new HashSet<CommodityType>();
            UpdatedCommodityType = new HashSet<CommodityType>();
            InsertedContainer = new HashSet<Container>();
            UpdatedContainer = new HashSet<Container>();
            InsertedContainerMonitorConfig = new HashSet<ContainerMonitorConfig>();
            UpdatedContainerMonitorConfig = new HashSet<ContainerMonitorConfig>();
            AssignedContainerMonitorConfig = new HashSet<ContainerMonitorConfig>();
            InsertedContainerType = new HashSet<ContainerType>();
            UpdatedContainerType = new HashSet<ContainerType>();
            Contract = new HashSet<Contract>();
            InsertedContract = new HashSet<Contract>();
            UpdatedContract = new HashSet<Contract>();
            Coordination = new HashSet<Coordination>();
            InsertedCoordination = new HashSet<Coordination>();
            UpdatedCoordination = new HashSet<Coordination>();
            InsertedCustomer = new HashSet<Customer>();
            UpdatedCustomer = new HashSet<Customer>();
            Department = new HashSet<Department>();
            InsertedDepartment = new HashSet<Department>();
            UpdatedDepartment = new HashSet<Department>();
            InsertedFeature = new HashSet<Feature>();
            FreightBalance = new HashSet<FreightBalance>();
            FreightBalance1 = new HashSet<FreightBalance>();
            FreightHistory = new HashSet<FreightHistory>();
            FreightHistory1 = new HashSet<FreightHistory>();
            FreightProof = new HashSet<FreightProof>();
            FreightProof1 = new HashSet<FreightProof>();
            FreightState = new HashSet<FreightState>();
            FreightState1 = new HashSet<FreightState>();
            GroupRole = new HashSet<GroupRole>();
            GroupRole1 = new HashSet<GroupRole>();
            MaintenanceTicket = new HashSet<MaintenanceTicket>();
            MaintenanceTicket1 = new HashSet<MaintenanceTicket>();
            MaintenanceTicket2 = new HashSet<MaintenanceTicket>();
            NationalityInsertedBy = new HashSet<Nationality>();
            Order = new HashSet<Order>();
            Order1 = new HashSet<Order>();
            OrderDetail = new HashSet<OrderDetail>();
            OrderDetail1 = new HashSet<OrderDetail>();
            PaymentApprovalConfig = new HashSet<PaymentApprovalConfig>();
            PaymentApprovalConfig1 = new HashSet<PaymentApprovalConfig>();
            PaymentApprovalConfig2 = new HashSet<PaymentApprovalConfig>();
            QuotationInsertdBy = new HashSet<Quotation>();
            QuotationUpdatedBy = new HashSet<Quotation>();
            RightByGroupInsertedBy = new HashSet<RightByGroup>();
            RightByGroupUpdated = new HashSet<RightByGroup>();
            RightByRoleInsertedBy = new HashSet<RightByRole>();
            RightByRoleUpdatedBy = new HashSet<RightByRole>();
            RightByUserUpdatedBy = new HashSet<RightByUser>();
            UserRight = new HashSet<RightByUser>();
            RightByUserInserted = new HashSet<RightByUser>();
            SurchargeInsertedBy = new HashSet<Surcharge>();
            TerminalUpdated = new HashSet<Terminal>();
            TicketStateInsertedBy = new HashSet<TicketState>();
            TicketStateUpdatedBy = new HashSet<TicketState>();
            TimeboxInsertedBy = new HashSet<Timebox>();
            TimeboxUpdatedBy = new HashSet<Timebox>();
            TruckMaintenanceAccountable = new HashSet<TruckMaintenance>();
            TruckMaintenanceInsertedBy = new HashSet<TruckMaintenance>();
            TruckMaintenanceUpdatedBY = new HashSet<TruckMaintenance>();
            TruckMaintenanceDetailInsertedBy = new HashSet<TruckMaintenanceDetail>();
            TruckMaintenanceDetailUpdatedBy = new HashSet<TruckMaintenanceDetail>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
            TruckMonitorConfigInsertedBy = new HashSet<TruckMonitorConfig>();
            TruckMonitorConfigUpdatedBy = new HashSet<TruckMonitorConfig>();
            UserInsertedBy = new HashSet<User>();
            UserUpdatedBy = new HashSet<User>();
            UserBalance = new HashSet<UserBalance>();
            UserBalanceInsertedBy = new HashSet<UserBalance>();
            UserBalanceUpdatedBy = new HashSet<UserBalance>();
            VendorTypeInsertedBy = new HashSet<VendorType>();
            VendorTypeUpdatedBy = new HashSet<VendorType>();
            VolumeRangeInsertedBy = new HashSet<VolumeRange>();
            VolumeRangeUpdatedBy = new HashSet<VolumeRange>();
            WeightRangeInsertedBy = new HashSet<WeightRange>();
            WeightRangeUpdatedBy = new HashSet<WeightRange>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(100)]
        public string LastName { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime DoB { get; set; }

        [Required]
        [StringLength(50)]
        public string SSN { get; set; }

        [StringLength(50)]
        public string Passport { get; set; }

        [Required]
        [StringLength(200)]
        public string Address { get; set; }

        [StringLength(200)]
        public string Address2 { get; set; }

        [Required]
        [StringLength(50)]
        public string PhoneNumber { get; set; }

        [StringLength(50)]
        public string PhoneNumber2 { get; set; }

        public int NationalityId { get; set; }

        public int DepartmentId { get; set; }

        public int RoleId { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int? InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }


        public virtual ICollection<Accessory> InsertedAccessory { get; set; }


        public virtual ICollection<Accessory> UpdatedAccessory { get; set; }


        public virtual ICollection<CommodityType> InsertedCommodityType { get; set; }


        public virtual ICollection<CommodityType> UpdatedCommodityType { get; set; }


        public virtual ICollection<Container> InsertedContainer { get; set; }


        public virtual ICollection<Container> UpdatedContainer { get; set; }


        public virtual ICollection<ContainerMonitorConfig> InsertedContainerMonitorConfig { get; set; }


        public virtual ICollection<ContainerMonitorConfig> UpdatedContainerMonitorConfig { get; set; }


        public virtual ICollection<ContainerMonitorConfig> AssignedContainerMonitorConfig { get; set; }


        public virtual ICollection<ContainerType> InsertedContainerType { get; set; }


        public virtual ICollection<ContainerType> UpdatedContainerType { get; set; }


        public virtual ICollection<Contract> Contract { get; set; }


        public virtual ICollection<Contract> InsertedContract { get; set; }


        public virtual ICollection<Contract> UpdatedContract { get; set; }

        public virtual ICollection<Coordination> Coordination { get; set; }


        public virtual ICollection<Coordination> InsertedCoordination { get; set; }


        public virtual ICollection<Coordination> UpdatedCoordination { get; set; }


        public virtual ICollection<Customer> InsertedCustomer { get; set; }


        public virtual ICollection<Customer> UpdatedCustomer { get; set; }


        public virtual ICollection<Department> Department { get; set; }


        public virtual ICollection<Department> InsertedDepartment { get; set; }


        public virtual ICollection<Department> UpdatedDepartment { get; set; }

        public virtual Department Department3 { get; set; }


        public virtual ICollection<Feature> InsertedFeature { get; set; }


        public virtual ICollection<FreightBalance> FreightBalance { get; set; }


        public virtual ICollection<FreightBalance> FreightBalance1 { get; set; }


        public virtual ICollection<FreightHistory> FreightHistory { get; set; }


        public virtual ICollection<FreightHistory> FreightHistory1 { get; set; }


        public virtual ICollection<FreightProof> FreightProof { get; set; }


        public virtual ICollection<FreightProof> FreightProof1 { get; set; }


        public virtual ICollection<FreightState> FreightState { get; set; }


        public virtual ICollection<FreightState> FreightState1 { get; set; }


        public virtual ICollection<GroupRole> GroupRole { get; set; }


        public virtual ICollection<GroupRole> GroupRole1 { get; set; }


        public virtual ICollection<MaintenanceTicket> MaintenanceTicket { get; set; }


        public virtual ICollection<MaintenanceTicket> MaintenanceTicket1 { get; set; }


        public virtual ICollection<MaintenanceTicket> MaintenanceTicket2 { get; set; }

        public virtual ICollection<Nationality> NationalityInsertedBy { get; set; }

        public virtual ICollection<Nationality> NationalityUpdatedBy { get; set; }


        public virtual ICollection<Order> Order { get; set; }


        public virtual ICollection<Order> Order1 { get; set; }


        public virtual ICollection<OrderDetail> OrderDetail { get; set; }


        public virtual ICollection<OrderDetail> OrderDetail1 { get; set; }


        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfig { get; set; }


        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfig1 { get; set; }


        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfig2 { get; set; }


        public virtual ICollection<Quotation> QuotationInsertdBy { get; set; }


        public virtual ICollection<Quotation> QuotationUpdatedBy { get; set; }


        public virtual ICollection<RightByGroup> RightByGroupInsertedBy { get; set; }


        public virtual ICollection<RightByGroup> RightByGroupUpdated { get; set; }


        public virtual ICollection<RightByRole> RightByRoleInsertedBy { get; set; }


        public virtual ICollection<RightByRole> RightByRoleUpdatedBy { get; set; }


        public virtual ICollection<RightByUser> RightByUserUpdatedBy { get; set; }


        public virtual ICollection<RightByUser> UserRight { get; set; }


        public virtual ICollection<RightByUser> RightByUserInserted { get; set; }

        public virtual Role Role { get; set; }

        public virtual ICollection<Surcharge> SurchargeInsertedBy { get; set; }

        public virtual ICollection<Surcharge> SurchargeUpdated { get; set; }

        public virtual ICollection<Terminal> TerminalInserted { get; set; }

        public virtual ICollection<Terminal> TerminalUpdated { get; set; }


        public virtual ICollection<TicketState> TicketStateInsertedBy { get; set; }


        public virtual ICollection<TicketState> TicketStateUpdatedBy { get; set; }


        public virtual ICollection<Timebox> TimeboxInsertedBy { get; set; }


        public virtual ICollection<Timebox> TimeboxUpdatedBy { get; set; }


        public virtual ICollection<TruckMaintenance> TruckMaintenanceAccountable { get; set; }


        public virtual ICollection<TruckMaintenance> TruckMaintenanceInsertedBy { get; set; }


        public virtual ICollection<TruckMaintenance> TruckMaintenanceUpdatedBY { get; set; }


        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetailInsertedBy { get; set; }


        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetailUpdatedBy { get; set; }


        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }


        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfigInsertedBy { get; set; }


        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfigUpdatedBy { get; set; }


        public virtual ICollection<User> UserInsertedBy { get; set; }

        public virtual User UserInserted { get; set; }


        public virtual ICollection<User> UserUpdatedBy { get; set; }

        public virtual User UserUpdated { get; set; }


        public virtual ICollection<UserBalance> UserBalance { get; set; }


        public virtual ICollection<UserBalance> UserBalanceInsertedBy { get; set; }


        public virtual ICollection<UserBalance> UserBalanceUpdatedBy { get; set; }


        public virtual ICollection<VendorType> VendorTypeInsertedBy { get; set; }


        public virtual ICollection<VendorType> VendorTypeUpdatedBy { get; set; }


        public virtual ICollection<VolumeRange> VolumeRangeInsertedBy { get; set; }


        public virtual ICollection<VolumeRange> VolumeRangeUpdatedBy { get; set; }


        public virtual ICollection<WeightRange> WeightRangeInsertedBy { get; set; }


        public virtual ICollection<WeightRange> WeightRangeUpdatedBy { get; set; }
    }
}
