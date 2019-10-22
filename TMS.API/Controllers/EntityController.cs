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
    public class EntityController : BaseController
    {
        readonly TMSContext db;

        public EntityController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<Entity> Get()
        {
            return db.Entity.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<Entity> Get(int id)
        {
            var entity = await db.Entity.FindAsync(id);
            if (entity == null)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }
            HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return entity;
        }

        [HttpPost]
        public async Task<Entity> PostAsync([FromBody]Entity entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Entity.Add(entity);
            await db.SaveChangesAsync();
            return entity;
        }

        [HttpPut]
        public async Task<Entity> PutAsync([FromBody]Entity entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Entity.Attach(entity);
            db.Entry(entity).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return entity;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var Entity = db.Entity.Find(id);
            Entity.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
