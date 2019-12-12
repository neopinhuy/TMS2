using Components;
using Components.Forms;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class CustomerBL : TabEditor<Customer>
    {
        #region Customer

        public void CreateCustomer()
        {
            InitCustomerForm(new Customer() { User = new User()});
        }

        public void EditCustomer(Customer Customer)
        {
            InitCustomerForm(Customer);
        }

        private void InitCustomerForm(Customer customer)
        {
            var customerForm = new PopupEditor<Customer>
            {
                Entity = customer,
                Name = "Customer Detail",
                Title = "Customer"
            };
            AddChild(customerForm);
        }

        public void DeleteCustomer()
        {
            var CustomerGrid = FindComponentByName("CustomerGrid") as GridView;
            CustomerGrid.DeleteSelected();
        }

        #endregion Customer
    }
}
