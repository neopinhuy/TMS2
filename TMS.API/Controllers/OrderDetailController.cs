using Common.Enums;
using Common.Extensions;
using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Extensions;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class OrderDetailController : GenericController<OrderDetail>
    {
        public OrderDetailController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpPost("api/[Controller]/Delete")]
        public override async Task<ActionResult<bool>> Delete([FromBody] List<int> ids)
        {
            var inCoordination = (int)FreightStateEnum.InCoordination;
            var coordinations = db.FindCoordination(ids);
            var inProgress = await coordinations.Where(x => x.FreightStateId != inCoordination).ToListAsync();
            if (inProgress.HasElement())
            {
                var orderDetailInProgress = inProgress.SelectMany(x => x.OrderComposition).Select(x => x.OrderDetailId);
                var inprogressIds = string.Join(", ", inProgress.Select(x => x.Id));
                var inProgressOrderDetails = string.Join(", ", orderDetailInProgress);
                return BadRequest($"The coordinations - ({inprogressIds}) for order details ({inProgressOrderDetails}) are(is) in progress");
            }
            var composition = db.OrderComposition.Where(x => ids.Contains(x.Id));
            db.OrderComposition.RemoveRange(composition);
            await db.SaveChangesAsync();
            db.RemoveEmptyCoordination();
            return await base.Delete(ids);
        }

        [HttpGet("api/[Controller]/FindByCoorId/{coorId}")]
        public async Task<IActionResult> FindByCoorId(int coorId, ODataQueryOptions<OrderDetail> options)
        {
            var query = 
                from com in db.OrderComposition
                join od in db.OrderDetail on com.OrderDetailId equals od.Id
                where com.CoordinationId == coorId
                select od;

            return await ApplyCustomeQuery(options, query);
        }
    }
}
