using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
        public override async Task<ActionResult<TruckMaintenance>> PutAsync([FromBody]TruckMaintenance maintenance)
        {
            if (maintenance == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            foreach (var detail in maintenance.TruckMaintenanceDetail)
            {
                if (detail.Id <= 0)
                {
                    detail.Id = 0;
                    db.TruckMaintenanceDetail.Add(detail);
                }
                else
                {
                    db.TruckMaintenanceDetail.Attach(detail);
                    db.Entry(detail).State = EntityState.Modified;
                    db.TruckMaintenanceDetail.Update(detail);
                }
            }
            db.TruckMaintenance.Attach(maintenance);
            db.Entry(maintenance).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return maintenance;
        }
    }
}
