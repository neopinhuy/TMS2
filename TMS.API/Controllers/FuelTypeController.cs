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
    public class FuelTypeController : BaseController
    {
        readonly TMSContext db;

        public FuelTypeController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<FuelType> Get()
        {
            return db.FuelType.AsQueryable();
        }

        [HttpGet("{id}")]
        public async Task<FuelType> Get(int id)
        {
            var entity = await db.FuelType.FindAsync(id);
            if (entity == null)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }
            HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return entity;
        }

        [HttpPost]
        public async Task<FuelType> PostAsync([FromBody]FuelType fuelType)
        {
            if (fuelType == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.FuelType.Add(fuelType);
            await db.SaveChangesAsync();
            return fuelType;
        }

        [HttpPut]
        public async Task<FuelType> PutAsync([FromBody]FuelType fuelType)
        {
            if (fuelType == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.FuelType.Attach(fuelType);
            db.Entry(fuelType).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return fuelType;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var FuelType = db.FuelType.Find(id);
            FuelType.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
