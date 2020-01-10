using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components;
using Components.Forms;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class CustomerCareBL : TabEditor<CustomerCareVM>
    {
        public CustomerCareBL()
        {
            Name = "Customer care";
            Title = Name;
        }

        public void CreateCustomer()
        {
            var customerCare = new CustomerCareVM()
            {
                Customer = new Customer() { User = new User() }
            };
            InitCustomerCareForm(customerCare);
        }

        public void EditCustomer(CustomerCareVM customerCare)
        {
            InitCustomerCareForm(customerCare);
        }

        private void InitCustomerCareForm(CustomerCareVM vm)
        {
            vm.CustomerCareLog = new CustomerCareLog();
            var user = vm.Customer?.User;
            var name = user != null && user.FirstName.HasAnyChar() ? $"{user.FirstName} {user.LastName}" : vm.Customer?.CompanyInterShortName;
            var id = vm.Customer?.Id ?? 0;
            if (!(Children.FirstOrDefault(x => x.Id == id) is CustomerCareDetailBL customerForm))
            {
                customerForm = new CustomerCareDetailBL
                {
                    Id = id,
                    Entity = vm,
                    Name = "CustomerCare Detail",
                    Title = vm.Customer?.Id > 0 ? $"{name}" : "New Customer"
                };
                AddChild(customerForm);
            }
            customerForm.Focus();
        }

        public async Task Email()
        {
            var customers = FindActiveComponent<GridView>();
            var selected = customers.SelectMany(x => x.GetSelectedRow()).Cast<CustomerCare>();
            var res = await Client<CustomerCare>.Instance.SendMail(new EmailVM
            {
                ToAddresses = selected.Select(x => x.Customer.Email).ToList()
            });
        }
    }
}
