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
            var vm = customer.SafeCast<CustomerCareVM>();
            vm.CustomerCareLog = new CustomerCareLog();
            var customerForm = new PopupEditor<CustomerCareVM>
            {
                Entity = vm,
                Name = "CustomerCare Detail",
                Title = "Customer"
            };
            AddChild(customerForm);
        }

        public async Task AddLog(CustomerCareVM vm)
        {
            var log = vm.CustomerCareLog;
            log.CustomerId = vm.CustomerId;
            // add new entity to db
            var saved = await Client<CustomerCareLog>.Instance.CreateAsync(log);

            // Show message
            if (saved != null) Toast.Success("Add new log succeeded");
            else Toast.Warning("Add new log failed");

            // Clear all data of the customer care log
            log.Reset();
        }

        public Task<bool> SaveCustomerCare(bool defaultMessage = false)
        {
            var grid = FindComponentByName<GridView>($"{nameof(Customer)}.{nameof(CustomerCareLog)}");
            var customerCare = grid.Entity as CustomerCare;
            foreach (var log in customerCare.Customer.CustomerCareLog)
            {
                if (log.Id > 0) continue;
                log.Id = 0;
                log.InsertedDate = DateTime.Now;
            }
            return (grid.Parent as PopupEditor<CustomerCare>).Save(defaultMessage);
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
