using LogAPI.Attributes;
using LogAPI.Models;
using LogContract.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace LogAPI.Controllers
{
    [Route("api/[controller]")]
    public class TruckController : BaseController, IRestful<Truck>
    {
        readonly TMS db;

        public TruckController(TMS context)
        {
            db = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Truck>> GetList()
        {
            return await db.Truck.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<Truck> Get(int id)
        {
            return await db.Truck.FindAsync(id);
        }

        [HttpPost]
        [ValidateModel]
        public async Task<Truck> PostAsync([FromBody]Truck truck)
        {
            if (truck == null || !ModelState.IsValid)
            {
                HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return null;
            }

            db.Truck.Add(truck);
            await db.SaveChangesAsync();
            return truck;
        }

        [HttpPut]
        public async Task<Truck> PutAsync([FromBody]Truck truck)
        {
            db.Truck.Attach(truck);
            db.Entry(truck).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return truck;
        }

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var truck = db.Truck.Find(id);
            truck.Active = false;
            await db.SaveChangesAsync();
            return true;
        }
    }
}
