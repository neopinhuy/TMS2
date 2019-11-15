using System;
using Microsoft.AspNet.OData.Builder;
using Microsoft.AspNet.OData.Extensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OData.Edm;
using Newtonsoft.Json;
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
                    options.SerializerSettings.ContractResolver = new IgnoreNestedResolver();
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
            builder.EntitySet<Accessory>("Accessory");
            builder.EntitySet<Models.Action>("Action");
            builder.EntitySet<ActionPolicy>("ActionPolicy");
            builder.EntitySet<Branch>("Branch");
            builder.EntitySet<BranchType>("BranchType");
            builder.EntitySet<CommodityType>("CommodityType");
            builder.EntitySet<ComponentGroup>("ComponentGroup");
            builder.EntitySet<Container>("Container");
            builder.EntitySet<ContainerRange>("ContainerRange");
            builder.EntitySet<ContainerType>("ContainerType");
            builder.EntitySet<Contract>("Contract");
            builder.EntitySet<Coordination>("Coordination");
            builder.EntitySet<Currency>("Currency");
            builder.EntitySet<Customer>("Customer");
            builder.EntitySet<CustomerGroup>("CustomerGroup");
            builder.EntitySet<Department>("Department");
            builder.EntitySet<DistanceRange>("DistanceRange");
            builder.EntitySet<Entity>("Entity");
            builder.EntitySet<EntityPolicy>("EntityPolicy");
            builder.EntitySet<Feature>("Feature");
            builder.EntitySet<FeaturePolicy>("FeaturePolicy");
            builder.EntitySet<FreightHistory>("FreightHistory");
            builder.EntitySet<FreightProof>("FreightProof");
            builder.EntitySet<FuelType>("FuelType");
            builder.EntitySet<GridPolicy>("GridPolicy");
            builder.EntitySet<GroupMember>("GroupMember");
            builder.EntitySet<GroupRole>("GroupRole");
            builder.EntitySet<Ledger>("Ledger");
            builder.EntitySet<MaintenanceTicket>("MaintenanceTicket");
            builder.EntitySet<Nationality>("Nationality");
            builder.EntitySet<Objective>("Objective");
            builder.EntitySet<OperationType>("OperationType");
            builder.EntitySet<Order>("Order");
            builder.EntitySet<OrderComposition>("OrderComposition");
            builder.EntitySet<OrderDetail>("OrderDetail");
            builder.EntitySet<PaymentPolicy>("PaymentPolicy");
            builder.EntitySet<Policy>("Policy");
            builder.EntitySet<Quotation>("Quotation");
            builder.EntitySet<QuotationType>("QuotationType");
            builder.EntitySet<Role>("Role");
            builder.EntitySet<StatePolicy>("StatePolicy");
            builder.EntitySet<Surcharge>("Surcharge");
            builder.EntitySet<Terminal>("Terminal");
            builder.EntitySet<TicketState>("TicketState");
            builder.EntitySet<Timebox>("Timebox");
            builder.EntitySet<Transition>("Transition");
            builder.EntitySet<TransitionAction>("TransitionAction");
            builder.EntitySet<Truck>("Truck");
            builder.EntitySet<TruckMaintenance>("TruckMaintenance");
            builder.EntitySet<TruckMaintenanceDetail>("TruckMaintenanceDetail");
            builder.EntitySet<TruckMonitorConfig>("TruckMonitorConfig");
            builder.EntitySet<TruckType>("TruckType");
            builder.EntitySet<UoM>("UoM");
            builder.EntitySet<UomType>("UomType");
            builder.EntitySet<User>("User");
            builder.EntitySet<UserInterface>("UserInterface");
            builder.EntitySet<Vendor>("Vendor");
            builder.EntitySet<VendorType>("VendorType");
            builder.EntitySet<VolumeRange>("VolumeRange");
            builder.EntitySet<WeightRange>("WeightRange");
            builder.EntitySet<Workflow>("Workflow");
            return builder.GetEdmModel();
        }
    }
}
