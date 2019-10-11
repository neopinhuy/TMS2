namespace TMS.API.Models
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("User")]
    public partial class User
    {
        public User()
        {
            AccessoryInsertedBy = new HashSet<Accessory>();
            AccessoryUpdatedBy = new HashSet<Accessory>();
            CommodityTypeInsertedBy = new HashSet<CommodityType>();
            CommodityTypeUpdatedBy = new HashSet<CommodityType>();
            ContainerInsertedBy = new HashSet<Container>();
            ContainerUpdatedBy = new HashSet<Container>();
            ContainerMonitorConfigInsertedBy = new HashSet<ContainerMonitorConfig>();
            ContainerMonitorConfigUpdatedBy = new HashSet<ContainerMonitorConfig>();
            AssignedContainerMonitorConfig = new HashSet<ContainerMonitorConfig>();
            ContainerTypeInsertedBy = new HashSet<ContainerType>();
            ContainerTypeUpdatedBy = new HashSet<ContainerType>();
            Contract = new HashSet<Contract>();
            ContractInsertedBy = new HashSet<Contract>();
            ContractUpdatedBy = new HashSet<Contract>();
            Coordination = new HashSet<Coordination>();
            CoordinationInsertedBy = new HashSet<Coordination>();
            CoordinationUpdatedBy = new HashSet<Coordination>();
            CustomerInsertedBy = new HashSet<Customer>();
            CustomerUpdatedBy = new HashSet<Customer>();
            DepartmentLeader = new HashSet<Department>();
            DepartmentInsertedBy = new HashSet<Department>();
            DepartmentUpdatedBy = new HashSet<Department>();
            FeatureInsertedBy = new HashSet<Feature>();
            FreightBalance = new HashSet<FreightBalance>();
            FreightBalanceUpdatedBy = new HashSet<FreightBalance>();
            FreightHistoryInsertedBy = new HashSet<FreightHistory>();
            FreightHistoryUpdatedBy = new HashSet<FreightHistory>();
            FreightProofInsertedBy = new HashSet<FreightProof>();
            FreightProofUpdatedBy = new HashSet<FreightProof>();
            FreightStateInsertedBy = new HashSet<FreightState>();
            FreightStateUpdatedBy = new HashSet<FreightState>();
            GroupRoleInsertedBy = new HashSet<GroupRole>();
            GroupRoleUpdatedBy = new HashSet<GroupRole>();
            MaintenanceTicketAssignee = new HashSet<MaintenanceTicket>();
            MaintenanceTicketInsertedBy = new HashSet<MaintenanceTicket>();
            MaintenanceTicketUpdatedBy = new HashSet<MaintenanceTicket>();
            NationalityInsertedBy = new HashSet<Nationality>();
            Order = new HashSet<Order>();
            OrderUpdatedBy = new HashSet<Order>();
            OrderDetail = new HashSet<OrderDetail>();
            OrderDetailUpdatedBy = new HashSet<OrderDetail>();
            PaymentApprovalConfig = new HashSet<PaymentApprovalConfig>();
            PaymentApprovalConfigInsertedBy = new HashSet<PaymentApprovalConfig>();
            PaymentApprovalConfigUpdated = new HashSet<PaymentApprovalConfig>();
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

        [NotMapped]
        public string FullName => FirstName + " " + LastName;

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

        public int? SupervisorId { get; set; }

        public int? DepartmentId { get; set; }

        public int? RoleId { get; set; }

        public bool Active { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedDate { get; set; }

        public int? InsertedBy { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Accessory> AccessoryInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Accessory> AccessoryUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<CommodityType> CommodityTypeInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<CommodityType> CommodityTypeUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Container> ContainerInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Container> ContainerUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<ContainerMonitorConfig> ContainerMonitorConfigInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<ContainerMonitorConfig> ContainerMonitorConfigUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<ContainerMonitorConfig> AssignedContainerMonitorConfig { get; set; }

        [JsonIgnore]
        public virtual ICollection<ContainerType> ContainerTypeInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<ContainerType> ContainerTypeUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Contract> Contract { get; set; }

        [JsonIgnore]
        public virtual ICollection<Contract> ContractInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Contract> ContractUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Coordination> Coordination { get; set; }

        [JsonIgnore]
        public virtual ICollection<Coordination> CoordinationInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Coordination> CoordinationUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Customer> CustomerInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Customer> CustomerUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Department> DepartmentLeader { get; set; }

        [JsonIgnore]
        public virtual ICollection<Department> DepartmentInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Department> DepartmentUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User Supervisor { get; set; }

        [JsonIgnore]
        public virtual ICollection<User> Reporter { get; set; }

        [JsonIgnore]
        public virtual Department Department { get; set; }

        [JsonIgnore]
        public virtual ICollection<Feature> FeatureInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<FreightBalance> FreightBalance { get; set; }

        [JsonIgnore]
        public virtual ICollection<FreightBalance> FreightBalanceUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<FreightHistory> FreightHistoryInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<FreightHistory> FreightHistoryUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<FreightProof> FreightProofInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<FreightProof> FreightProofUpdatedBy { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightState> FreightStateInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<FreightState> FreightStateUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<GroupRole> GroupRoleInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<GroupRole> GroupRoleUpdatedBy { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<MaintenanceTicket> MaintenanceTicketAssignee { get; set; }

        [JsonIgnore]
        public virtual ICollection<MaintenanceTicket> MaintenanceTicketInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<MaintenanceTicket> MaintenanceTicketUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Nationality> NationalityInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Nationality> NationalityUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Order> Order { get; set; }

        [JsonIgnore]
        public virtual ICollection<Order> OrderUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }

        [JsonIgnore]
        public virtual ICollection<OrderDetail> OrderDetailUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfig { get; set; }

        [JsonIgnore]
        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfigInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfigUpdated { get; set; }

        [JsonIgnore]
        public virtual ICollection<Quotation> QuotationInsertdBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Quotation> QuotationUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<RightByGroup> RightByGroupInsertedBy { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<RightByGroup> RightByGroupUpdated { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<RightByRole> RightByRoleInsertedBy { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<RightByRole> RightByRoleUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<RightByUser> RightByUserUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<RightByUser> UserRight { get; set; }

        [JsonIgnore]
        public virtual ICollection<RightByUser> RightByUserInserted { get; set; }

        [JsonIgnore]
        public virtual Role Role { get; set; }

        [JsonIgnore]
        public virtual ICollection<Surcharge> SurchargeInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Surcharge> SurchargeUpdated { get; set; }

        [JsonIgnore]
        public virtual ICollection<Terminal> TerminalInserted { get; set; }

        [JsonIgnore]
        public virtual ICollection<Terminal> TerminalUpdated { get; set; }

        [JsonIgnore]
        public virtual ICollection<TicketState> TicketStateInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<TicketState> TicketStateUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Timebox> TimeboxInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<Timebox> TimeboxUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<TruckMaintenance> TruckMaintenanceAccountable { get; set; }

        [JsonIgnore]
        public virtual ICollection<TruckMaintenance> TruckMaintenanceInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<TruckMaintenance> TruckMaintenanceUpdatedBY { get; set; }

        [JsonIgnore]
        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetailInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetailUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfig { get; set; }

        [JsonIgnore]
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfigInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfigUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<User> UserInsertedBy { get; set; }

        [JsonIgnore]
        public virtual User UserInserted { get; set; }

        [JsonIgnore]
        public virtual ICollection<User> UserUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual User UserUpdated { get; set; }

        [JsonIgnore]
        public virtual ICollection<UserBalance> UserBalance { get; set; }

        [JsonIgnore]
        public virtual ICollection<UserBalance> UserBalanceInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<UserBalance> UserBalanceUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<VendorType> VendorTypeInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<VendorType> VendorTypeUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<VolumeRange> VolumeRangeInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<VolumeRange> VolumeRangeUpdatedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<WeightRange> WeightRangeInsertedBy { get; set; }

        [JsonIgnore]
        public virtual ICollection<WeightRange> WeightRangeUpdatedBy { get; set; }
    }
}
