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
    public class FeatureController : BaseController, IRestful<Feature>
    {
        readonly TMSContext db;

        public FeatureController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Feature>> GetList()
        {
            return await db.Feature.ToListAsync();
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
        [ValidateModel]
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
        [ValidateModel]
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
