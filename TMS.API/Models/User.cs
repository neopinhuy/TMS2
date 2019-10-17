using System;
using System.Collections.Generic;

namespace TMS.API.Models
{
    public partial class User
    {
        public User()
        {
            AccessoryInsertedByNavigation = new HashSet<Accessory>();
            AccessoryUpdatedByNavigation = new HashSet<Accessory>();
            CommodityTypeInsertedByNavigation = new HashSet<CommodityType>();
            CommodityTypeUpdatedByNavigation = new HashSet<CommodityType>();
            ContainerInsertedByNavigation = new HashSet<Container>();
            ContainerMonitorConfigAssignee = new HashSet<ContainerMonitorConfig>();
            ContainerMonitorConfigInsertedByNavigation = new HashSet<ContainerMonitorConfig>();
            ContainerMonitorConfigUpdatedByNavigation = new HashSet<ContainerMonitorConfig>();
            ContainerTypeInsertedByNavigation = new HashSet<ContainerType>();
            ContainerTypeUpdatedByNavigation = new HashSet<ContainerType>();
            ContainerUpdatedByNavigation = new HashSet<Container>();
            ContractInsertedByNavigation = new HashSet<Contract>();
            ContractUpdatedByNavigation = new HashSet<Contract>();
            ContractUser = new HashSet<Contract>();
            CoordinationDriver = new HashSet<Coordination>();
            CoordinationInsertedByNavigation = new HashSet<Coordination>();
            CoordinationUpdatedByNavigation = new HashSet<Coordination>();
            CustomerInsertedByNavigation = new HashSet<Customer>();
            CustomerUpdatedByNavigation = new HashSet<Customer>();
            DepartmentInsertedByNavigation = new HashSet<Department>();
            DepartmentLeader = new HashSet<Department>();
            DepartmentUpdatedByNavigation = new HashSet<Department>();
            EntityInsertedByNavigation = new HashSet<Entity>();
            EntityPolicyInsertedByNavigation = new HashSet<EntityPolicy>();
            EntityPolicyUpdatedByNavigation = new HashSet<EntityPolicy>();
            EntityUpdatedByNavigation = new HashSet<Entity>();
            Feature = new HashSet<Feature>();
            FieldInsertedByNavigation = new HashSet<Field>();
            FieldUpdatedByNavigation = new HashSet<Field>();
            FreightBalanceInsertedByNavigation = new HashSet<FreightBalance>();
            FreightBalanceUpdatedByNavigation = new HashSet<FreightBalance>();
            FreightHistoryInsertedByNavigation = new HashSet<FreightHistory>();
            FreightHistoryUpdatedByNavigation = new HashSet<FreightHistory>();
            FreightProofInsertedByNavigation = new HashSet<FreightProof>();
            FreightProofUpdatedByNavigation = new HashSet<FreightProof>();
            FreightStateInsertedByNavigation = new HashSet<FreightState>();
            FreightStateUpdatedByNavigation = new HashSet<FreightState>();
            GroupMemberInsertedByNavigation = new HashSet<GroupMember>();
            GroupMemberUpdatedByNavigation = new HashSet<GroupMember>();
            GroupRoleInsertedByNavigation = new HashSet<GroupRole>();
            GroupRoleUpdatedByNavigation = new HashSet<GroupRole>();
            InverseInsertedByNavigation = new HashSet<User>();
            InverseSupervisor = new HashSet<User>();
            InverseUpdatedByNavigation = new HashSet<User>();
            MaintenanceTicketAssignee = new HashSet<MaintenanceTicket>();
            MaintenanceTicketInsertedByNavigation = new HashSet<MaintenanceTicket>();
            MaintenanceTicketUpdatedByNavigation = new HashSet<MaintenanceTicket>();
            NationalityUpdatedByNavigation = new HashSet<Nationality>();
            OrderDetailInsertedByNavigation = new HashSet<OrderDetail>();
            OrderDetailUpdatedByNavigation = new HashSet<OrderDetail>();
            OrderInsertedByNavigation = new HashSet<Order>();
            OrderUpdatedByNavigation = new HashSet<Order>();
            PaymentApprovalConfigInsertedByNavigation = new HashSet<PaymentApprovalConfig>();
            PaymentApprovalConfigUpdatedByNavigation = new HashSet<PaymentApprovalConfig>();
            PaymentApprovalConfigUser = new HashSet<PaymentApprovalConfig>();
            QuotationInsertedByNavigation = new HashSet<Quotation>();
            QuotationUpdatedByNavigation = new HashSet<Quotation>();
            SurchargeInsertedByNavigation = new HashSet<Surcharge>();
            TerminalUpdatedByNavigation = new HashSet<Terminal>();
            TicketStateInsertedByNavigation = new HashSet<TicketState>();
            TicketStateUpdatedByNavigation = new HashSet<TicketState>();
            TimeboxInsertedByNavigation = new HashSet<Timebox>();
            TimeboxUpdatedByNavigation = new HashSet<Timebox>();
            TruckMaintenanceAccountableUser = new HashSet<TruckMaintenance>();
            TruckMaintenanceDetailInsertedByNavigation = new HashSet<TruckMaintenanceDetail>();
            TruckMaintenanceDetailUpdatedByNavigation = new HashSet<TruckMaintenanceDetail>();
            TruckMaintenanceInsertedByNavigation = new HashSet<TruckMaintenance>();
            TruckMaintenanceUpdatedByNavigation = new HashSet<TruckMaintenance>();
            TruckMonitorConfigInsertedByNavigation = new HashSet<TruckMonitorConfig>();
            TruckMonitorConfigUpdatedByNavigation = new HashSet<TruckMonitorConfig>();
            TruckMonitorConfigUser = new HashSet<TruckMonitorConfig>();
            UserBalanceInsertedByNavigation = new HashSet<UserBalance>();
            UserBalanceUpdatedByNavigation = new HashSet<UserBalance>();
            UserBalanceUser = new HashSet<UserBalance>();
            UserInterfaceInsertedByNavigation = new HashSet<UserInterface>();
            UserInterfaceUpdatedByNavigation = new HashSet<UserInterface>();
            VendorTypeInsertedByNavigation = new HashSet<VendorType>();
            VendorTypeUpdatedByNavigation = new HashSet<VendorType>();
            VolumeRangeInsertedByNavigation = new HashSet<VolumeRange>();
            VolumeRangeUpdatedByNavigation = new HashSet<VolumeRange>();
            WeightRangeInsertedByNavigation = new HashSet<WeightRange>();
            WeightRangeUpdatedByNavigation = new HashSet<WeightRange>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DoB { get; set; }
        public string Ssn { get; set; }
        public string Passport { get; set; }
        public string Address { get; set; }
        public string Address2 { get; set; }
        public string PhoneNumber { get; set; }
        public string PhoneNumber2 { get; set; }
        public int? NationalityId { get; set; }
        public int? ContractId { get; set; }
        public int? DepartmentId { get; set; }
        public int? RoleId { get; set; }
        public bool Active { get; set; }
        public DateTime InsertedDate { get; set; }
        public int? InsertedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public int? SupervisorId { get; set; }

        public virtual Contract Contract { get; set; }
        public virtual Department Department { get; set; }
        public virtual User InsertedByNavigation { get; set; }
        public virtual Nationality Nationality { get; set; }
        public virtual Role Role { get; set; }
        public virtual User Supervisor { get; set; }
        public virtual User UpdatedByNavigation { get; set; }
        public virtual Nationality NationalityIdNavigation { get; set; }
        public virtual Surcharge SurchargeIdNavigation { get; set; }
        public virtual Terminal TerminalIdNavigation { get; set; }
        public virtual ICollection<Accessory> AccessoryInsertedByNavigation { get; set; }
        public virtual ICollection<Accessory> AccessoryUpdatedByNavigation { get; set; }
        public virtual ICollection<CommodityType> CommodityTypeInsertedByNavigation { get; set; }
        public virtual ICollection<CommodityType> CommodityTypeUpdatedByNavigation { get; set; }
        public virtual ICollection<Container> ContainerInsertedByNavigation { get; set; }
        public virtual ICollection<ContainerMonitorConfig> ContainerMonitorConfigAssignee { get; set; }
        public virtual ICollection<ContainerMonitorConfig> ContainerMonitorConfigInsertedByNavigation { get; set; }
        public virtual ICollection<ContainerMonitorConfig> ContainerMonitorConfigUpdatedByNavigation { get; set; }
        public virtual ICollection<ContainerType> ContainerTypeInsertedByNavigation { get; set; }
        public virtual ICollection<ContainerType> ContainerTypeUpdatedByNavigation { get; set; }
        public virtual ICollection<Container> ContainerUpdatedByNavigation { get; set; }
        public virtual ICollection<Contract> ContractInsertedByNavigation { get; set; }
        public virtual ICollection<Contract> ContractUpdatedByNavigation { get; set; }
        public virtual ICollection<Contract> ContractUser { get; set; }
        public virtual ICollection<Coordination> CoordinationDriver { get; set; }
        public virtual ICollection<Coordination> CoordinationInsertedByNavigation { get; set; }
        public virtual ICollection<Coordination> CoordinationUpdatedByNavigation { get; set; }
        public virtual ICollection<Customer> CustomerInsertedByNavigation { get; set; }
        public virtual ICollection<Customer> CustomerUpdatedByNavigation { get; set; }
        public virtual ICollection<Department> DepartmentInsertedByNavigation { get; set; }
        public virtual ICollection<Department> DepartmentLeader { get; set; }
        public virtual ICollection<Department> DepartmentUpdatedByNavigation { get; set; }
        public virtual ICollection<Entity> EntityInsertedByNavigation { get; set; }
        public virtual ICollection<EntityPolicy> EntityPolicyInsertedByNavigation { get; set; }
        public virtual ICollection<EntityPolicy> EntityPolicyUpdatedByNavigation { get; set; }
        public virtual ICollection<Entity> EntityUpdatedByNavigation { get; set; }
        public virtual ICollection<Feature> Feature { get; set; }
        public virtual ICollection<Field> FieldInsertedByNavigation { get; set; }
        public virtual ICollection<Field> FieldUpdatedByNavigation { get; set; }
        public virtual ICollection<FreightBalance> FreightBalanceInsertedByNavigation { get; set; }
        public virtual ICollection<FreightBalance> FreightBalanceUpdatedByNavigation { get; set; }
        public virtual ICollection<FreightHistory> FreightHistoryInsertedByNavigation { get; set; }
        public virtual ICollection<FreightHistory> FreightHistoryUpdatedByNavigation { get; set; }
        public virtual ICollection<FreightProof> FreightProofInsertedByNavigation { get; set; }
        public virtual ICollection<FreightProof> FreightProofUpdatedByNavigation { get; set; }
        public virtual ICollection<FreightState> FreightStateInsertedByNavigation { get; set; }
        public virtual ICollection<FreightState> FreightStateUpdatedByNavigation { get; set; }
        public virtual ICollection<GroupMember> GroupMemberInsertedByNavigation { get; set; }
        public virtual ICollection<GroupMember> GroupMemberUpdatedByNavigation { get; set; }
        public virtual ICollection<GroupRole> GroupRoleInsertedByNavigation { get; set; }
        public virtual ICollection<GroupRole> GroupRoleUpdatedByNavigation { get; set; }
        public virtual ICollection<User> InverseInsertedByNavigation { get; set; }
        public virtual ICollection<User> InverseSupervisor { get; set; }
        public virtual ICollection<User> InverseUpdatedByNavigation { get; set; }
        public virtual ICollection<MaintenanceTicket> MaintenanceTicketAssignee { get; set; }
        public virtual ICollection<MaintenanceTicket> MaintenanceTicketInsertedByNavigation { get; set; }
        public virtual ICollection<MaintenanceTicket> MaintenanceTicketUpdatedByNavigation { get; set; }
        public virtual ICollection<Nationality> NationalityUpdatedByNavigation { get; set; }
        public virtual ICollection<OrderDetail> OrderDetailInsertedByNavigation { get; set; }
        public virtual ICollection<OrderDetail> OrderDetailUpdatedByNavigation { get; set; }
        public virtual ICollection<Order> OrderInsertedByNavigation { get; set; }
        public virtual ICollection<Order> OrderUpdatedByNavigation { get; set; }
        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfigInsertedByNavigation { get; set; }
        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfigUpdatedByNavigation { get; set; }
        public virtual ICollection<PaymentApprovalConfig> PaymentApprovalConfigUser { get; set; }
        public virtual ICollection<Quotation> QuotationInsertedByNavigation { get; set; }
        public virtual ICollection<Quotation> QuotationUpdatedByNavigation { get; set; }
        public virtual ICollection<Surcharge> SurchargeInsertedByNavigation { get; set; }
        public virtual ICollection<Terminal> TerminalUpdatedByNavigation { get; set; }
        public virtual ICollection<TicketState> TicketStateInsertedByNavigation { get; set; }
        public virtual ICollection<TicketState> TicketStateUpdatedByNavigation { get; set; }
        public virtual ICollection<Timebox> TimeboxInsertedByNavigation { get; set; }
        public virtual ICollection<Timebox> TimeboxUpdatedByNavigation { get; set; }
        public virtual ICollection<TruckMaintenance> TruckMaintenanceAccountableUser { get; set; }
        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetailInsertedByNavigation { get; set; }
        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetailUpdatedByNavigation { get; set; }
        public virtual ICollection<TruckMaintenance> TruckMaintenanceInsertedByNavigation { get; set; }
        public virtual ICollection<TruckMaintenance> TruckMaintenanceUpdatedByNavigation { get; set; }
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfigInsertedByNavigation { get; set; }
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfigUpdatedByNavigation { get; set; }
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfigUser { get; set; }
        public virtual ICollection<UserBalance> UserBalanceInsertedByNavigation { get; set; }
        public virtual ICollection<UserBalance> UserBalanceUpdatedByNavigation { get; set; }
        public virtual ICollection<UserBalance> UserBalanceUser { get; set; }
        public virtual ICollection<UserInterface> UserInterfaceInsertedByNavigation { get; set; }
        public virtual ICollection<UserInterface> UserInterfaceUpdatedByNavigation { get; set; }
        public virtual ICollection<VendorType> VendorTypeInsertedByNavigation { get; set; }
        public virtual ICollection<VendorType> VendorTypeUpdatedByNavigation { get; set; }
        public virtual ICollection<VolumeRange> VolumeRangeInsertedByNavigation { get; set; }
        public virtual ICollection<VolumeRange> VolumeRangeUpdatedByNavigation { get; set; }
        public virtual ICollection<WeightRange> WeightRangeInsertedByNavigation { get; set; }
        public virtual ICollection<WeightRange> WeightRangeUpdatedByNavigation { get; set; }
    }
}
