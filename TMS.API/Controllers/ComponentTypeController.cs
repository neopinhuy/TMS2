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
    public class ComponentTypeController : BaseController
    {
        readonly TMSContext db;

        public ComponentTypeController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<ComponentType> Get()
        {
            return db.ComponentType.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<ComponentType> Get(int id)
        {
            var componentType = await db.ComponentType.FindAsync(id);
            if (componentType == null)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }
            HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return componentType;
        }

        [HttpPost]
        public async Task<ComponentType> PostAsync([FromBody]ComponentType componentType)
        {
            if (componentType == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.ComponentType.Add(componentType);
            await db.SaveChangesAsync();
            return componentType;
        }

        [HttpPut]
        public async Task<ComponentType> PutAsync([FromBody]ComponentType componentType)
        {
            if (componentType == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.ComponentType.Attach(componentType);
            db.Entry(componentType).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return componentType;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var ComponentType = db.ComponentType.Find(id);
            ComponentType.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
