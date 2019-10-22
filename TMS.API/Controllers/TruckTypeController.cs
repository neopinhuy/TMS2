using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class TruckTypeController : BaseController
    {
        readonly TMSContext db;

        public TruckTypeController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<TruckType> Get()
        {
            return db.TruckType.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<TruckType> Get(int id)
        {
            var entity = await db.TruckType.FindAsync(id);
            if (entity == null)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }
            HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return entity;
        }

        [HttpPost]
        public async Task<TruckType> PostAsync([FromBody]TruckType entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.TruckType.Add(entity);
            await db.SaveChangesAsync();
            return entity;
        }

        [HttpPut]
        public async Task<TruckType> PutAsync([FromBody]TruckType entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.TruckType.Attach(entity);
            db.Entry(entity).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return entity;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var TruckType = db.TruckType.Find(id);
            TruckType.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
