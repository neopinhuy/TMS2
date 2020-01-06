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
            CustomerCareLog saved;
            if (log.Id <= 0)
            {
                log.CustomerId = vm.CustomerId;
                log.InsertedDate = DateTime.Now;
                saved = await Client<CustomerCareLog>.Instance.CreateAsync(log);
            }
            else
            {
                saved = await Client<CustomerCareLog>.Instance.UpdateAsync(log);
            }
            if (saved != null) Toast.Success("Add/Update customer care log succeeded!");
            else Toast.Warning("Failed to add/update customer care log! Please try again!");

            log.ContactTypeId = null;
            log.ContactNumber = null;
            log.Message = null;
            log.CommodityTypeId = null;
            log.Volume = null;
            log.Weight = null;
            log.Distance = null;
            log.StatusId = null;
            log.QuotationId = null;
            log.EstimatedCost = null;
            log.OrderPeriodId = null;
            UpdateNewLogForm();
        }

        private void UpdateNewLogForm()
        {
            var group = FindComponentByName<Section>("New log");
            group.UpdateView();
            var grid = FindComponentByName<GridView>("Customer.CustomerCareLog");
            grid?.ReloadData();
            var addButton = group.FindComponentByName<Button>("Add");
            addButton.Label = "Add";
        }

        public void EditContactLog(CustomerCareLog log)
        {
            var group = FindComponentByName<Section>("New log");
            var addButton = group.FindComponentByName<Button>("Add");
            addButton.Label = "Update";
            group.Entity[nameof(CustomerCareVM.CustomerCareLog)].CopyPropFrom(log);
            group.UpdateView();
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
