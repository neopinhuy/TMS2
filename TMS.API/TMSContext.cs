using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace TMS.API
{
    public partial class TMSContext : DbContext
    {
        public TMSContext()
        {
        }

        public TMSContext(DbContextOptions<TMSContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Accessory> Accessory { get; set; }
        public virtual DbSet<AccountType> AccountType { get; set; }
        public virtual DbSet<Action> Action { get; set; }
        public virtual DbSet<ActionPolicy> ActionPolicy { get; set; }
        public virtual DbSet<Bank> Bank { get; set; }
        public virtual DbSet<BankBranch> BankBranch { get; set; }
        public virtual DbSet<Branch> Branch { get; set; }
        public virtual DbSet<BranchType> BranchType { get; set; }
        public virtual DbSet<CommodityType> CommodityType { get; set; }
        public virtual DbSet<Component> Component { get; set; }
        public virtual DbSet<ComponentGroup> ComponentGroup { get; set; }
        public virtual DbSet<Container> Container { get; set; }
        public virtual DbSet<ContainerRange> ContainerRange { get; set; }
        public virtual DbSet<ContainerType> ContainerType { get; set; }
        public virtual DbSet<Contract> Contract { get; set; }
        public virtual DbSet<Coordination> Coordination { get; set; }
        public virtual DbSet<CoordinationDetail> CoordinationDetail { get; set; }
        public virtual DbSet<Currency> Currency { get; set; }
        public virtual DbSet<Customer> Customer { get; set; }
        public virtual DbSet<CustomerCare> CustomerCare { get; set; }
        public virtual DbSet<CustomerCareLog> CustomerCareLog { get; set; }
        public virtual DbSet<CustomerGroup> CustomerGroup { get; set; }
        public virtual DbSet<Department> Department { get; set; }
        public virtual DbSet<DistanceRange> DistanceRange { get; set; }
        public virtual DbSet<Entity> Entity { get; set; }
        public virtual DbSet<EntityPolicy> EntityPolicy { get; set; }
        public virtual DbSet<Feature> Feature { get; set; }
        public virtual DbSet<FeaturePolicy> FeaturePolicy { get; set; }
        public virtual DbSet<FreightState> FreightState { get; set; }
        public virtual DbSet<FuelType> FuelType { get; set; }
        public virtual DbSet<GridPolicy> GridPolicy { get; set; }
        public virtual DbSet<GroupMember> GroupMember { get; set; }
        public virtual DbSet<GroupRole> GroupRole { get; set; }
        public virtual DbSet<Ledger> Ledger { get; set; }
        public virtual DbSet<MaintenanceTicket> MaintenanceTicket { get; set; }
        public virtual DbSet<MasterData> MasterData { get; set; }
        public virtual DbSet<Nationality> Nationality { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<OrderComposition> OrderComposition { get; set; }
        public virtual DbSet<OrderDetail> OrderDetail { get; set; }
        public virtual DbSet<PaymentPolicy> PaymentPolicy { get; set; }
        public virtual DbSet<Policy> Policy { get; set; }
        public virtual DbSet<PriceType> PriceType { get; set; }
        public virtual DbSet<Quotation> Quotation { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<StackDirection> StackDirection { get; set; }
        public virtual DbSet<StatePolicy> StatePolicy { get; set; }
        public virtual DbSet<StateType> StateType { get; set; }
        public virtual DbSet<Surcharge> Surcharge { get; set; }
        public virtual DbSet<SurchargeType> SurchargeType { get; set; }
        public virtual DbSet<TaskState> TaskState { get; set; }
        public virtual DbSet<Terminal> Terminal { get; set; }
        public virtual DbSet<TicketState> TicketState { get; set; }
        public virtual DbSet<Timebox> Timebox { get; set; }
        public virtual DbSet<Transition> Transition { get; set; }
        public virtual DbSet<TransitionAction> TransitionAction { get; set; }
        public virtual DbSet<Truck> Truck { get; set; }
        public virtual DbSet<TruckMaintenance> TruckMaintenance { get; set; }
        public virtual DbSet<TruckMaintenanceDetail> TruckMaintenanceDetail { get; set; }
        public virtual DbSet<TruckMonitorConfig> TruckMonitorConfig { get; set; }
        public virtual DbSet<TruckType> TruckType { get; set; }
        public virtual DbSet<UoM> UoM { get; set; }
        public virtual DbSet<UomType> UomType { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<Vendor> Vendor { get; set; }
        public virtual DbSet<VendorType> VendorType { get; set; }
        public virtual DbSet<VolumeRange> VolumeRange { get; set; }
        public virtual DbSet<WeightRange> WeightRange { get; set; }
        public virtual DbSet<Workflow> Workflow { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=tcp:nhan.database.windows.net;Initial Catalog=TMS;user id=nhan;password=Testing)(&*;MultipleActiveResultSets=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.6-servicing-10079");

            modelBuilder.Entity<Accessory>(entity =>
            {
                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.Price).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.Version)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.Branch)
                    .WithMany(p => p.Accessory)
                    .HasForeignKey(d => d.BranchId)
                    .HasConstraintName("FK_Accessory_Branch");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.AccessoryInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Accessory_UserInserted");

                entity.HasOne(d => d.Truck)
                    .WithMany(p => p.Accessory)
                    .HasForeignKey(d => d.TruckId)
                    .HasConstraintName("FK_Accessory_Truck");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.AccessoryUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Accessory_UserUpdated");

                entity.HasOne(d => d.Vendor)
                    .WithMany(p => p.Accessory)
                    .HasForeignKey(d => d.VendorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Accessary_Vendor");
            });

            modelBuilder.Entity<AccountType>(entity =>
            {
                entity.Property(e => e.AccountNo)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.AccountTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OperationType_UserInserted");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_OperationType_Hierarchy");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.AccountTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_OperationType_UserUpdated");
            });

            modelBuilder.Entity<Action>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.ActionInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Action_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.ActionUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Action_UserUpdated");
            });

            modelBuilder.Entity<ActionPolicy>(entity =>
            {
                entity.HasOne(d => d.Action)
                    .WithMany(p => p.ActionPolicy)
                    .HasForeignKey(d => d.ActionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ActionPolicy_Action");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.ActionPolicyInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ActionPolicy_UserInserted");

                entity.HasOne(d => d.Policy)
                    .WithMany(p => p.ActionPolicy)
                    .HasForeignKey(d => d.PolicyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ActionPolicy_Policy");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.ActionPolicyUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_ActionPolicy_User");
            });

            modelBuilder.Entity<Bank>(entity =>
            {
                entity.Property(e => e.FullName).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.BankInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Bank_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.BankUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Bank_UserUpdated");
            });

            modelBuilder.Entity<BankBranch>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Address).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.Bank)
                    .WithMany(p => p.BankBranch)
                    .HasForeignKey(d => d.BankId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BankBranch_Bank");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.BankBranchInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BankBranch_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.BankBranchUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_BankBranch_UserUpdated");
            });

            modelBuilder.Entity<Branch>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.BranchType)
                    .WithMany(p => p.Branch)
                    .HasForeignKey(d => d.BranchTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Branch_BranchType");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.BranchInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Branch_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.BranchUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Branch_UserUpdated");
            });

            modelBuilder.Entity<BranchType>(entity =>
            {
                entity.Property(e => e.Desciption).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.BranchTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BranchType_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.BranchTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_BranchType_UserUpdated");
            });

            modelBuilder.Entity<CommodityType>(entity =>
            {
                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.CommodityTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CommodityType_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.CommodityTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_CommodityType_UserUpdated");
            });

            modelBuilder.Entity<Component>(entity =>
            {
                entity.Property(e => e.CascadeField)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ClassName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ComponentType)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DataSourceFilter)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Events)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.FieldName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FormatData).HasMaxLength(250);

                entity.Property(e => e.FormatEntity).HasMaxLength(250);

                entity.Property(e => e.GroupBy)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.GroupFormat).HasMaxLength(500);

                entity.Property(e => e.HotKey)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Icon)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Label).HasMaxLength(50);

                entity.Property(e => e.MaxWidth)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.MinWidth)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.PopulateField)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Renderer)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Style)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Validation).HasMaxLength(1000);

                entity.Property(e => e.Width)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.ComponentGroup)
                    .WithMany(p => p.Component)
                    .HasForeignKey(d => d.ComponentGroupId)
                    .HasConstraintName("FK_Component_ComponentGroup");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.ComponentInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Component_UserInserted");

                entity.HasOne(d => d.Policy)
                    .WithMany(p => p.Component)
                    .HasForeignKey(d => d.PolicyId)
                    .HasConstraintName("FK_Component_Policy");

                entity.HasOne(d => d.Reference)
                    .WithMany(p => p.Component)
                    .HasForeignKey(d => d.ReferenceId)
                    .HasConstraintName("FK_Component_Entity");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.Component)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_Component_FreightState");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.ComponentUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Component_UserUpdated");
            });

            modelBuilder.Entity<ComponentGroup>(entity =>
            {
                entity.Property(e => e.ClassName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.Style)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.TabGroup)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Width)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.Feature)
                    .WithMany(p => p.ComponentGroup)
                    .HasForeignKey(d => d.FeatureId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ComponentGroup_Feature");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.ComponentGroupInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ComponentGroup_UserInserted");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_ComponentGroup_ComponentGroup");

                entity.HasOne(d => d.Policy)
                    .WithMany(p => p.ComponentGroup)
                    .HasForeignKey(d => d.PolicyId)
                    .HasConstraintName("FK_ComponentGroup_Policy");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.ComponentGroup)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_ComponentGroup_FreightState");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.ComponentGroupUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_ComponentGroup_UserUpdated");
            });

            modelBuilder.Entity<Container>(entity =>
            {
                entity.Property(e => e.AdvancedPaid).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.InUse).HasDefaultValueSql("((0))");

                entity.Property(e => e.PeriodPayment).HasColumnType("decimal(20, 5)");

                entity.HasOne(d => d.FreightState)
                    .WithMany(p => p.Container)
                    .HasForeignKey(d => d.FreightStateId)
                    .HasConstraintName("FK_Container_FreightState");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.ContainerInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Container_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.ContainerUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Container_UserUpdated");

                entity.HasOne(d => d.Vendor)
                    .WithMany(p => p.Container)
                    .HasForeignKey(d => d.VendorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Container_Vendor");
            });

            modelBuilder.Entity<ContainerRange>(entity =>
            {
                entity.Property(e => e.Note).HasMaxLength(500);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.ContainerRangeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ContainerRange_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.ContainerRangeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_ContainerRange_UserUpdated");
            });

            modelBuilder.Entity<ContainerType>(entity =>
            {
                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.ContainerTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ContainerType_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.ContainerTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_ContainerType_UserUpdated");
            });

            modelBuilder.Entity<Contract>(entity =>
            {
                entity.Property(e => e.Currency)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.ContractInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Contract_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.ContractUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Contract_UserUpdated");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ContractUser)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Contract_User");
            });

            modelBuilder.Entity<Coordination>(entity =>
            {
                entity.Property(e => e.Distance).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.Note).HasMaxLength(2000);

                entity.Property(e => e.Volume).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.Weight).HasColumnType("decimal(20, 5)");

                entity.HasOne(d => d.CommodityType)
                    .WithMany(p => p.Coordination)
                    .HasForeignKey(d => d.CommodityTypeId)
                    .HasConstraintName("FK_Coordination_CommodityType");

                entity.HasOne(d => d.ContainerType)
                    .WithMany(p => p.Coordination)
                    .HasForeignKey(d => d.ContainerTypeId)
                    .HasConstraintName("FK_Coordination_Container");

                entity.HasOne(d => d.EmptyContFrom)
                    .WithMany(p => p.CoordinationEmptyContFrom)
                    .HasForeignKey(d => d.EmptyContFromId)
                    .HasConstraintName("FK_Coordination_Terminal_EmptyContFrom");

                entity.HasOne(d => d.EmptyContTo)
                    .WithMany(p => p.CoordinationEmptyContTo)
                    .HasForeignKey(d => d.EmptyContToId)
                    .HasConstraintName("FK_Coordination_Terminal_EmptyContTo");

                entity.HasOne(d => d.FreightState)
                    .WithMany(p => p.Coordination)
                    .HasForeignKey(d => d.FreightStateId)
                    .HasConstraintName("FK_Coordination_FreightState");

                entity.HasOne(d => d.From)
                    .WithMany(p => p.CoordinationFrom)
                    .HasForeignKey(d => d.FromId)
                    .HasConstraintName("FK_Coordination_TerminalFrom");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.CoordinationInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Coordination_UserInserted");

                entity.HasOne(d => d.TaskState)
                    .WithMany(p => p.Coordination)
                    .HasForeignKey(d => d.TaskStateId)
                    .HasConstraintName("FK_Coordination_TaskState");

                entity.HasOne(d => d.Timebox)
                    .WithMany(p => p.Coordination)
                    .HasForeignKey(d => d.TimeboxId)
                    .HasConstraintName("FK_Coordination_Timebox");

                entity.HasOne(d => d.To)
                    .WithMany(p => p.CoordinationTo)
                    .HasForeignKey(d => d.ToId)
                    .HasConstraintName("FK_Coordination_TerminalTo");

                entity.HasOne(d => d.TruckType)
                    .WithMany(p => p.Coordination)
                    .HasForeignKey(d => d.TruckTypeId)
                    .HasConstraintName("FK_Coordination_TruckType");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.CoordinationUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Coordination_UserUpdated");
            });

            modelBuilder.Entity<CoordinationDetail>(entity =>
            {
                entity.Property(e => e.Note).HasMaxLength(2000);

                entity.Property(e => e.PackageImages).IsUnicode(false);

                entity.Property(e => e.SurchargeImages).IsUnicode(false);

                entity.HasOne(d => d.Container)
                    .WithMany(p => p.CoordinationDetail)
                    .HasForeignKey(d => d.ContainerId)
                    .HasConstraintName("FK_CoordinationDetail_Container");

                entity.HasOne(d => d.Coordination)
                    .WithMany(p => p.CoordinationDetail)
                    .HasForeignKey(d => d.CoordinationId)
                    .HasConstraintName("FK_CoordinationDetail_Coordination");

                entity.HasOne(d => d.Driver)
                    .WithMany(p => p.CoordinationDetail)
                    .HasForeignKey(d => d.DriverId)
                    .HasConstraintName("FK_CoordinationDetail_Driver");

                entity.HasOne(d => d.FreightState)
                    .WithMany(p => p.CoordinationDetail)
                    .HasForeignKey(d => d.FreightStateId)
                    .HasConstraintName("FK_CoordinationDetail_FreightState");

                entity.HasOne(d => d.Package)
                    .WithMany(p => p.CoordinationDetail)
                    .HasForeignKey(d => d.PackageId)
                    .HasConstraintName("FK_CoordinationDetail_OrderDetail");

                entity.HasOne(d => d.Truck)
                    .WithMany(p => p.CoordinationDetail)
                    .HasForeignKey(d => d.TruckId)
                    .HasConstraintName("FK_CoordinationDetail_Truck");
            });

            modelBuilder.Entity<Currency>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description).HasMaxLength(100);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Symbol)
                    .IsRequired()
                    .HasMaxLength(4);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.CurrencyInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Currency_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.CurrencyUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Currency_UserUpdated");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.HasIndex(e => e.UserId)
                    .HasName("IX_Customer")
                    .IsUnique();

                entity.Property(e => e.Email).HasMaxLength(100);

                entity.Property(e => e.Note).HasMaxLength(200);

                entity.Property(e => e.OtherContact).HasMaxLength(100);

                entity.Property(e => e.Skype).HasMaxLength(100);

                entity.Property(e => e.Viber).HasMaxLength(100);

                entity.Property(e => e.Zalo).HasMaxLength(100);

                entity.HasOne(d => d.CustomerGroup)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.CustomerGroupId)
                    .HasConstraintName("FK_Customer_CustomerGroup");

                entity.HasOne(d => d.CustomerState)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.CustomerStateId)
                    .HasConstraintName("FK_Customer_CustomerState");

                entity.HasOne(d => d.User)
                    .WithOne(p => p.Customer)
                    .HasForeignKey<Customer>(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Customer_User");
            });

            modelBuilder.Entity<CustomerCare>(entity =>
            {
                entity.Property(e => e.Note).HasMaxLength(1500);

                entity.HasOne(d => d.AssignedUser)
                    .WithMany(p => p.CustomerCareAssignedUser)
                    .HasForeignKey(d => d.AssignedUserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CustomerCare_User");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.CustomerCare)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CustomerCare_Customer");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.CustomerCareInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CustomerCare_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.CustomerCareUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_CustomerCare_UserUpdated");
            });

            modelBuilder.Entity<CustomerCareLog>(entity =>
            {
                entity.Property(e => e.ContactDate)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasComputedColumnSql("(CONVERT([varchar](10),[InsertedDate],(111)))");

                entity.Property(e => e.ContactNumber).HasMaxLength(50);

                entity.HasOne(d => d.ContactType)
                    .WithMany(p => p.CustomerCareLog)
                    .HasForeignKey(d => d.ContactTypeId)
                    .HasConstraintName("FK_CustomerCareLog_ContactType");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.CustomerCareLog)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CustomerCareLog_Customer");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.CustomerCareLogInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CustomerCareLog_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.CustomerCareLogUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_CustomerCareLog_UserUpdated");
            });

            modelBuilder.Entity<CustomerGroup>(entity =>
            {
                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.GroupName)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.DepartmentInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Department_UserInserted");

                entity.HasOne(d => d.Leader)
                    .WithMany(p => p.DepartmentLeader)
                    .HasForeignKey(d => d.LeaderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Department_Leader");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.DepartmentUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Department_UserUpdated");
            });

            modelBuilder.Entity<DistanceRange>(entity =>
            {
                entity.Property(e => e.MaxDistance).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.MinDistance).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Note).HasMaxLength(500);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.DistanceRangeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DistanceRange_UserInserted");

                entity.HasOne(d => d.Uom)
                    .WithMany(p => p.DistanceRange)
                    .HasForeignKey(d => d.UomId)
                    .HasConstraintName("FK_DistanceRange_UoM");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.DistanceRangeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_DistanceRange_UserUpdated");
            });

            modelBuilder.Entity<Entity>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.EntityInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Entity_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.EntityUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Entity_UserUpdated");
            });

            modelBuilder.Entity<EntityPolicy>(entity =>
            {
                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.HasOne(d => d.Entity)
                    .WithMany(p => p.EntityPolicy)
                    .HasForeignKey(d => d.EntityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EntityPolicy_Entity");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.EntityPolicyInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EntityPolicy_UserInserted");

                entity.HasOne(d => d.Policy)
                    .WithMany(p => p.EntityPolicy)
                    .HasForeignKey(d => d.PolicyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EntityPolicy_Policy");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.EntityPolicyUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_EntityPolicy_UserUpdated");
            });

            modelBuilder.Entity<Feature>(entity =>
            {
                entity.HasIndex(e => e.Name)
                    .HasName("UK_Feature")
                    .IsUnique();

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.Icon)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Label).HasMaxLength(100);

                entity.Property(e => e.Name).HasMaxLength(100);

                entity.Property(e => e.ViewClass)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.HasOne(d => d.Entity)
                    .WithMany(p => p.Feature)
                    .HasForeignKey(d => d.EntityId)
                    .HasConstraintName("FK_Feature_Entity");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.Feature)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Feature_UserInserted");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_Feature_Parent");
            });

            modelBuilder.Entity<FeaturePolicy>(entity =>
            {
                entity.HasOne(d => d.Feature)
                    .WithMany(p => p.FeaturePolicy)
                    .HasForeignKey(d => d.FeatureId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FeaturePolicy_Feature");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.FeaturePolicyInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FeaturePolicy_UserInserted");

                entity.HasOne(d => d.Policy)
                    .WithMany(p => p.FeaturePolicy)
                    .HasForeignKey(d => d.PolicyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FeaturePolicy_Policy");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.FeaturePolicyUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_FeaturePolicy_UserUpdated");
            });

            modelBuilder.Entity<FreightState>(entity =>
            {
                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.FreightStateInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FreightState_UserInserted");

                entity.HasOne(d => d.StateType)
                    .WithMany(p => p.FreightState)
                    .HasForeignKey(d => d.StateTypeId)
                    .HasConstraintName("FK_FreightState_StateType");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.FreightStateUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_FreightState_UserUpdated");

                entity.HasOne(d => d.Workflow)
                    .WithMany(p => p.FreightState)
                    .HasForeignKey(d => d.WorkflowId)
                    .HasConstraintName("FK_FreightState_Workflow");
            });

            modelBuilder.Entity<FuelType>(entity =>
            {
                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.FuelTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FuelType_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.FuelTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_FuelType_UserUpdated");
            });

            modelBuilder.Entity<GridPolicy>(entity =>
            {
                entity.Property(e => e.ButtonClass)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ButtonEvent)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ButtonIcon)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.CascadeField)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Component)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DataSource)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Description).HasMaxLength(150);

                entity.Property(e => e.FieldName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FormatCell)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.FormatRow)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.GroupName).HasMaxLength(50);

                entity.Property(e => e.MaxWidth)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.MinWidth)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.PopulateField)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ShortDesc)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Summary).HasMaxLength(50);

                entity.Property(e => e.TextAlign)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Validation).HasMaxLength(1000);

                entity.Property(e => e.Width)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.Entity)
                    .WithMany(p => p.GridPolicyEntity)
                    .HasForeignKey(d => d.EntityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GridPolicy_Entity");

                entity.HasOne(d => d.Feature)
                    .WithMany(p => p.GridPolicy)
                    .HasForeignKey(d => d.FeatureId)
                    .HasConstraintName("FK_GridPolicy_Feature");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.GridPolicyInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GridPolicy_UserInserted");

                entity.HasOne(d => d.Policy)
                    .WithMany(p => p.GridPolicy)
                    .HasForeignKey(d => d.PolicyId)
                    .HasConstraintName("FK_GridPolicy_Policy");

                entity.HasOne(d => d.Reference)
                    .WithMany(p => p.GridPolicyReference)
                    .HasForeignKey(d => d.ReferenceId)
                    .HasConstraintName("FK_GridPolicy_RefEntity");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.GridPolicy)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_GridPolicy_FreightState");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.GridPolicyUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_GridPolicy_UserUpdated");
            });

            modelBuilder.Entity<GroupMember>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(200);

                entity.HasOne(d => d.GroupRole)
                    .WithMany(p => p.GroupMember)
                    .HasForeignKey(d => d.GroupRoleId);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.GroupMemberInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.GroupMember)
                    .HasForeignKey(d => d.RoleId);

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.GroupMemberUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy);
            });

            modelBuilder.Entity<GroupRole>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.GroupRoleInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupRole_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.GroupRoleUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_GroupRole_UserUpdated");
            });

            modelBuilder.Entity<Ledger>(entity =>
            {
                entity.Property(e => e.Credit)
                    .HasColumnType("decimal(38, 7)")
                    .HasComputedColumnSql("([OriginCredit]*[ExchangeRate])");

                entity.Property(e => e.Debit)
                    .HasColumnType("decimal(38, 7)")
                    .HasComputedColumnSql("([OriginDebit]*[ExchangeRate])");

                entity.Property(e => e.ExchangeRate).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.InvoiceImage).HasMaxLength(1500);

                entity.Property(e => e.InvoiceNo).HasMaxLength(20);

                entity.Property(e => e.Note).HasMaxLength(1500);

                entity.Property(e => e.OpeningCredit)
                    .HasColumnType("decimal(38, 7)")
                    .HasComputedColumnSql("([OriginOpeningCredit]*[ExchangeRate])");

                entity.Property(e => e.OpeningDebit)
                    .HasColumnType("decimal(38, 7)")
                    .HasComputedColumnSql("([OriginOpeningDebit]*[ExchangeRate])");

                entity.Property(e => e.OriginCredit).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.OriginDebit).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.OriginMoney).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.OriginOpeningCredit).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.OriginOpeningDebit).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.OriginOpeningMoney).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.ReceivedAccount)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ReceiverFullName).HasMaxLength(100);

                entity.HasOne(d => d.AccountType)
                    .WithMany(p => p.LedgerAccountType)
                    .HasForeignKey(d => d.AccountTypeId)
                    .HasConstraintName("FK_Ledger_DebitAccount");

                entity.HasOne(d => d.Approver)
                    .WithMany(p => p.LedgerApprover)
                    .HasForeignKey(d => d.ApproverId)
                    .HasConstraintName("FK_Ledger_UserApprover");

                entity.HasOne(d => d.CreditAccount)
                    .WithMany(p => p.LedgerCreditAccount)
                    .HasForeignKey(d => d.CreditAccountId)
                    .HasConstraintName("FK_Ledger_CreditAccount");

                entity.HasOne(d => d.Currency)
                    .WithMany(p => p.Ledger)
                    .HasForeignKey(d => d.CurrencyId)
                    .HasConstraintName("FK_Ledger_Currency");

                entity.HasOne(d => d.Entity)
                    .WithMany(p => p.Ledger)
                    .HasForeignKey(d => d.EntityId)
                    .HasConstraintName("FK_Ledger_Entity");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.LedgerInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Ledger_UserInserted");

                entity.HasOne(d => d.ReceiverBankBranch)
                    .WithMany(p => p.Ledger)
                    .HasForeignKey(d => d.ReceiverBankBranchId)
                    .HasConstraintName("FK_Ledger_BankBranch");

                entity.HasOne(d => d.ReceiverBank)
                    .WithMany(p => p.Ledger)
                    .HasForeignKey(d => d.ReceiverBankId)
                    .HasConstraintName("FK_Ledger_Bank");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.LedgerUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Ledger_UserUpdated");
            });

            modelBuilder.Entity<MaintenanceTicket>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.HasOne(d => d.Accessory)
                    .WithMany(p => p.MaintenanceTicket)
                    .HasForeignKey(d => d.AccessoryId)
                    .HasConstraintName("FK_MaintenanceTicket_Accessory");

                entity.HasOne(d => d.Assignee)
                    .WithMany(p => p.MaintenanceTicketAssignee)
                    .HasForeignKey(d => d.AssigneeId)
                    .HasConstraintName("FK_MaintenanceTicket_Assignee");

                entity.HasOne(d => d.Container)
                    .WithMany(p => p.MaintenanceTicket)
                    .HasForeignKey(d => d.ContainerId)
                    .HasConstraintName("FK_MaintenanceTicket_Container");

                entity.HasOne(d => d.GroupRole)
                    .WithMany(p => p.MaintenanceTicket)
                    .HasForeignKey(d => d.GroupRoleId)
                    .HasConstraintName("FK_MaintenanceTicket_GroupRole");

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.MaintenanceTicket)
                    .HasForeignKey<MaintenanceTicket>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MaintenanceTicket_TicketState");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.MaintenanceTicketInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MaintenanceTicket_UserInserted");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.MaintenanceTicket)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_MaintenanceTicket_Role");

                entity.HasOne(d => d.Truck)
                    .WithMany(p => p.MaintenanceTicket)
                    .HasForeignKey(d => d.TruckId)
                    .HasConstraintName("FK_MaintenanceTicket_Truck");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.MaintenanceTicketUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_MaintenanceTicket_UserUpdated");
            });

            modelBuilder.Entity<MasterData>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.MasterDataInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MasterData_UserInserted");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_MasterData_MasterData");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.MasterDataUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_MasterData_UserUpdated");
            });

            modelBuilder.Entity<Nationality>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.NationalityIdNavigation)
                    .HasForeignKey<Nationality>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Nationality_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.NationalityUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Nationality_UserUpdated");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.AdvancedPaid).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.ContactAddress).HasMaxLength(200);

                entity.Property(e => e.ContactFirstName).HasMaxLength(50);

                entity.Property(e => e.ContactLastName).HasMaxLength(100);

                entity.Property(e => e.ContactNumber)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ContactPassport)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ContactSsn)
                    .HasColumnName("ContactSSN")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DiscountMoney).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.DiscountPercentage).HasColumnType("decimal(4, 2)");

                entity.Property(e => e.Note).HasMaxLength(2000);

                entity.Property(e => e.TotalPriceAfterDiscount).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.TotalPriceAfterTax).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.TotalPriceBeforeDiscount).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.Vat).HasColumnType("decimal(4, 2)");

                entity.HasOne(d => d.AccountableDepartment)
                    .WithMany(p => p.Order)
                    .HasForeignKey(d => d.AccountableDepartmentId)
                    .HasConstraintName("FK_Order_Department_Accountable");

                entity.HasOne(d => d.AccountableUser)
                    .WithMany(p => p.OrderAccountableUser)
                    .HasForeignKey(d => d.AccountableUserId)
                    .HasConstraintName("FK_Order_User_Accountable");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Order)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK_Order_Customer");

                entity.HasOne(d => d.FreightState)
                    .WithMany(p => p.Order)
                    .HasForeignKey(d => d.FreightStateId)
                    .HasConstraintName("FK_Order_FreightState");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.OrderInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Order_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.OrderUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Order_UserUpdated");
            });

            modelBuilder.Entity<OrderComposition>(entity =>
            {
                entity.HasOne(d => d.Coordination)
                    .WithMany(p => p.OrderComposition)
                    .HasForeignKey(d => d.CoordinationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderComposition_Coordination");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.OrderCompositionInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderComposition_UserInserted");

                entity.HasOne(d => d.OrderDetail)
                    .WithMany(p => p.OrderComposition)
                    .HasForeignKey(d => d.OrderDetailId)
                    .HasConstraintName("FK_OrderComposition_OrderDetail");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.OrderCompositionUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_OrderComposition_UserUpdated");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.Property(e => e.BoxHeight).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.BoxLength).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.BoxVolume)
                    .HasColumnType("decimal(18, 2)")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.BoxWeight)
                    .HasColumnType("decimal(18, 2)")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.BoxWidth).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.DiscountMoney).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.DiscountPercentage).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.GoodsName).HasMaxLength(50);

                entity.Property(e => e.Note).HasMaxLength(1000);

                entity.Property(e => e.TotalDiscountAfterTax).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.TotalPriceAfterDiscount).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.TotalPriceBeforeDiscount).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.TotalVolume).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.TotalWeight).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.TransportDistance).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Vat).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.CommodityType)
                    .WithMany(p => p.OrderDetail)
                    .HasForeignKey(d => d.CommodityTypeId)
                    .HasConstraintName("FK_OrderDetail_CommodityType");

                entity.HasOne(d => d.ContainerType)
                    .WithMany(p => p.OrderDetail)
                    .HasForeignKey(d => d.ContainerTypeId)
                    .HasConstraintName("FK_OrderDetail_ContainerType");

                entity.HasOne(d => d.EmptyContFrom)
                    .WithMany(p => p.OrderDetailEmptyContFrom)
                    .HasForeignKey(d => d.EmptyContFromId)
                    .HasConstraintName("FK_OrderDetail_Terminal_EmptyContFrom");

                entity.HasOne(d => d.EmptyContTo)
                    .WithMany(p => p.OrderDetailEmptyContTo)
                    .HasForeignKey(d => d.EmptyContToId)
                    .HasConstraintName("FK_OrderDetail_Terminal_EmptyContTo");

                entity.HasOne(d => d.From)
                    .WithMany(p => p.OrderDetailFrom)
                    .HasForeignKey(d => d.FromId)
                    .HasConstraintName("FK_OrderDetail_Terminal_From");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.OrderDetailInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderDetail_UserInserted");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetail)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderDetail_Order");

                entity.HasOne(d => d.Quotation)
                    .WithMany(p => p.OrderDetail)
                    .HasForeignKey(d => d.QuotationId)
                    .HasConstraintName("FK_OrderDetail_Quotation");

                entity.HasOne(d => d.StackDirection)
                    .WithMany(p => p.OrderDetail)
                    .HasForeignKey(d => d.StackDirectionId)
                    .HasConstraintName("FK_OrderDetail_StackDirection");

                entity.HasOne(d => d.Timebox)
                    .WithMany(p => p.OrderDetail)
                    .HasForeignKey(d => d.TimeboxId)
                    .HasConstraintName("FK_OrderDetail_Timebox");

                entity.HasOne(d => d.To)
                    .WithMany(p => p.OrderDetailTo)
                    .HasForeignKey(d => d.ToId)
                    .HasConstraintName("FK_OrderDetail_Terminal_To");

                entity.HasOne(d => d.TruckType)
                    .WithMany(p => p.OrderDetail)
                    .HasForeignKey(d => d.TruckTypeId)
                    .HasConstraintName("FK_OrderDetail_TruckType");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.OrderDetailUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_OrderDetail_UserUpdated");

                entity.HasOne(d => d.Vendor)
                    .WithMany(p => p.OrderDetail)
                    .HasForeignKey(d => d.VendorId)
                    .HasConstraintName("FK_OrderDetail_Vendor");
            });

            modelBuilder.Entity<PaymentPolicy>(entity =>
            {
                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.PaymentPolicyInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ApprovalConfig_UserInserted");

                entity.HasOne(d => d.Policy)
                    .WithMany(p => p.PaymentPolicy)
                    .HasForeignKey(d => d.PolicyId)
                    .HasConstraintName("FK_PaymentPolicy_Policy");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.PaymentPolicyUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_ApprovalConfig_UserUpdated");
            });

            modelBuilder.Entity<Policy>(entity =>
            {
                entity.Property(e => e.ExcludedGroupRole).IsUnicode(false);

                entity.Property(e => e.ExcludedUserIds).IsUnicode(false);

                entity.Property(e => e.IncludedGroupRole).IsUnicode(false);

                entity.Property(e => e.IncludedUser).IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(150);
            });

            modelBuilder.Entity<PriceType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.PriceTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PriceType_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.PriceTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_PriceType_UserUpdated");
            });

            modelBuilder.Entity<Quotation>(entity =>
            {
                entity.Property(e => e.ContainerRangeId).HasDefaultValueSql("((0))");

                entity.Property(e => e.Price).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.Vat)
                    .HasColumnName("VAT")
                    .HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.CommodityType)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.CommodityTypeId)
                    .HasConstraintName("FK_Quotation_CommodityType");

                entity.HasOne(d => d.ContainerRange)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.ContainerRangeId)
                    .HasConstraintName("FK_Quotation_ContainerRange");

                entity.HasOne(d => d.ContainerType)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.ContainerTypeId)
                    .HasConstraintName("FK_Quotation_ContainerType");

                entity.HasOne(d => d.Currency)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.CurrencyId)
                    .HasConstraintName("FK_Quotation_Currency");

                entity.HasOne(d => d.CustomerGroup)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.CustomerGroupId)
                    .HasConstraintName("FK_Quotation_CustomerGroup");

                entity.HasOne(d => d.DistanceRange)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.DistanceRangeId)
                    .HasConstraintName("FK_Quotation_DistanceRange");

                entity.HasOne(d => d.EmptyContFrom)
                    .WithMany(p => p.QuotationEmptyContFrom)
                    .HasForeignKey(d => d.EmptyContFromId)
                    .HasConstraintName("FK_Quotation_TerminalEmptyContFrom");

                entity.HasOne(d => d.EmptyContTo)
                    .WithMany(p => p.QuotationEmptyContTo)
                    .HasForeignKey(d => d.EmptyContToId)
                    .HasConstraintName("FK_Quotation_TerminalEmptyContTo");

                entity.HasOne(d => d.From)
                    .WithMany(p => p.QuotationFrom)
                    .HasForeignKey(d => d.FromId)
                    .HasConstraintName("FK_Quotation_TerminalFrom");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.QuotationInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Quotation_UserInserted");

                entity.HasOne(d => d.PriceType)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.PriceTypeId)
                    .HasConstraintName("FK_Quotation_PriceType");

                entity.HasOne(d => d.Timebox)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.TimeboxId)
                    .HasConstraintName("FK_Quotation_Timebox");

                entity.HasOne(d => d.To)
                    .WithMany(p => p.QuotationTo)
                    .HasForeignKey(d => d.ToId)
                    .HasConstraintName("FK_Quotation_TerminalTo");

                entity.HasOne(d => d.TruckType)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.TruckTypeId)
                    .HasConstraintName("FK_Quotation_TruckType");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.QuotationUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Quotation_UserUpdated");

                entity.HasOne(d => d.Vendor)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.VendorId)
                    .HasConstraintName("FK_Quotation_Vendor");

                entity.HasOne(d => d.VolumeRange)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.VolumeRangeId)
                    .HasConstraintName("FK_Quotation_VolumeRange");

                entity.HasOne(d => d.WeightRange)
                    .WithMany(p => p.Quotation)
                    .HasForeignKey(d => d.WeightRangeId)
                    .HasConstraintName("FK_Quotation_WeightRange");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(100);

                entity.Property(e => e.RoleName)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<StackDirection>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Name).HasMaxLength(20);
            });

            modelBuilder.Entity<StatePolicy>(entity =>
            {
                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.StatePolicyInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StatePolicy_UserInserted");

                entity.HasOne(d => d.Policy)
                    .WithMany(p => p.StatePolicy)
                    .HasForeignKey(d => d.PolicyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StatePolicy_Policy");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.StatePolicy)
                    .HasForeignKey(d => d.StateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StatePolicy_State");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.StatePolicyUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_StatePolicy_UserUpdated");
            });

            modelBuilder.Entity<StateType>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(150);

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.StateTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_StateType_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.StateTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_StateType_UserUpdated");
            });

            modelBuilder.Entity<Surcharge>(entity =>
            {
                entity.Property(e => e.Note).HasMaxLength(200);

                entity.Property(e => e.PriceAfterTax).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.Quantity).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.UnitPrice).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.Vat).HasColumnType("decimal(4, 2)");

                entity.HasOne(d => d.CoordinationDetail)
                    .WithMany(p => p.Surcharge)
                    .HasForeignKey(d => d.CoordinationDetailId)
                    .HasConstraintName("FK_Surcharge_CoordinationDetail");

                entity.HasOne(d => d.Currency)
                    .WithMany(p => p.Surcharge)
                    .HasForeignKey(d => d.CurrencyId)
                    .HasConstraintName("FK_Surcharge_Currency");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.SurchargeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Surcharge_UserInserted");

                entity.HasOne(d => d.OrderDetail)
                    .WithMany(p => p.Surcharge)
                    .HasForeignKey(d => d.OrderDetailId)
                    .HasConstraintName("FK_Surcharge_OrderDetail");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Surcharge)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Surcharge_Order");

                entity.HasOne(d => d.PriceType)
                    .WithMany(p => p.Surcharge)
                    .HasForeignKey(d => d.PriceTypeId)
                    .HasConstraintName("FK_Surcharge_PriceType");

                entity.HasOne(d => d.SurchargeType)
                    .WithMany(p => p.Surcharge)
                    .HasForeignKey(d => d.SurchargeTypeId)
                    .HasConstraintName("FK_Surcharge_SurchargeType");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.SurchargeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Surcharge_UserUpdated");
            });

            modelBuilder.Entity<SurchargeType>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.UnitPrice).HasColumnType("decimal(20, 5)");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.SurchargeTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SurchargeType_UserInserted");

                entity.HasOne(d => d.PriceType)
                    .WithMany(p => p.SurchargeType)
                    .HasForeignKey(d => d.PriceTypeId)
                    .HasConstraintName("FK_SurchargeType_PriceType");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.SurchargeTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_SurchargeType_UserUpdated");
            });

            modelBuilder.Entity<TaskState>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.TaskStateInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TaskState_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.TaskStateUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_TaskState_UserUpdated");
            });

            modelBuilder.Entity<Terminal>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.ContactFirstName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.ContactLastName)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.ContactNumber)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FullName)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.ShortName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.TerminalIdNavigation)
                    .HasForeignKey<Terminal>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Terminal_UserInserted");

                entity.HasOne(d => d.Nationality)
                    .WithMany(p => p.Terminal)
                    .HasForeignKey(d => d.NationalityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Terminal_Nationality");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.TerminalUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Terminal_UserUpdated");
            });

            modelBuilder.Entity<TicketState>(entity =>
            {
                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.TicketStateInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TicketState_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.TicketStateUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_TicketState_UserUpdated");
            });

            modelBuilder.Entity<Timebox>(entity =>
            {
                entity.Property(e => e.TimeboxEnd)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.TimeboxStart)
                    .IsRequired()
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.TimeboxInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Timebox_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.TimeboxUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Timebox_UserUpdated");
            });

            modelBuilder.Entity<Transition>(entity =>
            {
                entity.HasOne(d => d.CurrentState)
                    .WithMany(p => p.TransitionCurrentState)
                    .HasForeignKey(d => d.CurrentStateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Transition_FreightStateCurrent");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.TransitionInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Transition_UserInserted");

                entity.HasOne(d => d.NextState)
                    .WithMany(p => p.TransitionNextState)
                    .HasForeignKey(d => d.NextStateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Transition_FreightStateNext");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.TransitionUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_Transition_UserUpdated");

                entity.HasOne(d => d.Workflow)
                    .WithMany(p => p.Transition)
                    .HasForeignKey(d => d.WorkflowId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Transition_Workflow");
            });

            modelBuilder.Entity<TransitionAction>(entity =>
            {
                entity.HasOne(d => d.Action)
                    .WithMany(p => p.TransitionAction)
                    .HasForeignKey(d => d.ActionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TransitionAction_Action");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.TransitionActionInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TransitionAction_UserInserted");

                entity.HasOne(d => d.Transition)
                    .WithMany(p => p.TransitionAction)
                    .HasForeignKey(d => d.TransitionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TransitionAction_Transition");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.TransitionActionUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_TransitionAction_UserUpdated");
            });

            modelBuilder.Entity<Truck>(entity =>
            {
                entity.Property(e => e.Color).HasMaxLength(50);

                entity.Property(e => e.Image)
                    .HasMaxLength(1500)
                    .IsUnicode(false);

                entity.Property(e => e.MaxCbm).HasColumnName("MaxCBM");

                entity.Property(e => e.Model).HasMaxLength(50);

                entity.Property(e => e.Note).HasMaxLength(1500);

                entity.Property(e => e.PlateRenewal)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Price).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.TruckPlate)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Vin)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Year).HasColumnType("decimal(4, 0)");

                entity.HasOne(d => d.Branch)
                    .WithMany(p => p.Truck)
                    .HasForeignKey(d => d.BranchId)
                    .HasConstraintName("FK_Truck_Branch");

                entity.HasOne(d => d.Currency)
                    .WithMany(p => p.Truck)
                    .HasForeignKey(d => d.CurrencyId)
                    .HasConstraintName("FK_Truck_Currency");

                entity.HasOne(d => d.FuelType)
                    .WithMany(p => p.Truck)
                    .HasForeignKey(d => d.FuelTypeId)
                    .HasConstraintName("FK_Truck_FuelType");

                entity.HasOne(d => d.MasterData)
                    .WithMany(p => p.Truck)
                    .HasForeignKey(d => d.MasterDataId)
                    .HasConstraintName("FK_Truck_TruckType");

                entity.HasOne(d => d.Vendor)
                    .WithMany(p => p.Truck)
                    .HasForeignKey(d => d.VendorId)
                    .HasConstraintName("FK_Truck_Vendor");
            });

            modelBuilder.Entity<TruckMaintenance>(entity =>
            {
                entity.Property(e => e.AdvancedPaid).HasColumnType("decimal(20, 5)");

                entity.HasOne(d => d.AccountableUser)
                    .WithMany(p => p.TruckMaintenanceAccountableUser)
                    .HasForeignKey(d => d.AccountableUserId)
                    .HasConstraintName("FK_TruckMaintenance_UserAccountable");

                entity.HasOne(d => d.Currency)
                    .WithMany(p => p.TruckMaintenance)
                    .HasForeignKey(d => d.CurrencyId)
                    .HasConstraintName("FK_TruckMaintenance_Currency");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.TruckMaintenanceInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TruckMaintenance_UserInserted");

                entity.HasOne(d => d.Ticket)
                    .WithMany(p => p.TruckMaintenance)
                    .HasForeignKey(d => d.TicketId)
                    .HasConstraintName("FK_TruckMaintenance_MaintenanceTicket");

                entity.HasOne(d => d.Truck)
                    .WithMany(p => p.TruckMaintenance)
                    .HasForeignKey(d => d.TruckId)
                    .HasConstraintName("FK_TruckMaintenance_Truck");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.TruckMaintenanceUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_TruckMaintenance_UserUpdated");

                entity.HasOne(d => d.Vendor)
                    .WithMany(p => p.TruckMaintenance)
                    .HasForeignKey(d => d.VendorId)
                    .HasConstraintName("FK_TruckMaintenance_Vendor");
            });

            modelBuilder.Entity<TruckMaintenanceDetail>(entity =>
            {
                entity.Property(e => e.Detail).HasMaxLength(200);

                entity.Property(e => e.Price).HasColumnType("decimal(20, 5)");

                entity.HasOne(d => d.Accessory)
                    .WithMany(p => p.TruckMaintenanceDetail)
                    .HasForeignKey(d => d.AccessoryId)
                    .HasConstraintName("FK_MaintenanceDetail_Accessory");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.TruckMaintenanceDetailInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MaintenanceDetail_UserInserted");

                entity.HasOne(d => d.Maintenance)
                    .WithMany(p => p.TruckMaintenanceDetail)
                    .HasForeignKey(d => d.MaintenanceId)
                    .HasConstraintName("FK_MaintenanceDetail_Maintenance");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.TruckMaintenanceDetailUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_MaintenanceDetail_UserUpdated");
            });

            modelBuilder.Entity<TruckMonitorConfig>(entity =>
            {
                entity.HasOne(d => d.Accessory)
                    .WithMany(p => p.TruckMonitorConfig)
                    .HasForeignKey(d => d.AccessoryId)
                    .HasConstraintName("FK_TruckMonitor_Accessory");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.TruckMonitorConfigInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TruckMonitor_UserInserted");

                entity.HasOne(d => d.Policy)
                    .WithMany(p => p.TruckMonitorConfig)
                    .HasForeignKey(d => d.PolicyId)
                    .HasConstraintName("FK_TruckMonitorConfig_Policy");

                entity.HasOne(d => d.Truck)
                    .WithMany(p => p.TruckMonitorConfig)
                    .HasForeignKey(d => d.TruckId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TruckMonitor_Truck");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.TruckMonitorConfigUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_TruckMonitor_UserUpdated");
            });

            modelBuilder.Entity<TruckType>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.TruckTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TruckType_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.TruckTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_TruckType_UserUpdated");
            });

            modelBuilder.Entity<UoM>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.UoMInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UoM_UserInserted");

                entity.HasOne(d => d.UomType)
                    .WithMany(p => p.UoM)
                    .HasForeignKey(d => d.UomTypeId)
                    .HasConstraintName("FK_UoM_UomType");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.UoMUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_UoM_UserUpdated");
            });

            modelBuilder.Entity<UomType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description).HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.UomTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UomType_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.UomTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_UomType_UserUpdated");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Address).HasMaxLength(200);

                entity.Property(e => e.Address2).HasMaxLength(200);

                entity.Property(e => e.Avatar).HasMaxLength(1000);

                entity.Property(e => e.FirstName).HasMaxLength(50);

                entity.Property(e => e.FullName)
                    .HasMaxLength(151)
                    .HasComputedColumnSql("(([FirstName]+' ')+[LastName])");

                entity.Property(e => e.LastName).HasMaxLength(100);

                entity.Property(e => e.Passport)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber2)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Ssn)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.Contract)
                    .WithMany(p => p.UserNavigation)
                    .HasForeignKey(d => d.ContractId)
                    .HasConstraintName("FK_User_Contract");

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.User)
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("FK_User_Department");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.InverseInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .HasConstraintName("FK_User_UserInserted");

                entity.HasOne(d => d.Nationality)
                    .WithMany(p => p.User)
                    .HasForeignKey(d => d.NationalityId)
                    .HasConstraintName("FK_User_Nationality");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.User)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_User_Role");

                entity.HasOne(d => d.Supervisor)
                    .WithMany(p => p.InverseSupervisor)
                    .HasForeignKey(d => d.SupervisorId);

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.InverseUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_User_UserUpdated");
            });

            modelBuilder.Entity<Vendor>(entity =>
            {
                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Address2).HasMaxLength(200);

                entity.Property(e => e.Description).IsRequired();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.PhoneNumber)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber2)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.VendorType)
                    .WithMany(p => p.Vendor)
                    .HasForeignKey(d => d.VendorTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Vendor_VendorType");
            });

            modelBuilder.Entity<VendorType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.VendorTypeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_VendorType_UserInserted");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.VendorTypeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_VendorType_UserUpdated");
            });

            modelBuilder.Entity<VolumeRange>(entity =>
            {
                entity.Property(e => e.VolumeEnd).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.VolumeStart).HasColumnType("decimal(20, 5)");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.VolumeRangeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_VolumeRange_UserInserted");

                entity.HasOne(d => d.Uom)
                    .WithMany(p => p.VolumeRange)
                    .HasForeignKey(d => d.UomId)
                    .HasConstraintName("FK_VolumeRange_UoM");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.VolumeRangeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_VolumeRange_UserUpdated");
            });

            modelBuilder.Entity<WeightRange>(entity =>
            {
                entity.Property(e => e.WeightEnd).HasColumnType("decimal(20, 5)");

                entity.Property(e => e.WeightStart).HasColumnType("decimal(20, 5)");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.WeightRangeInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WeightRange_UserInserted");

                entity.HasOne(d => d.Uom)
                    .WithMany(p => p.WeightRange)
                    .HasForeignKey(d => d.UomId)
                    .HasConstraintName("FK_WeightRange_UoM");

                entity.HasOne(d => d.UpdatedByNavigation)
                    .WithMany(p => p.WeightRangeUpdatedByNavigation)
                    .HasForeignKey(d => d.UpdatedBy)
                    .HasConstraintName("FK_WeightRange_UserUpdated");
            });

            modelBuilder.Entity<Workflow>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.Description).HasMaxLength(1000);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.WorkflowIdNavigation)
                    .HasForeignKey<Workflow>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Workflow_UserUpdated");

                entity.HasOne(d => d.InsertedByNavigation)
                    .WithMany(p => p.WorkflowInsertedByNavigation)
                    .HasForeignKey(d => d.InsertedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Workflow_UserInserted");
            });
        }
    }
}
