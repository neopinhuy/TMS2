using Common.Enums;
using Common.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Extensions;
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
            SetTerminals(order);
            var res = await base.CreateAsync(order);
            var coordination = CreateCoordination(order.OrderDetail);
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
            try
            {
                UpdateChildren<OrderDetail>(order);
                await base.UpdateAsync(order);
                await UpdateCoordination(order);
                await db.SaveChangesAsync();
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(ex.Message);
            }
            return await db.Order.AsNoTracking().FirstOrDefaultAsync(x => x.Id == order.Id);
        }

        private static void SetTerminals(Order order)
        {
            var firstOrderDetail = order.OrderDetail.FirstOrDefault();
            if (firstOrderDetail is null) return;
            order.FromId = firstOrderDetail?.FromId;
            order.ToId = firstOrderDetail?.ToId;
        }

        private IEnumerable<Coordination> CreateCoordination(IEnumerable<OrderDetail> orderDetails)
        {
            return
                from orderDetail in orderDetails
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
                    Weight = orderDetail.TotalWeight,
                    Volume = orderDetail.TotalVolume,
                    Distance = orderDetail.TransportDistance,
                    CommodityTypeId = orderDetail.CommodityTypeId,
                };
        }

        private async Task UpdateCoordination(Order order)
        {
            foreach (var orderDetail in order.OrderDetail)
            {
                var coordination = await db.FindCoordination(orderDetail);
                var vendor = await db.Vendor.FindAsync(orderDetail.VendorId ?? 0);
                if (coordination != null && coordination.FreightStateId != (int)FreightStateEnum.InCoordination)
                    throw new InvalidOperationException($"The coordination associated with the order detail id - {orderDetail.Id} is in progress!");
                var updateCondition = coordination != null && vendor.IsSelf && orderDetail.IsContainer;
                if (updateCondition)
                {
                    UpdateCoordination(orderDetail, coordination);
                }
                else
                {
                    RemoveCoordination(coordination);
                    await InitCoordinationForContainer(orderDetail);
                }
            }
        }

        private void RemoveCoordination(Coordination coordination)
        {
            if (coordination is null) return;
            db.OrderComposition.RemoveRange(coordination.OrderComposition);
            db.CoordinationDetail.RemoveRange(coordination.CoordinationDetail);
            db.Coordination.Remove(coordination);
        }

        private static void UpdateCoordination(OrderDetail orderDetail, Coordination coordination)
        {
            if (coordination is null || orderDetail is null) return;
            coordination.ContainerTypeId = orderDetail.ContainerTypeId;
            coordination.CommodityTypeId = orderDetail.CommodityTypeId;
            coordination.EmptyContFromId = orderDetail.EmptyContFromId;
            coordination.EmptyContToId = orderDetail.EmptyContToId;
            coordination.FromId = orderDetail.FromId;
            coordination.ToId = orderDetail.ToId;
            coordination.Note = orderDetail.Note;
            coordination.TimeboxId = orderDetail.TimeboxId;
            coordination.TotalContainer = orderDetail.TotalContainer;
            coordination.TruckTypeId = orderDetail.TruckTypeId;
            coordination.Weight = orderDetail.TotalWeight;
            coordination.Volume = orderDetail.TotalVolume;
            coordination.Distance = orderDetail.TransportDistance;
        }

        private async Task InitCoordinationForContainer(OrderDetail orderDetail)
        {
            var vendor = await db.Vendor.FindAsync(orderDetail.VendorId ?? 0);
            if (orderDetail.IsContainer && vendor != null && vendor.IsSelf)
            {
                var created = CreateCoordination(new List<OrderDetail> { orderDetail });
                db.Coordination.AddRange(created);
            }
        }
    }
}
