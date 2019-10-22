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
    public class FreightStateController : BaseController
    {
        readonly TMSContext db;

        public FreightStateController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<FreightState> Get()
        {
            return db.FreightState.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<FreightState> Get(int id)
        {
            return await db.FreightState.FindAsync(id);
        }

        [HttpPost]
        public async Task<FreightState> PostAsync([FromBody]FreightState FreightState)
        {
            if (FreightState == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.FreightState.Add(FreightState);
            await db.SaveChangesAsync();
            return FreightState;
        }

        [HttpPut]
        public async Task<FreightState> PutAsync([FromBody]FreightState FreightState)
        {
            db.FreightState.Attach(FreightState);
            db.Entry(FreightState).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return FreightState;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var freightState = db.FreightState.Find(id);
            freightState.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
