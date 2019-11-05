using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using TMS.API.Attributes;
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

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var truck = db.Truck.Find(id);
            truck.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
