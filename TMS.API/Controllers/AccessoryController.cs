using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class AccessoryController : BaseController
    {
        readonly TMSContext db;

        public AccessoryController(TMSContext context)
        {
            db = context;
        }

        [HttpGet]
        [EnableQuery]
        public IQueryable<Accessory> Get()
        {
            return db.Accessory.AsQueryable();
        }

        [HttpGet("TruckAccessory/{id}")]
        [EnableQuery]
        public IQueryable<Accessory> TruckAccessory(int id)
        {
            return
                from acc in db.Accessory
                join truck in db.Truck on acc.TruckId equals truck.Id
                join allAcc in db.Accessory on truck.Id equals allAcc.TruckId
                where acc.Id == id
                select allAcc;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Accessory>> Get(int id)
        {
            var accessory = await db.Accessory.FindAsync(id);
            if (accessory == null)
            {
                return BadRequest();
            }
            return Ok(accessory);
        }

        [HttpPost]
        public async Task<ActionResult<Accessory>> PostAsync([FromBody]Accessory accessory)
        {
            if (accessory == null || !ModelState.IsValid)
            {
                return BadRequest();
            }
            CalcMaintenancePeriod(accessory);
            if (accessory.InsertedBy == 0) accessory.InsertedBy = 1;
            db.Accessory.Add(accessory);
            await db.SaveChangesAsync();
            return Ok(accessory);
        }

        private void CalcMaintenancePeriod(Accessory value)
        {
            if (value.ApplyPeriod)
            {
                var period = value.NextMaintenanceDate - value.AssembledDate;
                if (period != null) value.MaintenancePeriod = period.Value.Ticks;
            }
        }

        [HttpPut]
        public async Task<ActionResult<Accessory>> PutAsync([FromBody]Accessory accessory)
        {
            if (accessory == null || !ModelState.IsValid)
            {
                return BadRequest();
            }
            db.Accessory.Attach(accessory);
            db.Entry(accessory).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return Ok(accessory);
        }

        [HttpPost("Delete")]
        public async Task<bool> Delete([FromBody]List<int> ids)
        {
            var accessory = db.Accessory.Where(x => ids.Contains(x.Id));
            db.Accessory.RemoveRange(accessory);
            await db.SaveChangesAsync();
            return true;
        }
    }
}
