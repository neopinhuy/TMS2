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

        private void InitSaleOrderForm(Order SaleOrder)
        {
            var soForm = new PopupEditor<Order>
            {
                Entity = SaleOrder,
                Name = "SaleOrder Editor",
                Title = "Sale order"
            };
            soForm.AfterRendered += () =>
            {
                var customer = FindComponent<SearchEntry>(nameof(Order.CustomerId));
                customer.ValueChanged += (e) => FindComponent<GridView>(nameof(Order.OrderDetail)).ReloadData();
                var orderDetailGrid = FindComponent<GridView>(nameof(Order.OrderDetail));
                orderDetailGrid.CellChanged += async (ObservableArgs e, Header<object> header, object obj) =>
                {
                    var orderDetail = (OrderDetail)obj;
                    if (header.FieldName == nameof(OrderDetail.QuotationId))
                    {
                        if (orderDetail.QuotationId is null)
                        {
                            Toast.Warning("Quotation is required");
                            return;
                        }
                        var quotationTask = Client<Quotation>.Instance.Get(orderDetail.QuotationId.Value);
                        if (orderDetail.From == null || orderDetail.To == null)
                        {
                            var fromTask = Client<Terminal>.Instance.Get(orderDetail.FromId ?? 0);
                            var toTask = Client<Quotation>.Instance.Get(orderDetail.ToId ?? 0);
                            await Task.WhenAll(quotationTask, fromTask, toTask);
                        }
                        else
                        {
                            var quotation = await quotationTask;
                        }
                        orderDetail.CalcDefaultAndPrice();
                        // Update grid row
                        orderDetailGrid.UpdateRow(orderDetail);
                        // Calc order price
                    }
                };
            };
            AddChild(soForm);
        }

        public void DeleteSaleOrder()
        {
            var SaleOrderGrid = FindComponent("SaleOrderGrid") as GridView;
            SaleOrderGrid.DeleteSelected();
        }
    }
}
