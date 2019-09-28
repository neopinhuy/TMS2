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
            Nationality1 = new HashSet<Nationality>();
            Order = new HashSet<Order>();
            Order1 = new HashSet<Order>();
            OrderDetail = new HashSet<OrderDetail>();
            OrderDetail1 = new HashSet<OrderDetail>();
            PaymentApprovalConfig = new HashSet<PaymentApprovalConfig>();
            PaymentApprovalConfig1 = new HashSet<PaymentApprovalConfig>();
            PaymentApprovalConfig2 = new HashSet<PaymentApprovalConfig>();
            Quotation = new HashSet<Quotation>();
            Quotation1 = new HashSet<Quotation>();
            RightByGroup = new HashSet<RightByGroup>();
            RightByGroup1 = new HashSet<RightByGroup>();
            RightByRole = new HashSet<RightByRole>();
            RightByRole1 = new HashSet<RightByRole>();
            RightByUser = new HashSet<RightByUser>();
            RightByUser1 = new HashSet<RightByUser>();
            RightByUser2 = new HashSet<RightByUser>();
            RightByUser3 = new HashSet<RightByUser>();
            SurchargeInserted = new HashSet<Surcharge>();
            TerminalUpdated = new HashSet<Terminal>();
            TicketState = new HashSet<TicketState>();
            TicketState1 = new HashSet<TicketState>();
            Timebox = new HashSet<Timebox>();
            Timebox1 = new HashSet<Timebox>();
            TruckMaintenance = new HashSet<TruckMaintenance>();
            TruckMaintenance1 = new HashSet<TruckMaintenance>();
            TruckMaintenance2 = new HashSet<TruckMaintenance>();
            TruckMaintenanceDetail = new HashSet<TruckMaintenanceDetail>();
            TruckMaintenanceDetail1 = new HashSet<TruckMaintenanceDetail>();
            TruckMonitorConfig = new HashSet<TruckMonitorConfig>();
            TruckMonitorConfig1 = new HashSet<TruckMonitorConfig>();
            TruckMonitorConfig2 = new HashSet<TruckMonitorConfig>();
            User1 = new HashSet<User>();
            User11 = new HashSet<User>();
            UserBalance = new HashSet<UserBalance>();
            UserBalance1 = new HashSet<UserBalance>();
            UserBalance2 = new HashSet<UserBalance>();
            VendorType = new HashSet<VendorType>();
            VendorType1 = new HashSet<VendorType>();
            VolumeRange = new HashSet<VolumeRange>();
            VolumeRange1 = new HashSet<VolumeRange>();
            WeightRange = new HashSet<WeightRange>();
            WeightRange1 = new HashSet<WeightRange>();
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

        public int ContractId { get; set; }

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

        public virtual Contract Contract3 { get; set; }


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

        public virtual ICollection<Nationality> Nationality1 { get; set; }

        public virtual ICollection<Nationality> Nationality2 { get; set; }


        public virtual ICollection<Order> Order { get; set; }


        public virtual ICollection<Order> Order1 { get; set; }


        public virtual ICollection<OrderDetail> OrderDetail { get; set; }


        public virtual ICollection<OrderDetail> OrderDetail1 { get; set; }


        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfig { get; set; }


        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfig1 { get; set; }


        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfig2 { get; set; }


        public virtual ICollection<Quotation> Quotation { get; set; }


        public virtual ICollection<Quotation> Quotation1 { get; set; }


        public virtual ICollection<RightByGroup> RightByGroup { get; set; }


        public virtual ICollection<RightByGroup> RightByGroup1 { get; set; }


        public virtual ICollection<RightByRole> RightByRole { get; set; }


        public virtual ICollection<RightByRole> RightByRole1 { get; set; }


        public virtual ICollection<RightByUser> RightByUser { get; set; }


        public virtual ICollection<RightByUser> RightByUser1 { get; set; }


        public virtual ICollection<RightByUser> RightByUser2 { get; set; }


        public virtual ICollection<RightByUser> RightByUser3 { get; set; }

        public virtual Role Role { get; set; }

        public virtual ICollection<Surcharge> SurchargeInserted { get; set; }

        public virtual ICollection<Surcharge> SurchargeUpdated { get; set; }

        public virtual ICollection<Terminal> TerminalInserted { get; set; }

        public virtual ICollection<Terminal> TerminalUpdated { get; set; }


        public virtual ICollection<TicketState> TicketState { get; set; }


        public virtual ICollection<TicketState> TicketState1 { get; set; }


        public virtual ICollection<Timebox> Timebox { get; set; }


        public virtual ICollection<Timebox> Timebox1 { get; set; }


        public virtual ICollection<TruckMaintenance> TruckMaintenance { get; set; }


        public virtual ICollection<TruckMaintenance> TruckMaintenance1 { get; set; }


        public virtual ICollection<TruckMaintenance> TruckMaintenance2 { get; set; }


        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetail { get; set; }


        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetail1 { get; set; }


        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }


        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig1 { get; set; }


        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig2 { get; set; }


        public virtual ICollection<User> User1 { get; set; }

        public virtual User User2 { get; set; }


        public virtual ICollection<User> User11 { get; set; }

        public virtual User User3 { get; set; }


        public virtual ICollection<UserBalance> UserBalance { get; set; }


        public virtual ICollection<UserBalance> UserBalance1 { get; set; }


        public virtual ICollection<UserBalance> UserBalance2 { get; set; }


        public virtual ICollection<VendorType> VendorType { get; set; }


        public virtual ICollection<VendorType> VendorType1 { get; set; }


        public virtual ICollection<VolumeRange> VolumeRange { get; set; }


        public virtual ICollection<VolumeRange> VolumeRange1 { get; set; }


        public virtual ICollection<WeightRange> WeightRange { get; set; }


        public virtual ICollection<WeightRange> WeightRange1 { get; set; }
    }
}
