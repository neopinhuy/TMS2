using Common.ViewModels;
using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class TruckMaintenanceController : GenericController<TruckMaintenance>
    {
        public TruckMaintenanceController(TMSContext context, IElasticClient client) 
            : base(context, client)
        {
        }

        [HttpPut("api/[Controller]")]
        public override async Task<ActionResult<TruckMaintenance>> UpdateAsync([FromBody]TruckMaintenance maintenance)
        {
            if (maintenance == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            UpdateChildren(maintenance.TruckMaintenanceDetail);
            return await base.UpdateAsync(maintenance);
        }
        [HttpGet("api/[Controller]/CountMaintenanceWarning")]
        public async Task<ActionResult<int>> CountTruckcMaintenanceWarning()
        {
            var setting = await db.MasterData.FirstOrDefaultAsync(m => m.Name == "MaintenanceSettings");
            var parsed = int.TryParse(setting.Description, out int res);
            DateTime today = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 00, 00, 00, 000);
            DateTime commingtoday = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 23, 59, 59, 999);
            var commingDate = today.AddDays(parsed ? res : 3);
            var dataCount = from trucks in db.Truck
                            where trucks.NextMaintenanceDate <= commingDate && trucks.NextMaintenanceDate >= today
                            select trucks;
            var count = await dataCount.CountAsync();
            return Ok(count);
        }
    }
}
