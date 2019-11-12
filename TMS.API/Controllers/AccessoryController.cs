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
    }
}
