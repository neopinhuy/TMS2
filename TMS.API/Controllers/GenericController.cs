using Common.Extensions;
using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Attributes;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [ApiController]
    [ValidateModel]
    public class GenericController<T> : ControllerBase where T : class
    {
        readonly TMSContext db;

        public GenericController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<T> Get()
        {
            return db.Set<T>().AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<T>> Get(int id)
        {
            var entity = await db.Set<T>().FindAsync(id);
            if (entity == null) return NotFound();
            return Ok(entity);
        }

        [HttpPost]
        public async Task<ActionResult<T>> PostAsync([FromBody]T entity)
        {
            if (entity == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            entity.SetPropValue("InsertedBy", 1);
            db.Set<T>().Add(entity);
            await db.SaveChangesAsync();
            return entity;
        }

        [HttpPut]
        public async Task<T> PutAsync([FromBody]T entity)
        {
            db.Set<T>().Attach(entity);
            db.Entry(entity).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return entity;
        }

        [HttpPost("Delete")]
        public async Task<bool> Delete([FromBody]List<int> ids)
        {
            var entity = db.Set<T>().Where(x => ids.Contains((int)x.GetPropValue("Id")));
            db.Set<T>().RemoveRange(entity);
            await db.SaveChangesAsync();
            return true;
        }
    }
}
