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
            var initStatus = await db.MasterData.FirstOrDefaultAsync(m => m.Name == "UnreadStatus"
                                                                       && m.Parent.Name == "LiabilitiesWarningStatus");
            var dataCount = from trucks in db.TruckMaintenanceWarning

                            where trucks.ProcessStatusId == initStatus.Id
                            select trucks;
            var count = await dataCount.CountAsync();
            return Ok(count);
        }
    }
}
