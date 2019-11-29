using Components;
using Components.Forms;
using MVVM;
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
                //orderDetailGrid.CellChanged += (ObservableArgs e, Header<object> header, object obj) =>
                //{

                //};
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
