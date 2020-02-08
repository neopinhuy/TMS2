using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components;
using Components.Forms;
using System.Threading.Tasks;
using TMS.API.Models;
using Component = Components.Component;
using ElementType = MVVM.ElementType;
namespace TMS.UI.Business.Sale
{
    public class SaleOrderBL : TabEditor<Order>
    {
        private Client<Order> _client;
        public SaleOrderBL()
        {
            Name = "SaleOrder";
            Title = Name;
            Entity = new SaleorderVM();
            _client = new Client<Order>();
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
                orderDetailGrid.CellChanged += async (CellChangeEvent e) =>
                {
                    var orderDetail = e.Row.CastProp<OrderDetail>();
                    foreach (var prop in GetOwnPropertyNames(e.Row))
                    {
                        orderDetail[prop] = e.Row[prop];
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

        public void SearchSO()
        {
            var soVM = Entity as SaleorderVM;
            var soGrid = FindComponentByName("SaleOrderGrid") as GridView;
            soGrid.ReloadData($"?$filter=Active eq true and contains(Customer/User/FirstName, '{soVM.SearchTerm}')");
        }

        public void Preview(Order order)
        {
            var preview = new PopupEditor<Order>
            {
                Entity = order,
                Name = "SaleOrder Preview",
                Title = "Sale order preview"
            };
            AddChild(preview);
        }

        public void PrintOrder()
        {
            var preview = FindComponentByName<Section>("SaleOrderPreview");
            var print = Window.Open("", "_blank");
            var shtml = "<html>";
            shtml += "<link rel='stylesheet' type='text/css' href='./css/styleprint.css' />";
            shtml += "<link href='./css/font-awesome.css' rel='stylesheet' />";
            shtml += "<link href='./css/metro-all.css' rel='stylesheet' />";
            shtml += "<link href='./css/main.css' rel='stylesheet' />";
            shtml += "<link href='./css/LineIcons.css' rel='stylesheet' />";
            shtml += "<body onload=\"window.print();window.close();\">";
            shtml += "<div style='padding:7pt'>";
            shtml += preview.ContainerElement.InnerHTML;
            shtml += "</div>";
            shtml += "</body>";
            shtml += "</html>";
            print.Document.Write(shtml);
            print.Document.Close();
        }
    }
}
