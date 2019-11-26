using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;
using TMS.API.Extensions;
using System;
using Common.Extensions;
using Microsoft.EntityFrameworkCore;

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
    }
}
