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
            var entities = db.OrderComposition.Where(x => ids.Contains(x.Id));
            db.OrderComposition.RemoveRange(entities);
            await db.SaveChangesAsync();

            var emptyCoordination =
                from coordination in db.Coordination.Include(x => x.OrderComposition)
                join composition in db.OrderComposition on coordination.Id equals composition.CoordinationId
                where coordination.Active
                group new { composition } by coordination into g
                where g.Count() == 0
                select g.Key;
            db.Coordination.RemoveRange(emptyCoordination);
            await db.SaveChangesAsync();
            return true;
        }
    }
}
