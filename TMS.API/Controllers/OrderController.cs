using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class OrderController : GenericController<Order>
    {
        public OrderController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpPost("api/[Controller]")]
        public override async Task<ActionResult<Order>> CreateAsync([FromBody]Order order)
        {
            if (order == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var res = await base.CreateAsync(order);

            var coordination = 
                from orderDetail in order.OrderDetail
                join vendor in db.Vendor on orderDetail.VendorId equals vendor.Id
                where orderDetail.IsContainer && vendor.IsSelf
                select new Coordination
                {
                    ContainerTypeId = orderDetail.ContainerTypeId,
                    EmptyContFromId = orderDetail.EmptyContFromId,
                    EmptyContToId = orderDetail.EmptyContToId,
                    FromId = orderDetail.FromId,
                    ToId = orderDetail.ToId,
                    FreightStateId = (int)FreightStateEnum.InCoordination,
                    Note = orderDetail.Note,
                    OrderComposition = new List<OrderComposition> 
                    {
                        new OrderComposition { OrderDetailId = orderDetail.Id } 
                    },
                    TimeboxId = orderDetail.TimeboxId,
                    TotalContainer = orderDetail.TotalContainer,
                    TruckTypeId = orderDetail.TruckTypeId,
                    Weight = orderDetail.Weight,
                    Volume = orderDetail.Volume,
                    Distance = orderDetail.Distance,
                };
            db.Coordination.AddRange(coordination);
            await db.SaveChangesAsync();
            return res;
        }

        [HttpPut("api/[Controller]")]
        public override async Task<ActionResult<Order>> UpdateAsync([FromBody]Order order)
        {
            if (order == null || !ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            using (var transaction = db.Database.BeginTransaction())
            {
                UpdateChildren<OrderDetail>(order);
                var res = await base.UpdateAsync(order);
                //var detailIds = order.OrderDetail.Select(x => x.Id);
                //var inCoordinationState = (int)FreightStateEnum.InCoordination;
                //var coordination = db.OrderComposition
                //    .Include(x => x.Coordination)
                //    .ThenInclude(x => x.CoordinationDetail)
                //    .Where(x => detailIds.Contains(x.OrderDetailId)
                //        && x.Coordination.FreightStateId == inCoordinationState)
                //    .Select(x => x.Coordination);
                //var coorDetail = coordination.SelectMany(x => x.CoordinationDetail);

                await db.SaveChangesAsync();
                return res;
            }
        }
    }
}
