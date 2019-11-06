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
    public class TruckController : BaseController
    {
        readonly TMSContext db;

        public TruckController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<Truck> Get()
        {
            return db.Truck.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Truck>> Get(int id)
        {
            var truck = await db.Truck.FindAsync(id);
            if (truck == null) return NotFound();
            return Ok(truck);
        }

        [HttpPost]
        public async Task<ActionResult<Truck>> PostAsync([FromBody]Truck truck)
        {
            if (truck == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            db.Truck.Add(truck);
            await db.SaveChangesAsync();
            return truck;
        }

        [HttpPut]
        public async Task<Truck> PutAsync([FromBody]Truck truck)
        {
            db.Truck.Attach(truck);
            db.Entry(truck).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return truck;
        }

        [HttpPost("Delete")]
        public async Task<bool> Delete([FromBody]List<int> ids)
        {
            var truck = db.Truck.Where(x => ids.Contains(x.Id));
            db.Truck.RemoveRange(truck);
            await db.SaveChangesAsync();
            return true;
        }
    }
}
