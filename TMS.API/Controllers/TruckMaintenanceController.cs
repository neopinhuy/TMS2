using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class TruckMaintenanceController : GenericController<TruckMaintenance>
    {
        public TruckMaintenanceController(TMSContext context, IElasticClient client) 
            : base(context, client)
        {
        }

        [HttpPut]
        public override async Task<ActionResult<TruckMaintenance>> PutAsync([FromBody]TruckMaintenance maintenance)
        {
            if (maintenance == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var deletedIds = db.TruckMaintenanceDetail
                .Where(x => x.MaintenanceId == maintenance.Id).Select(x => x.Id)
                .Except(maintenance.TruckMaintenanceDetail.Select(x => x.Id));
            var deleted = db.TruckMaintenanceDetail.Where(x => deletedIds.Contains(x.Id));
            db.TruckMaintenanceDetail.RemoveRange(deleted);
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
            //await _elasticClient.UpdateAsync<TruckMaintenance>(maintenance, u => u.Doc(maintenance));
            return maintenance;
        }
    }
}
