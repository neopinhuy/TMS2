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
    public class TruckTypeController : BaseController, IRestful<TruckType>
    {
        readonly TMSContext db;

        public TruckTypeController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        public async Task<IEnumerable<TruckType>> GetList()
        {
            return await db.TruckType.ToListAsync();
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
        [ValidateModel]
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
        [ValidateModel]
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
