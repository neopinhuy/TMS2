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
    public class OrderCompositionBL : TabEditor<OrderComposition>
    {
        public OrderCompositionBL()
        {
            Name = "Order Composition List";
            Title = "Order composition";
        }

        public async Task Composite()
        {
            // Get selected order details
            var grid = FindComponent<GridView>().First();
            var selected = grid.RowData.Data
                .Where(x => (bool?)x["__selected__"] == true)
                .Cast<OrderDetail>().ToList();

            // Notify if the user hasn't selected any row
            if (selected.Nothing() || selected.Count() < 2)
            {
                Toast.Warning("Please select at least two order to composite.");
            }

            // Notify if the selected order detail have different condition that cannot composite
            for (int i = 0; i < selected.Count - 1; i++)
            {
                if (!CanComposite(selected[i], selected[i + 1]))
                {
                    Toast.Warning("Cannot composite selected order because there are miss matched condition!");
                    return;
                }
            }
            var orderDetail = selected.First();

            // Create a new order composition object
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

            // Submit to the server
            var client = new Client<Coordination>();
            var res = await client.CreateAsync(coordination);

            // Notify success
            if (res is null)
            {
                Toast.Warning("Create order composition failed!");
            }
            else
            {
                Toast.Success("Create order composition succeeded!");
            }
        }

        private bool CanComposite(OrderDetail first, OrderDetail second)
        {
            return first.FromId == second.FromId && first.ToId == second.ToId
                && first.EmptyContFromId == second.EmptyContFromId
                && first.EmptyContToId == second.EmptyContToId
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
    }
}
