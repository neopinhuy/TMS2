using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class AccessoryController : GenericController<Accessory>
    {
        public AccessoryController(TMSContext context) : base(context)
        {
        }

        [HttpGet]
        [EnableQuery]
        public override IQueryable<Accessory> Get()
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
    }
}
