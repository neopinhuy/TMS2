using Common.Clients;
using Common.Extensions;
using Components;
using Components.Forms;
using MVVM;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class SaleOrderBL : TabEditor<Order>
    {
        public SaleOrderBL()
        {
            Name = "SaleOrder";
            Title = Name;
        }

        public void CreateSaleOrder()
        {
            InitSaleOrderForm(new Order());
        }

        public void EditSaleOrder(Order saleorder)
        {
            InitSaleOrderForm(saleorder);
        }

        private void InitSaleOrderForm(Order order)
        {
            var soForm = new PopupEditor<Order>
            {
                Entity = order,
                Name = "SaleOrder Editor",
                Title = "Sale order"
            };
            soForm.AfterRendered += () =>
            {
                var customer = FindComponentByName<SearchEntry>(nameof(Order.CustomerId));
                customer.ValueChanged += (e) => FindComponentByName<GridView>(nameof(Order.OrderDetail)).ReloadData();
                var orderDetailGrid = FindComponentByName<GridView>(nameof(Order.OrderDetail));
                orderDetailGrid.CellChanged += async (ObservableArgs e, Header<object> header, object obj) =>
                {
                    var orderDetail = obj.SafeCast<OrderDetail>();
                    foreach (var prop in GetOwnPropertyNames(obj))
                    {
                        orderDetail[prop] = obj[prop];
                    }
                    orderDetail.Order = order;
                    if (orderDetail.QuotationId is null)
                    {
                        Toast.Warning("Quotation is required");
                        return;
                    }
                    var quotationTask = Client<Quotation>.Instance.Get(orderDetail.QuotationId.Value);
                    if (orderDetail.From == null || orderDetail.To == null 
                        && orderDetail.FromId != null && orderDetail.ToId != null)
                    {
                        var fromTask = Client<Terminal>.Instance.Get(orderDetail.FromId ?? 0);
                        var toTask = Client<Terminal>.Instance.Get(orderDetail.ToId ?? 0);
                        await Task.WhenAll(quotationTask, fromTask, toTask);
                        orderDetail.From = fromTask.Result;
                        orderDetail.To = toTask.Result;
                        orderDetail.Quotation = quotationTask.Result;
                    }
                    else
                    {
                        orderDetail.Quotation = await quotationTask;
                    }
                        
                    orderDetail.CalcDefaultAndPrice();
                    orderDetail.Order = null;
                    orderDetail.From = null;
                    orderDetail.To = null;
                    orderDetail.Quotation = null;
                    orderDetailGrid.UpdateRow(orderDetail);
                };
            };
            AddChild(soForm);
        }

        public void DeleteSaleOrder()
        {
            var SaleOrderGrid = FindComponentByName("SaleOrderGrid") as GridView;
            SaleOrderGrid.DeleteSelected();
        }
    }
}
