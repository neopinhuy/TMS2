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

        #region SaleOrder

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
            _saleOrderForm.AfterSaved += () =>
            {
                var orderDetail = _saleOrderForm.FindComponent("OrderDetail") as GridView;
                orderDetail.LoadData();
                var surcharge = _saleOrderForm.FindComponent("Surcharge") as GridView;
                surcharge.LoadData();
            };
            _saleOrderForm.AfterSaved += ReloadSaleOrderGrid;
            AddChild(_saleOrderForm);
        }

        public void DeleteSaleOrder()
        {
            var SaleOrderGrid = FindComponent("SaleOrderGrid") as GridView;
            SaleOrderGrid.DeleteSelected();
            ReloadSaleOrderGrid();
        }

        private void ReloadSaleOrderGrid()
        {
            var SaleOrderGrid = FindComponent("SaleOrderGrid") as GridView;
            SaleOrderGrid.LoadData();
        }

        #endregion SaleOrder
    }
}
