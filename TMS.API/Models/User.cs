using Newtonsoft.Json;
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
            ActionInsertedByNavigation = new HashSet<Action>();
            ActionPolicyInsertedByNavigation = new HashSet<ActionPolicy>();
            ActionPolicyUpdatedByNavigation = new HashSet<ActionPolicy>();
            ActionUpdatedByNavigation = new HashSet<Action>();
            CommodityTypeInsertedByNavigation = new HashSet<CommodityType>();
            CommodityTypeUpdatedByNavigation = new HashSet<CommodityType>();
            ContainerInsertedByNavigation = new HashSet<Container>();
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
            FreightHistoryActor = new HashSet<FreightHistory>();
            FreightHistoryInsertedByNavigation = new HashSet<FreightHistory>();
            FreightHistoryUpdatedByNavigation = new HashSet<FreightHistory>();
            FreightProofInsertedByNavigation = new HashSet<FreightProof>();
            FreightProofUpdatedByNavigation = new HashSet<FreightProof>();
            FreightStateInsertedByNavigation = new HashSet<FreightState>();
            FreightStateUpdatedByNavigation = new HashSet<FreightState>();
            FuelTypeInsertedByNavigation = new HashSet<FuelType>();
            FuelTypeUpdatedByNavigation = new HashSet<FuelType>();
            GroupMemberInsertedByNavigation = new HashSet<GroupMember>();
            GroupMemberUpdatedByNavigation = new HashSet<GroupMember>();
            GroupRoleInsertedByNavigation = new HashSet<GroupRole>();
            GroupRoleUpdatedByNavigation = new HashSet<GroupRole>();
            InverseInsertedByNavigation = new HashSet<User>();
            InverseSupervisor = new HashSet<User>();
            InverseUpdatedByNavigation = new HashSet<User>();
            LedgerApprover = new HashSet<Ledger>();
            LedgerInsertedByNavigation = new HashSet<Ledger>();
            LedgerUpdatedByNavigation = new HashSet<Ledger>();
            MaintenanceTicketAssignee = new HashSet<MaintenanceTicket>();
            MaintenanceTicketInsertedByNavigation = new HashSet<MaintenanceTicket>();
            MaintenanceTicketUpdatedByNavigation = new HashSet<MaintenanceTicket>();
            NationalityUpdatedByNavigation = new HashSet<Nationality>();
            OrderDetailInsertedByNavigation = new HashSet<OrderDetail>();
            OrderDetailUpdatedByNavigation = new HashSet<OrderDetail>();
            OrderInsertedByNavigation = new HashSet<Order>();
            OrderUpdatedByNavigation = new HashSet<Order>();
            PaymentPolicyInsertedByNavigation = new HashSet<PaymentPolicy>();
            PaymentPolicyUpdatedByNavigation = new HashSet<PaymentPolicy>();
            QuotationInsertedByNavigation = new HashSet<Quotation>();
            QuotationUpdatedByNavigation = new HashSet<Quotation>();
            StatePolicyInsertedByNavigation = new HashSet<StatePolicy>();
            StatePolicyUpdatedByNavigation = new HashSet<StatePolicy>();
            SurchargeInsertedByNavigation = new HashSet<Surcharge>();
            TerminalUpdatedByNavigation = new HashSet<Terminal>();
            TicketStateInsertedByNavigation = new HashSet<TicketState>();
            TicketStateUpdatedByNavigation = new HashSet<TicketState>();
            TimeboxInsertedByNavigation = new HashSet<Timebox>();
            TimeboxUpdatedByNavigation = new HashSet<Timebox>();
            TransitionInsertedByNavigation = new HashSet<Transition>();
            TransitionUpdatedByNavigation = new HashSet<Transition>();
            TruckMaintenanceAccountableUser = new HashSet<TruckMaintenance>();
            TruckMaintenanceDetailInsertedByNavigation = new HashSet<TruckMaintenanceDetail>();
            TruckMaintenanceDetailUpdatedByNavigation = new HashSet<TruckMaintenanceDetail>();
            TruckMaintenanceInsertedByNavigation = new HashSet<TruckMaintenance>();
            TruckMaintenanceUpdatedByNavigation = new HashSet<TruckMaintenance>();
            TruckMonitorConfigInsertedByNavigation = new HashSet<TruckMonitorConfig>();
            TruckMonitorConfigUpdatedByNavigation = new HashSet<TruckMonitorConfig>();
            TruckTypeInsertedByNavigation = new HashSet<TruckType>();
            TruckTypeUpdatedByNavigation = new HashSet<TruckType>();
            UserInterfaceInsertedByNavigation = new HashSet<UserInterface>();
            UserInterfaceUpdatedByNavigation = new HashSet<UserInterface>();
            VendorTypeInsertedByNavigation = new HashSet<VendorType>();
            VendorTypeUpdatedByNavigation = new HashSet<VendorType>();
            VolumeRangeInsertedByNavigation = new HashSet<VolumeRange>();
            VolumeRangeUpdatedByNavigation = new HashSet<VolumeRange>();
            WeightRangeInsertedByNavigation = new HashSet<WeightRange>();
            WeightRangeUpdatedByNavigation = new HashSet<WeightRange>();
            WorkflowInsertedByNavigation = new HashSet<Workflow>();
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

        [JsonIgnore]
        public virtual Department Department { get; set; }

        [JsonIgnore]
        public virtual Contract Contract { get; set; }
        
        [JsonIgnore]
        public virtual User InsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Nationality Nationality { get; set; }
        
        [JsonIgnore]
        public virtual Role Role { get; set; }
        
        [JsonIgnore]
        public virtual User Supervisor { get; set; }
        
        [JsonIgnore]
        public virtual User UpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Nationality NationalityIdNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Surcharge SurchargeIdNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Terminal TerminalIdNavigation { get; set; }
        
        [JsonIgnore]
        public virtual Workflow WorkflowIdNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Accessory> AccessoryInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Accessory> AccessoryUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Action> ActionInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<ActionPolicy> ActionPolicyInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<ActionPolicy> ActionPolicyUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Action> ActionUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<CommodityType> CommodityTypeInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<CommodityType> CommodityTypeUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Container> ContainerInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<ContainerType> ContainerTypeInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<ContainerType> ContainerTypeUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Container> ContainerUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Contract> ContractInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Contract> ContractUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Contract> ContractUser { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Coordination> CoordinationDriver { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Coordination> CoordinationInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Coordination> CoordinationUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Customer> CustomerInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Customer> CustomerUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Department> DepartmentInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Department> DepartmentLeader { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Department> DepartmentUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Entity> EntityInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<EntityPolicy> EntityPolicyInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<EntityPolicy> EntityPolicyUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Entity> EntityUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Feature> Feature { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Field> FieldInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Field> FieldUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightHistory> FreightHistoryActor { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightHistory> FreightHistoryInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightHistory> FreightHistoryUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightProof> FreightProofInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightProof> FreightProofUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightState> FreightStateInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FreightState> FreightStateUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FuelType> FuelTypeInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<FuelType> FuelTypeUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<GroupMember> GroupMemberInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<GroupMember> GroupMemberUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<GroupRole> GroupRoleInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<GroupRole> GroupRoleUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<User> InverseInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<User> InverseSupervisor { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<User> InverseUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Ledger> LedgerApprover { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Ledger> LedgerInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Ledger> LedgerUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<MaintenanceTicket> MaintenanceTicketAssignee { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<MaintenanceTicket> MaintenanceTicketInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<MaintenanceTicket> MaintenanceTicketUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Nationality> NationalityUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<OrderDetail> OrderDetailInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<OrderDetail> OrderDetailUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Order> OrderInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Order> OrderUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<PaymentPolicy> PaymentPolicyInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<PaymentPolicy> PaymentPolicyUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Quotation> QuotationInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Quotation> QuotationUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<StatePolicy> StatePolicyInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<StatePolicy> StatePolicyUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Surcharge> SurchargeInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Terminal> TerminalUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TicketState> TicketStateInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TicketState> TicketStateUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Timebox> TimeboxInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Timebox> TimeboxUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Transition> TransitionInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Transition> TransitionUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMaintenance> TruckMaintenanceAccountableUser { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetailInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMaintenanceDetail> TruckMaintenanceDetailUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMaintenance> TruckMaintenanceInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMaintenance> TruckMaintenanceUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfigInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckMonitorConfig> TruckMonitorConfigUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckType> TruckTypeInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<TruckType> TruckTypeUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<UserInterface> UserInterfaceInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<UserInterface> UserInterfaceUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<VendorType> VendorTypeInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<VendorType> VendorTypeUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<VolumeRange> VolumeRangeInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<VolumeRange> VolumeRangeUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<WeightRange> WeightRangeInsertedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<WeightRange> WeightRangeUpdatedByNavigation { get; set; }
        
        [JsonIgnore]
        public virtual ICollection<Workflow> WorkflowInsertedByNavigation { get; set; }
    }
}

