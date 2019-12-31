using Common.Clients;
using Common.Extensions;
using Common.ViewModels;
using Components;
using Components.Forms;
using System;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.Sale
{
    public class CustomerCareBL : TabEditor<CustomerCare>
    {
        public CustomerCareBL()
        {
            Name = "Customer care";
            Title = Name;
        }

        public void CreateCustomer()
        {
            var customerCare = new CustomerCare()
            {
                Customer = new Customer() { User = new User() }
            };
            InitCustomerCareForm(customerCare);
        }

        public void EditCustomer(CustomerCare customerCare)
        {
            InitCustomerCareForm(customerCare);
        }

        private void InitCustomerCareForm(CustomerCare customer)
        {
            var customerForm = new PopupEditor<CustomerCare>
            {
                Entity = customer,
                Name = "CustomerCare Detail",
                Title = "Customer"
            };
            AddChild(customerForm);
        }

        public void Call()
        {
            
        }
        
        public void CustomerCareLog_CellChanged(CellChangeEvent e)
        {
            var customerCareLog = e.Row?.SafeCast<CustomerCareLog>();
            if (customerCareLog is null || customerCareLog.Id > 0) return;
            customerCareLog.InsertedDate = DateTime.Now;
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
