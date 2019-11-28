using Microsoft.AspNet.OData.Builder;
using Microsoft.AspNet.OData.Extensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OData.Edm;
using Newtonsoft.Json;
using System;
using TMS.API.Extensions;
using TMS.API.Models;

namespace TMS.API
{
    public class Startup
    {
        private readonly IConfiguration _configuration;
        
        public Startup(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc()
                .AddJsonOptions(options =>
                {
                    options.SerializerSettings.ContractResolver = new IgnoreNullOrEmptyEnumResolver();
                    options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
                    options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
                });

            services.AddDbContext<TMSContext>(options =>
            {
                options.UseSqlServer(_configuration.GetConnectionString("TMS"));
            });
            services.AddResponseCompression();
            services.AddOData();
            services.AddElasticsearch(_configuration);
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseDatabaseErrorPage();
            }
            else
            {
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseResponseCompression();
            IEdmModel model = GetEdmModel(app.ApplicationServices);
            app.UseMvc(builder =>
            {
                builder.EnableDependencyInjection();
                builder.MapODataServiceRoute("odataroute", "api", model);
                builder.Select().Expand().Filter().OrderBy().MaxTop(null).Count();
            });
            app.UseDefaultFiles();
            app.UseStaticFiles();
        }

        private IEdmModel GetEdmModel(IServiceProvider applicationServices)
        {
            var builder = new ODataConventionModelBuilder(applicationServices);
            builder.EntitySet<Accessory>(nameof(Accessory));
            builder.EntitySet<Models.Action>(nameof(Models.Action));
            builder.EntitySet<ActionPolicy>(nameof(ActionPolicy));
            builder.EntitySet<Branch>(nameof(Branch));
            builder.EntitySet<BranchType>(nameof(BranchType));
            builder.EntitySet<CommodityType>(nameof(CommodityType));
            builder.EntitySet<ComponentGroup>(nameof(ComponentGroup));
            builder.EntitySet<Container>(nameof(Container));
            builder.EntitySet<ContainerRange>(nameof(ContainerRange));
            builder.EntitySet<ContainerType>(nameof(ContainerType));
            builder.EntitySet<Contract>(nameof(Contract));
            builder.EntitySet<Coordination>(nameof(Coordination));
            builder.EntitySet<CoordinationDetail>(nameof(CoordinationDetail));
            builder.EntitySet<Currency>(nameof(Currency));
            builder.EntitySet<Customer>(nameof(Customer));
            builder.EntitySet<CustomerGroup>(nameof(CustomerGroup));
            builder.EntitySet<Department>(nameof(Department));
            builder.EntitySet<DistanceRange>(nameof(DistanceRange));
            builder.EntitySet<Entity>(nameof(Entity));
            builder.EntitySet<EntityPolicy>(nameof(EntityPolicy));
            builder.EntitySet<Feature>(nameof(Feature));
            builder.EntitySet<FeaturePolicy>(nameof(FeaturePolicy));
            builder.EntitySet<FreightState>(nameof(FreightState));
            builder.EntitySet<FreightHistory>(nameof(FreightHistory));
            builder.EntitySet<FreightProof>(nameof(FreightProof));
            builder.EntitySet<FuelType>(nameof(FuelType));
            builder.EntitySet<GridPolicy>(nameof(GridPolicy));
            builder.EntitySet<GroupMember>(nameof(GroupMember));
            builder.EntitySet<GroupRole>(nameof(GroupRole));
            builder.EntitySet<Ledger>(nameof(Ledger));
            builder.EntitySet<MaintenanceTicket>(nameof(MaintenanceTicket));
            builder.EntitySet<Nationality>(nameof(Nationality));
            builder.EntitySet<Objective>(nameof(Objective));
            builder.EntitySet<OperationType>(nameof(OperationType));
            builder.EntitySet<Order>(nameof(Order));
            builder.EntitySet<OrderComposition>(nameof(OrderComposition));
            builder.EntitySet<OrderDetail>(nameof(OrderDetail));
            builder.EntitySet<PaymentPolicy>(nameof(PaymentPolicy));
            builder.EntitySet<Policy>(nameof(Policy));
            builder.EntitySet<Quotation>(nameof(Quotation));
            builder.EntitySet<PriceType>(nameof(PriceType));
            builder.EntitySet<Role>(nameof(Role));
            builder.EntitySet<StackDirection>(nameof(StackDirection));
            builder.EntitySet<StatePolicy>(nameof(StatePolicy));
            builder.EntitySet<Surcharge>(nameof(Surcharge));
            builder.EntitySet<SurchargeType>(nameof(SurchargeType));
            builder.EntitySet<Terminal>(nameof(Terminal));
            builder.EntitySet<TicketState>(nameof(TicketState));
            builder.EntitySet<Timebox>(nameof(Timebox));
            builder.EntitySet<Transition>(nameof(Transition));
            builder.EntitySet<TransitionAction>(nameof(TransitionAction));
            builder.EntitySet<Truck>(nameof(Truck));
            builder.EntitySet<TruckMaintenance>(nameof(TruckMaintenance));
            builder.EntitySet<TruckMaintenanceDetail>(nameof(TruckMaintenanceDetail));
            builder.EntitySet<TruckMonitorConfig>(nameof(TruckMonitorConfig));
            builder.EntitySet<TruckType>(nameof(TruckType));
            builder.EntitySet<UoM>(nameof(UoM));
            builder.EntitySet<UomType>(nameof(UomType));
            builder.EntitySet<User>(nameof(User));
            builder.EntitySet<UserInterface>(nameof(UserInterface));
            builder.EntitySet<Vendor>(nameof(Vendor));
            builder.EntitySet<VendorType>(nameof(VendorType));
            builder.EntitySet<VolumeRange>(nameof(VolumeRange));
            builder.EntitySet<WeightRange>(nameof(WeightRange));
            builder.EntitySet<Workflow>(nameof(Workflow));
            return builder.GetEdmModel();
        }
    }
}
