using Common.Clients;
using Common.Enums;
using Common.Extensions;
using Components;
using Components.Forms;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Freight
{
    public class CoordinationBL : TabEditor<Coordination>
    {
        private static bool _notifySelf = false;
        public CoordinationBL()
        {
            Name = "CoordinationManagement";
            Title = "Coordination";
        }

        public override void Render()
        {
            base.Render();
            AfterRendered += () =>
            {
                var grid = FindComponent<GridView>(nameof(Coordination));
                grid.RowData.Subscribe(async (arg) =>
                {
                    if (_notifySelf)
                    {
                        _notifySelf = false;
                        return;
                    }
                    _notifySelf = true;
                    await ComputeTree(grid);
                });
            };
        }

        private static async Task ComputeTree(GridView grid)
        {
            var rows = grid.RowData.Data.Cast<Coordination>();
            var orders = rows.SelectMany(x => x.OrderComposition)
                .Select(x => x.OrderDetail.Order).DistinctBy(x => x.Id).ToDictionary(x => x.Id);
            var terminalIds = orders.Values.Select(x => x.FromId).Union(orders.Values.Select(x => x.ToId))
                .Where(x => x != null).Select(x => (int)x);
            var terminals = (await Client<Terminal>.Instance.GetListByIds(terminalIds)).Value.ToDictionary(x => x.Id);

            // Rebuild the tree again
            var treeDic = rows.Select(coor => { coor["__groupkey__"] = CombineOrderId(coor); return coor; });
            var tree = treeDic.GroupBy(coor => (string)coor["__groupkey__"])
                .Select(g => new
                {
                    Orders = g.Key.Split(',').Select(x => int.Parse(x))
                        .Select(x => orders.TryGet(x)).ToList(),
                    Value = g.ToList()
                })
                .Where(x => x.Orders.Count > 0)
                .Select(x =>
                {
                    var order = x.Orders.First();
                    var fromTerminal = terminals.TryGet(order.FromId ?? 0);
                    var toTerminal = terminals.TryGet(order.ToId ?? 0);
                    var code = string.Format("SO{0:000000}", order.Id);
                    var key = $"{code} from {fromTerminal.ShortName} - to {toTerminal.ShortName}";
                    if (x.Orders.Count > 1)
                    {
                        key += ",...";
                    }
                    return new GroupRowData { Key = key, Children = x.Value };
                });
            grid.RowData.Data = tree.Cast<object>().ToArray();
        }

        private static string CombineOrderId(Coordination coor)
        {
            return string.Join(",", coor.OrderComposition.Select(com => com.OrderDetail.OrderId));
        }

        public async Task Composite()
        {
            var grid = FindComponent("OrderCompositionGrid") as GridView;
            var selected = grid.RowData.Data
                .Where(x => (bool?)x["__selected__"] == true)
                .Cast<OrderDetail>().ToList();

            if (selected.Nothing())
            {
                Toast.Warning("Please select at least one order to composite.");
                return;
            }
            for (int i = 0; i < selected.Count - 1; i++)
            {
                if (selected.Count > 1 && !CanComposite(selected[i], selected[i + 1]))
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
                Weight = selected.Sum(x => x.TotalWeight),
                Volume = selected.Sum(x => x.TotalVolume),
                Distance = orderDetail.TransportDistance,
                TimeboxId = orderDetail.TimeboxId,
                FreightStateId = (int)FreightStateEnum.InCoordination,
                IsComposited = selected.Count > 1,
                CommodityTypeId = selected.Select(x => x.CommodityTypeId).Distinct().Count() == 1
                    ? orderDetail.CommodityTypeId : null,
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

        public async Task DecompositeOrderDetail()
        {
            var grid = FindComponent("OrderDeCompositionGrid") as GridView;
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

        public async Task DecompositeCoordination()
        {
            var grid = FindComponent("Coordination") as GridView;
            var selected = grid.RowData.Data
                .Where(x => (bool?)x["__selected__"] == true)
                .Cast<Coordination>().ToList();
            if (selected.Nothing() || !selected.All(x => x.IsComposited))
            {
                Toast.Warning("Please select composited coordinations to delete!");
                return;
            }

            if (selected.Any(x => x.FreightStateId != (int)FreightStateEnum.InCoordination))
            {
                Toast.Warning("Please select in-progress coordinations to delete!");
                return;
            }

            var deleted = await new Client(nameof(Coordination))
                .Delete(selected.Select(x => x.Id).ToList());
            if (deleted)
            {
                Toast.Success("Delete coordination succeeded!");
                FindComponent<GridView>().ForEach(x => x.ReloadData());
            }
            else
            {
                Toast.Warning("Delete coordination failed!");
            }
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Performance", "CA1822:Mark members as static", Justification = "<Pending>")]
        public async Task EditCoordination(Coordination coordination)
        {
            var popup = new PopupEditor<Coordination>()
            {
                Entity = coordination,
            };
            popup.Render();

            if (coordination.TaskStateId == (int)TaskStateEnum.Unread)
            {
                coordination.TaskStateId = (int)TaskStateEnum.Read;
                await Client<Coordination>.Instance.UpdateAsync(coordination);
            }
        }
    }
}
