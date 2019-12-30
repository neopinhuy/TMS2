using Microsoft.AspNetCore.Mvc;
using Nest;
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
    }
}
