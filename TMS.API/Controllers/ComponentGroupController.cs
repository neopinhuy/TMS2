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
    public class ComponentGroupController : BaseController
    {
        readonly TMSContext db;

        public ComponentGroupController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<ComponentGroup> Get()
        {
            return db.ComponentGroup.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ComponentGroup>> Get(int id)
        {
            var componentGroup = await db.ComponentGroup.FindAsync(id);
            if (componentGroup == null)
            {
                return BadRequest();
            }
            return Ok(componentGroup);
        }

        [HttpPost]
        public async Task<ActionResult<ComponentGroup>> PostAsync([FromBody]ComponentGroup componentGroup)
        {
            if (componentGroup == null || !ModelState.IsValid)
            {
                return BadRequest();
            }

            db.ComponentGroup.Add(componentGroup);
            await db.SaveChangesAsync();
            return Ok(componentGroup);
        }

        [HttpPut]
        public async Task<ActionResult<ComponentGroup>> PutAsync([FromBody]ComponentGroup componentGroup)
        {
            if (componentGroup == null || !ModelState.IsValid)
            {
                return BadRequest();
            }

            db.ComponentGroup.Attach(componentGroup);
            db.Entry(componentGroup).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return Ok(componentGroup);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<bool>> Delete(int id)
        {
            var ComponentGroup = db.ComponentGroup.Find(id);
            ComponentGroup.Active = false;
            await db.SaveChangesAsync();
            return Ok(true);
        }
    }
}
