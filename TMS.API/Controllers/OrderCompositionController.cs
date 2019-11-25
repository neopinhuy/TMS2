using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;
using Microsoft.EntityFrameworkCore;

namespace TMS.API.Controllers
{

    public class OrderCompositionController : GenericController<OrderComposition>
    {
        public OrderCompositionController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpPost("api/[Controller]/Delete")]
        public override async Task<bool> Delete([FromBody] List<int> ids)
        {
            using (var ctx = new TMSContext())
            {
                var entities = ctx.OrderComposition.Where(x => ids.Contains(x.Id));
                ctx.OrderComposition.RemoveRange(entities);
                await ctx.SaveChangesAsync();
                var deleting =
                    from coor in ctx.Coordination
                    join compositionLeft in ctx.OrderComposition on coor.Id equals compositionLeft.CoordinationId
                        into compositionLeftJoin
                    from composition in compositionLeftJoin.DefaultIfEmpty()
                    where composition == null
                    select coor;

                ctx.Coordination.RemoveRange(deleting);
                await ctx.SaveChangesAsync();
            }
            return true;
        }
    }
}
