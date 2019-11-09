using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class TruckMaintenanceDetailController : BaseController
    {
        readonly TMSContext db;

        public TruckMaintenanceDetailController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<TruckMaintenanceDetail> Get()
        {
            return db.TruckMaintenanceDetail.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<TruckMaintenanceDetail>> Get(int id)
        {
            var maintenance = await db.TruckMaintenanceDetail.FindAsync(id);
            if (maintenance == null) return NotFound();
            return Ok(maintenance);
        }

        [HttpPost]
        public async Task<ActionResult<TruckMaintenanceDetail>> PostAsync([FromBody]TruckMaintenanceDetail maintenance)
        {
            if (maintenance == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            // TODO: hard code for now
            maintenance.InsertedBy = 1;
            db.TruckMaintenanceDetail.Add(maintenance);
            await db.SaveChangesAsync();
            return maintenance;
        }

        [HttpPut]
        public async Task<TruckMaintenanceDetail> PutAsync([FromBody]TruckMaintenanceDetail maintenance)
        {
            db.TruckMaintenanceDetail.Attach(maintenance);
            db.Entry(maintenance).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return maintenance;
        }

        [HttpPost("Delete")]
        public async Task<bool> Delete([FromBody]List<int> ids)
        {
            var maintenance = db.TruckMaintenanceDetail.Where(x => ids.Contains(x.Id));
            db.TruckMaintenanceDetail.RemoveRange(maintenance);
            await db.SaveChangesAsync();
            return true;
        }
    }
}
