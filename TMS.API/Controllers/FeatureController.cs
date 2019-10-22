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
    public class FeatureController : BaseController
    {
        readonly TMSContext db;

        public FeatureController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<Feature> Get()
        {
            return db.Feature.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<Feature> Get(int id)
        {
            var entity = await db.Feature.FindAsync(id);
            if (entity == null)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }
            HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return entity;
        }

        [HttpPost]
        public async Task<Feature> PostAsync([FromBody]Feature feature)
        {
            if (feature == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Feature.Add(feature);
            await db.SaveChangesAsync();
            return feature;
        }

        [HttpPut]
        public async Task<Feature> PutAsync([FromBody]Feature feature)
        {
            if (feature == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Feature.Attach(feature);
            db.Entry(feature).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return feature;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var Feature = db.Feature.Find(id);
            Feature.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
