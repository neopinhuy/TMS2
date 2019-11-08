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
    public class TruckMaintenanceController : BaseController
    {
        readonly TMSContext db;

        public TruckMaintenanceController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<TruckMaintenance> Get()
        {
            return db.TruckMaintenance.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<TruckMaintenance>> Get(int id)
        {
            var maintenance = await db.TruckMaintenance.FindAsync(id);
            if (maintenance == null) return NotFound();
            return Ok(maintenance);
        }

        [HttpPost]
        public async Task<ActionResult<TruckMaintenance>> PostAsync([FromBody]TruckMaintenance maintenance)
        {
            if (maintenance == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            // TODO: hard code for now
            maintenance.InsertedBy = 1;
            db.TruckMaintenance.Add(maintenance);
            await db.SaveChangesAsync();
            return maintenance;
        }

        [HttpPut]
        public async Task<TruckMaintenance> PutAsync([FromBody]TruckMaintenance maintenance)
        {
            db.TruckMaintenance.Attach(maintenance);
            db.Entry(maintenance).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return maintenance;
        }

        [HttpPost("Delete")]
        public async Task<bool> Delete([FromBody]List<int> ids)
        {
            var maintenance = db.TruckMaintenance.Where(x => ids.Contains(x.Id));
            db.TruckMaintenance.RemoveRange(maintenance);
            await db.SaveChangesAsync();
            return true;
        }
    }
}
