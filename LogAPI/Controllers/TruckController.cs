using LogAPI.Attributes;
using LogAPI.Models;
using LogContract.Interfaces;
using Microsoft.AspNetCore.Cors;
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
        FMS db = new FMS();

        [HttpGet]
        public async Task<IEnumerable<Truck>> Get()
        {
            return await db.Truck.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<Truck> Get(int id)
        {
            return new Truck();
        }

        [HttpPost]
        public async Task<Truck> Post([FromBody]Truck truck)
        {
            throw new System.NotImplementedException();
        }

        [HttpPut]
        public async Task<Truck> Put([FromBody]Truck truck)
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

        [HttpDelete("{id}")]
        public async Task<bool> Delete(int id)
        {
            var truck = db.Truck.Find(id);
            db.Truck.Remove(truck);
            await db.SaveChangesAsync();
            return true;
        }
    }
}
