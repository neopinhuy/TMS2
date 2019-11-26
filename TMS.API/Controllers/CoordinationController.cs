using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Common.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class CoordinationController : GenericController<Coordination>
    {
        public CoordinationController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpPost("api/[Controller]/Delete")]
        public override async Task<ActionResult<bool>> Delete([FromBody] List<int> ids)
        {
            var coordination = await db.Coordination
                .Include(x => x.CoordinationDetail)
                .Include(x => x.OrderComposition)
                .Where(x => ids.Contains(x.Id)).ToListAsync();
            var inprogress = coordination.Where(x => x.FreightStateId != (int)FreightStateEnum.InCoordination).ToList();
            if (inprogress.HasElement())
                return BadRequest($"The coordination(s) {string.Join(", ", inprogress.Select(x => x.Id))} is(are) in progress");
            db.CoordinationDetail.RemoveRange(coordination.SelectMany(x => x.CoordinationDetail));
            db.OrderComposition.RemoveRange(coordination.SelectMany(x => x.OrderComposition));
            return await base.Delete(ids);
        }
    }
}
