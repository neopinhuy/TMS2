using Common.Clients;
using Common.Extensions;
using Components;
using Components.Extensions;
using Components.Forms;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Freight
{
    public class CoordinationBL : TabEditor<Coordination>
    {
        public CoordinationBL()
        {
            Name = "Order Composition List";
            Title = "Coordination";
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
                Weight = selected.Sum(x => x.Weight),
                Volume = selected.Sum(x => x.Volume),
                Distance = orderDetail.Distance,
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
    }
}
