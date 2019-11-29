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
            await CalcOrderDetailPrice(order);
            var res = await base.CreateAsync(order);
            await CalcOrderPrice(order);
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
                await CalcOrderDetailPrice(order);
                UpdateChildren<OrderDetail>(order);
                await base.UpdateAsync(order);
                await CalcOrderPrice(order);
                await UpdateCoordination(order);
                await db.SaveChangesAsync();
            }
            catch (InvalidOperationException ex)
            {
                return BadRequest(ex.Message);
            }
            return await db.Order.AsNoTracking().FirstOrDefaultAsync(x => x.Id == order.Id);
        }

        private async Task CalcOrderDetailPrice(Order order)
        {
            SetTerminals(order);
            await LoadTerminalAndQuotation(order);
            order.OrderDetail.ForEach(x => x.Order = order).ForEach(CalcDefaultAndPrice);
        }

        private async Task CalcOrderPrice(Order order)
        {
            var details = await db.OrderDetail.Where(x => x.OrderId == order.Id).ToListAsync();
            order.TotalPriceBeforeDiscount = details.Sum(x => x.TotalPriceBeforeDiscount);
            order.TotalPriceAfterDiscount = details.Sum(x => x.TotalPriceAfterDiscount);
            if (order.DiscountPercentage > 0)
            {
                order.DiscountMoney = order.TotalPriceAfterDiscount * order.DiscountPercentage / 100;
            }
            if (order.DiscountMoney > 0)
            {
                order.DiscountPercentage = order.DiscountMoney / order.TotalPriceAfterDiscount * 100;
                order.TotalPriceAfterDiscount -= order.DiscountMoney;
            }
            order.TotalPriceAfterTax = order.TotalPriceAfterDiscount * (100 + order.Vat) / 100;
        }

        private static void SetTerminals(Order order)
        {
            var firstOrderDetail = order.OrderDetail.FirstOrDefault();
            order.FromId = firstOrderDetail?.FromId;
            order.ToId = firstOrderDetail?.ToId;
        }

        private async Task LoadTerminalAndQuotation(Order order)
        {
            if (order is null || order.OrderDetail.Nothing()) return;
            var terminalIds = order.OrderDetail.Where(x => x.FromId.HasValue).Select(x => x.FromId.Value)
                .Union(order.OrderDetail.Where(x => x.FromId.HasValue).Select(x => x.ToId.Value));
            var quotationIds = order.OrderDetail.Where(x => x.QuotationId.HasValue).Select(x => x.QuotationId.Value);
            var terminals = db.Terminal.Where(x => terminalIds.Contains(x.Id)).ToDictionaryAsync(x => x.Id);
            var quotations = db.Quotation.Where(x => quotationIds.Contains(x.Id)).ToDictionaryAsync(x => x.Id);
            await Task.WhenAll(terminals, quotations);
            order.OrderDetail.ForEach(x => 
            {
                x.From = terminals.Result.TryGet(x.FromId ?? 0);
                x.To = terminals.Result.TryGet(x.ToId ?? 0);
                x.Quotation = quotations.Result.TryGet(x.QuotationId ?? 0);
            });
        }

        private static void CalcDefaultAndPrice(OrderDetail detail)
        {
            if (detail is null) return;
            detail.CurrencyId = detail.Order.CurrencyId;
            detail.Vat = detail.Order.Vat;
            detail.TotalWeight = detail.BoxWeight * detail.TotalBox;
            if (detail.BoxVolume is null)
                detail.BoxVolume = detail.BoxLength * detail.BoxWidth * detail.BoxHeight;
            if (detail.TotalVolume is null)
                detail.TotalVolume = detail.BoxVolume * detail.TotalBox;
            if (detail.TransportDistance is null && detail.From != null && detail.To != null)
            {
                var from = new System.Device.Location.GeoCoordinate(detail.From.Lat, detail.From.Long);
                var to = new System.Device.Location.GeoCoordinate(detail.To.Lat, detail.To.Long);
                detail.TransportDistance = (decimal)from.GetDistanceTo(to);
            }
            CalcOrderDetailPrice(detail);
        }

        private static void CalcOrderDetailPrice(OrderDetail detail)
        {
            if (detail is null) return;
            if (detail.QuotationId is null)
                throw new InvalidOperationException($"Quotation of order detail OD{detail.Id:00000} is null");
            var price = detail.Quotation.Price;
            var priceType = (PriceTypeEnum)detail.Quotation.PriceTypeId;
            if (price is null)
                throw new InvalidOperationException($"No price has been set for the order detail OD{detail.Id:00000}");
            switch (priceType)
            {
                case PriceTypeEnum.Distance:
                    detail.TotalPriceBeforeDiscount = price * detail.TransportDistance;
                    break;
                case PriceTypeEnum.Weight:
                    detail.TotalPriceBeforeDiscount = price * detail.TotalWeight;
                    break;
                case PriceTypeEnum.Container:
                    detail.TotalPriceBeforeDiscount = price * detail.TotalContainer;
                    break;
                case PriceTypeEnum.Volume:
                    detail.TotalPriceBeforeDiscount = price * detail.TotalVolume;
                    break;
                default:
                    detail.TotalPriceBeforeDiscount = price;
                    break;
            }
            CalcDiscountAndTax(detail);
        }

        private static void CalcDiscountAndTax(OrderDetail detail)
        {
            if (detail.DiscountMoney.HasValue)
                detail.TotalPriceAfterDiscount = detail.TotalPriceBeforeDiscount - detail.DiscountMoney;
            else if (detail.DiscountPercentage.HasValue)
                detail.TotalPriceAfterDiscount = detail.TotalPriceBeforeDiscount * (100 - detail.DiscountPercentage) / 100;
            else detail.TotalPriceAfterDiscount = detail.TotalPriceBeforeDiscount;
            detail.TotalDiscountAfterTax = detail.TotalPriceAfterDiscount * (100 + detail.Order.Vat ?? detail.Vat) / 100;
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
