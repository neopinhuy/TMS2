using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using LogAPI.Models;
using LogContract.Interfaces;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace LogAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("AllowOrigin")]
    public class TruckController : BaseController, IRestful<Truck>
    {
        FMS db = new FMS();
        // GET: api/<controller>
        [HttpGet]
        public async Task<IEnumerable<Truck>> Get()
        {
            return await db.Truck.ToListAsync();
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public async Task<Truck> Get(int id)
        {
            return new Truck();
        }

        // POST api/<controller>
        [HttpPost]
        public Task Post([FromBody]Truck truck)
        {
            throw new System.NotImplementedException();
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public Task Put([FromBody]Truck value)
        {
            throw new System.NotImplementedException();
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public Task Delete(int id)
        {
            throw new System.NotImplementedException();
        }
    }
}
