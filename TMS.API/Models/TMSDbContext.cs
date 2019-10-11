namespace TMS.API.Models
{
    using Microsoft.EntityFrameworkCore;

    public partial class TMSDbContext : DbContext
    {
        public TMSDbContext(DbContextOptions<TMSDbContext> options) : base(options)
        {

        }

        public virtual DbSet<Accessory> Accessory { get; set; }
        public virtual DbSet<CommodityType> CommodityType { get; set; }
        public virtual DbSet<Container> Container { get; set; }
        public virtual DbSet<ContainerMaintenance> ContainerMaintenance { get; set; }
        public virtual DbSet<ContainerMonitorConfig> ContainerMonitorConfig { get; set; }
        public virtual DbSet<ContainerType> ContainerType { get; set; }
        public virtual DbSet<Contract> Contract { get; set; }
        public virtual DbSet<Coordination> Coordination { get; set; }
        public virtual DbSet<Customer> Customer { get; set; }
        public virtual DbSet<CustomerGroup> CustomerGroup { get; set; }
        public virtual DbSet<Department> Department { get; set; }
        public virtual DbSet<Feature> Feature { get; set; }
        public virtual DbSet<FreightBalance> FreightBalance { get; set; }
        public virtual DbSet<FreightHistory> FreightHistory { get; set; }
        public virtual DbSet<FreightProof> FreightProof { get; set; }
        public virtual DbSet<FreightState> FreightState { get; set; }
        public virtual DbSet<GroupRole> GroupRole { get; set; }
        public virtual DbSet<MaintenanceTicket> MaintenanceTicket { get; set; }
        public virtual DbSet<Nationality> Nationality { get; set; }
        public virtual DbSet<Objective> Objective { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<OrderDetail> OrderDetail { get; set; }
        public virtual DbSet<PaymentApproval> PaymentApproval { get; set; }
        public virtual DbSet<PaymentApprovalConfig> PaymentApprovalConfig { get; set; }
        public virtual DbSet<Quotation> Quotation { get; set; }
        public virtual DbSet<RightByGroup> RightByGroup { get; set; }
        public virtual DbSet<RightByRole> RightByRole { get; set; }
        public virtual DbSet<RightByUser> RightByUser { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<Surcharge> Surcharge { get; set; }
        public virtual DbSet<Terminal> Terminal { get; set; }
        public virtual DbSet<TicketState> TicketState { get; set; }
        public virtual DbSet<Timebox> Timebox { get; set; }
        public virtual DbSet<Truck> Truck { get; set; }
        public virtual DbSet<TruckMaintenance> TruckMaintenance { get; set; }
        public virtual DbSet<TruckMaintenanceDetail> TruckMaintenanceDetail { get; set; }
        public virtual DbSet<TruckMonitorConfig> TruckMonitorConfig { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserBalance> UserBalance { get; set; }
        public virtual DbSet<Vendor> Vendor { get; set; }
        public virtual DbSet<VendorType> VendorType { get; set; }
        public virtual DbSet<VolumeRange> VolumeRange { get; set; }
        public virtual DbSet<WeightRange> WeightRange { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Accessory>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<Accessory>()
                .HasMany(e => e.TruckMaintenanceDetail)
                .WithOne(e => e.Accessory)
                .HasForeignKey(e => e.AccessaryId);

            modelBuilder.Entity<Accessory>()
                .HasMany(e => e.MaintenanceTicket)
                .WithOne(e => e.Accessory)
                .HasForeignKey(e => e.AccessaryId);

            modelBuilder.Entity<Accessory>()
                .HasMany(e => e.TruckMonitorConfig)
                .WithOne(e => e.Accessory)
                .HasForeignKey(e => e.AccessaryId);

            modelBuilder.Entity<CommodityType>()
                .HasMany(e => e.OrderDetail)
                .WithOne(e => e.CommodityType)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<CommodityType>()
                .HasMany(e => e.Quotation)
                .WithOne(e => e.CommodityType)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Container>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Container>()
                .HasMany(e => e.ContainerMonitorConfig)
                .WithOne(e => e.Container)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Container>()
                .HasMany(e => e.Coordination)
                .WithOne(e => e.Container)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<ContainerMaintenance>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<Contract>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<Coordination>()
                .HasMany(e => e.FreightHistory)
                .WithOne(e => e.Coordination)
                .HasForeignKey(e => e.CoordinatorId)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Coordination>()
                .HasMany(e => e.UserBalance)
                .WithOne(e => e.Coordination)
                .HasForeignKey(e => e.CoordinatorId);

            modelBuilder.Entity<Customer>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.PhoneNumber2)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.SSN)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.Passport)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.Order)
                .WithOne(e => e.Customer)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Department>()
                .HasMany(e => e.UserInDepartment)
                .WithOne(e => e.Department)
                .HasForeignKey(e => e.DepartmentId)
                .IsRequired(false).OnDelete(DeleteBehavior.SetNull);

            modelBuilder.Entity<Feature>()
                .HasMany(e => e.RightByGroup)
                .WithOne(e => e.Feature)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Feature>()
                .HasMany(e => e.RightByRole)
                .WithOne(e => e.Feature)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<FreightBalance>()
                .Property(e => e.Curency)
                .IsUnicode(false);

            modelBuilder.Entity<FreightBalance>()
                .Property(e => e.Entity)
                .IsUnicode(false);

            modelBuilder.Entity<FreightHistory>()
                .HasMany(e => e.FreightProof)
                .WithOne(e => e.FreightHistory)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<FreightState>()
                .HasMany(e => e.Container)
                .WithOne(e => e.FreightState)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<FreightState>()
                .HasMany(e => e.Coordination)
                .WithOne(e => e.FreightState)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<FreightState>()
                .HasMany(e => e.FreightHistory)
                .WithOne(e => e.FreightState)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<FreightState>()
                .HasMany(e => e.Truck)
                .WithOne(e => e.FreightState)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<MaintenanceTicket>()
                .HasMany(e => e.TruckMaintenance)
                .WithOne(e => e.MaintenanceTicket)
                .HasForeignKey(e => e.TicketId)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Nationality>()
                .HasMany(e => e.Customer)
                .WithOne(e => e.Nationality)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Nationality>()
                .HasMany(e => e.Terminal)
                .WithOne(e => e.Nationality)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Objective>()
                .HasMany(e => e.FreightBalance)
                .WithOne(e => e.Objective)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Objective>()
                .HasMany(e => e.UserBalance)
                .WithOne(e => e.Objective)
                .HasForeignKey(e => e.PaymentObjectiveId)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Order>()
                .Property(e => e.ContactNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.ContactSSN)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.ContactPassport)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderDetail)
                .WithOne(e => e.Order)
                .IsRequired()
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<OrderDetail>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<OrderDetail>()
                .HasMany(e => e.Coordination)
                .WithOne(e => e.OrderDetail)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<OrderDetail>()
                .HasMany(e => e.Surcharge)
                .WithOne(e => e.OrderDetail)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Quotation>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.RightByRole)
                .WithOne(e => e.Role)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.User)
                .WithOne(e => e.Role)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Surcharge>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<Terminal>()
                .Property(e => e.ContactNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Terminal>()
                .HasMany(e => e.CoordinationFromTerminal)
                .WithOne(e => e.FromTerminal)
                .HasForeignKey(e => e.FromId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Terminal>()
                .HasMany(e => e.CoordinationToTerminal)
                .WithOne(e => e.ToTerminal)
                .HasForeignKey(e => e.ToId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Terminal>()
                .HasMany(e => e.OrderFromTerminal)
                .WithOne(e => e.FromTerminal)
                .HasForeignKey(e => e.FromId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Terminal>()
               .HasMany(e => e.OrderToTerminal)
               .WithOne(e => e.ToTerminal)
               .HasForeignKey(e => e.ToId)
               .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Terminal>()
                .HasMany(e => e.QuotationFromTerminal)
                .WithOne(e => e.FromTerminal)
                .HasForeignKey(e => e.FromId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Terminal>()
                .HasMany(e => e.QuotationToTerminal)
                .WithOne(e => e.ToTerminal)
                .HasForeignKey(e => e.ToId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<TicketState>()
                .HasMany(e => e.MaintenanceTicket)
                .WithOne(e => e.TicketState)
                .HasForeignKey(x => x.TicketStateId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Truck>()
                .Property(e => e.TruckPlate)
                .IsUnicode(false);

            modelBuilder.Entity<Truck>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<Truck>()
                .Property(e => e.ExpiredDate)
                .IsFixedLength();

            modelBuilder.Entity<Truck>()
                .HasMany(e => e.Coordination)
                .WithOne(e => e.Truck)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Truck>()
                .HasMany(e => e.TruckMonitorConfig)
                .WithOne(e => e.Truck)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<TruckMaintenance>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<TruckMaintenance>()
                .HasMany(e => e.TruckMaintenanceDetail)
                .WithOne(e => e.TruckMaintenance)
                .HasForeignKey(e => e.MaintenanceId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<TruckMaintenanceDetail>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.SSN)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Passport)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.PhoneNumber2)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Reporter)
                .WithOne(e => e.Supervisor)
                .HasForeignKey(e => e.SupervisorId)
                .IsRequired(false).OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<User>()
                .HasMany(e => e.AccessoryInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.AccessoryUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.CommodityTypeInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.CommodityTypeUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.ContainerInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.ContainerUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.AssignedContainerMonitorConfig)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.AssigneeId);

            modelBuilder.Entity<User>()
                .HasMany(e => e.ContainerMonitorConfigInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.ContainerMonitorConfigUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.ContainerTypeInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.ContainerTypeUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Contract)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId)
                .IsRequired().OnDelete(DeleteBehavior.SetNull);

            modelBuilder.Entity<User>()
                .HasMany(e => e.ContractInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.ContractUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Coordination)
                .WithOne(e => e.Driver)
                .HasForeignKey(e => e.DriverId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.CoordinationInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.CoordinationUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.CustomerInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.CustomerUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.DepartmentLeader)
                .WithOne(e => e.Leader)
                .HasForeignKey(e => e.LeaderId)
                .IsRequired().OnDelete(DeleteBehavior.SetNull);

            modelBuilder.Entity<User>()
                .HasMany(e => e.DepartmentInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.DepartmentUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.FeatureInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.FreightBalance)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.FreightBalanceUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.FreightHistoryInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.FreightHistoryUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.FreightProofInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.FreightProofUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.FreightStateInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.FreightStateUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.GroupRoleInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.GroupRoleUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.MaintenanceTicketAssignee)
                .WithOne(e => e.Assignee)
                .HasForeignKey(e => e.AssigneeId);

            modelBuilder.Entity<User>()
                .HasMany(e => e.MaintenanceTicketInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.MaintenanceTicketUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.NationalityInsertedBy)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired()
                .OnDelete(DeleteBehavior.SetNull);

            modelBuilder.Entity<User>()
                .HasMany(e => e.NationalityUpdatedBy)
                .WithOne(e => e.User1)
                .HasForeignKey(e => e.UpdatedBy)
                .OnDelete(DeleteBehavior.SetNull);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Order)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.OrderUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.OrderDetail)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.OrderDetailUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.PaymentApprovalConfig)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId);

            modelBuilder.Entity<User>()
                .HasMany(e => e.PaymentApprovalConfigInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.PaymentApprovalConfigUpdated)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.QuotationInsertdBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.QuotationUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.RightByGroupInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.RightByGroupUpdated)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.RightByRoleInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.RightByRoleUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.RightByUserUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.UserRight)
                .WithOne(e => e.UserRight)
                .HasForeignKey(e => e.UserId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.RightByUserInserted)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.SurchargeInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.SurchargeUpdated)
                .WithOne(e => e.UpdatedUser)
                .HasForeignKey(x => x.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TerminalInserted)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(x => x.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TerminalUpdated)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TicketStateInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TicketStateUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TimeboxInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TimeboxUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TruckMaintenanceAccountable)
                .WithOne(e => e.AccoutableUser)
                .HasForeignKey(e => e.AccountableUserId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TruckMaintenanceInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TruckMaintenanceUpdatedBY)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TruckMaintenanceDetailInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TruckMaintenanceDetailUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TruckMonitorConfig)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TruckMonitorConfigInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.TruckMonitorConfigUpdatedBy)
                .WithOne(e => e.UseUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.UserInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.UserUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.UserBalance)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.UserBalanceInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.UserBalanceUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.VendorTypeInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.VendorTypeUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.VolumeRangeInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.VolumeRangeUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<User>()
                .HasMany(e => e.WeightRangeInsertedBy)
                .WithOne(e => e.UserInserted)
                .HasForeignKey(e => e.InsertedBy)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<User>()
                .HasMany(e => e.WeightRangeUpdatedBy)
                .WithOne(e => e.UserUpdated)
                .HasForeignKey(e => e.UpdatedBy);

            modelBuilder.Entity<UserBalance>()
                .Property(e => e.Currency)
                .IsUnicode(false);

            modelBuilder.Entity<Vendor>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Vendor>()
                .Property(e => e.PhoneNumber2)
                .IsUnicode(false);

            modelBuilder.Entity<Vendor>()
                .HasMany(e => e.Accessory)
                .WithOne(e => e.Vendor)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Vendor>()
                .HasMany(e => e.Container)
                .WithOne(e => e.Vendor)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Vendor>()
                .HasMany(e => e.TruckMaintenance)
                .WithOne(e => e.Vendor)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<VendorType>()
                .HasMany(e => e.Vendor)
                .WithOne(e => e.VendorType)
                .IsRequired().OnDelete(DeleteBehavior.Cascade);
            base.OnModelCreating(modelBuilder);
        }
    }
}
