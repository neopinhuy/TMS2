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
        public async Task<ComponentGroup> Get(int id)
        {
            var componentGroup = await db.ComponentGroup.FindAsync(id);
            if (componentGroup == null)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }
            HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return componentGroup;
        }

        [HttpPost]
        public async Task<ComponentGroup> PostAsync([FromBody]ComponentGroup componentGroup)
        {
            if (componentGroup == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.ComponentGroup.Add(componentGroup);
            await db.SaveChangesAsync();
            return componentGroup;
        }

        [HttpPut]
        public async Task<ComponentGroup> PutAsync([FromBody]ComponentGroup componentGroup)
        {
            if (componentGroup == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.ComponentGroup.Attach(componentGroup);
            db.Entry(componentGroup).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return componentGroup;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var ComponentGroup = db.ComponentGroup.Find(id);
            ComponentGroup.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
