﻿using Common.Clients;
using Common.Extensions;
using Components;
using Components.Extensions;
using Components.Forms;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Freight
{
    public class OrderCompositionBL : TabEditor<OrderComposition>
    {
        public OrderCompositionBL()
        {
            Name = "Order Composition List";
            Title = "Order composition";
        }

        public async Task Composite()
        {
            var grid = FindComponent<GridView>().First();
            var selected = grid.RowData.Data
                .Where(x => (bool?)x["__selected__"] == true)
                .Cast<OrderDetail>().ToList();

            if (selected.Nothing() || selected.Count() < 2)
            {
                Toast.Warning("Please select at least two order to composite.");
                return;
            }
            for (int i = 0; i < selected.Count - 1; i++)
            {
                if (!CanComposite(selected[i], selected[i + 1]))
                {
                    Toast.Warning("Cannot composite selected order because there are miss matched condition!");
                    return;
                }
            }
            var orderDetail = selected.First();

            var coordination = new Coordination
            {
                FromId = orderDetail.FromId,
                ToId = orderDetail.ToId,
                EmptyContFromId = orderDetail.EmptyContFromId,
                EmptyContToId = orderDetail.EmptyContToId,
                TotalContainer = 1,
                Weight = selected.Sum(x => x.Weight),
                Volume = selected.Sum(x => x.Volume),
                Distance = orderDetail.Distance,
                TimeboxId = orderDetail.TimeboxId,
                FreightStateId = (int)FreightStateEnum.InCoordination,
                OrderComposition = selected.Select(x => new OrderComposition
                {
                    OrderDetailId = x.Id
                }).ToList()
            };
            var client = new Client<Coordination>();
            var res = await client.CreateAsync(coordination);
            if (res is null)
            {
                Toast.Warning("Create order composition failed!");
            }
            else
            {
                Toast.Success("Create order composition succeeded!");
                FindComponent<GridView>().ForEach(x => x.ReloadData());
            }
        }

        private bool CanComposite(OrderDetail first, OrderDetail second)
        {
            return first.FromId == second.FromId && first.ToId == second.ToId
                && first.TimeboxId == second.TimeboxId;
        }

        public async Task EditSaleOrder(OrderDetail orderDetail)
        {
            var client = new Client<Order>();
            var order = await client.Get(orderDetail.OrderId);
            var _saleOrderForm = new PopupEditor<Order>
            {
                Entity = order,
                Name = "SaleOrder Editor",
                Title = "Sale order"
            };
            AddChild(_saleOrderForm);
        }

        public async Task Decomposite()
        {
            var grid = FindComponent<GridView>().Last();
            var selected = grid.RowData.Data
                .Where(x => (bool?)x["__selected__"] == true)
                .Cast<OrderDetail>().ToList();
            if (selected.Nothing())
            {
                Toast.Warning("Please select at least one order to decomposite!");
                return;
            }
            var deleted = await new Client(nameof(OrderComposition))
                .Delete(selected.Select(x => x.OrderComposition.Id).ToList());
            if (deleted)
            {
                Toast.Success("Decomposite order succeeded!");
                FindComponent<GridView>().ForEach(x => x.ReloadData());
            }
            else
            {
                Toast.Warning("Decomposite order failed!");
            }
        }
    }
}
