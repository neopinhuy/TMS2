using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class QuotationBL : TabEditor<Quotation>
    {
        #region Quotation

        public void CreateQuotation()
        {
            InitQuotationForm(new Quotation());
        }

        public void EditQuotation(Quotation Quotation)
        {
            InitQuotationForm(Quotation);
        }

        private void InitQuotationForm(Quotation customer)
        {
            var form = new PopupEditor<Quotation>
            {
                Entity = customer,
                Name = "Quotation Detail",
                Title = "Quotation"
            };
            AddChild(form);
        }

        public void DeleteQuotation()
        {
            var grid = FindComponentByName("QuotationGrid") as GridView;
            grid.DeleteSelected();
        }

        #endregion Quotation
    }
}
