using Components;
using Components.Forms;
using System.Linq;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class CustomerCareBL : TabEditor<Customer>
    {
        public CustomerCareBL()
        {
            Name = "Customer care";
            Title = Name;
        }
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

        public void Email()
        {
            var customers = FindComponent<GridView>();
            var selected = customers.Where(x => x.Name.Contains("CustomerGrid"))
                .SelectMany(x => x.GetSelectedRow());
        }

        #endregion Customer
    }
}
