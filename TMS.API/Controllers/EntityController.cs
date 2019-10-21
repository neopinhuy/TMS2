using TMS.API.Attributes;
using TMS.API.Models;
using Common.Clients;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class EntityController : BaseController, IRestful<Entity>
    {
        readonly TMSContext db;

        public EntityController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Entity>> GetList()
        {
            return await db.Entity.ToListAsync();
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
        [ValidateModel]
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
        [ValidateModel]
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
