using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class SaleOrderBL : TabEditor<Order>
    {
        private PopupEditor<Order> _saleOrderForm;

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
            _saleOrderForm = new PopupEditor<Order>
            {
                Entity = SaleOrder,
                Name = "SaleOrder Editor",
                Title = "Sale order"
            };
            AddChild(_saleOrderForm);
        }

        public void DeleteSaleOrder()
        {
            var SaleOrderGrid = FindComponent("SaleOrderGrid") as GridView;
            SaleOrderGrid.DeleteSelected();
        }
    }
}
