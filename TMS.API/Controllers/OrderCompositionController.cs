using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;
using TMS.API.Extensions;

namespace TMS.API.Controllers
{
    public class OrderCompositionController : GenericController<OrderComposition>
    {
        public OrderCompositionController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpPost("api/[Controller]/Delete")]
        public override async Task<ActionResult<bool>> DeleteAsync([FromBody] List<int> ids)
        {
            var entities = db.OrderComposition.Where(x => ids.Contains(x.Id));
            db.OrderComposition.RemoveRange(entities);
            await db.SaveChangesAsync();
            db.RemoveEmptyCoordination();
            await db.SaveChangesAsync();
            return true;
        }
    }
}
