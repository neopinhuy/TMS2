using Bridge.Html5;
using Common.Clients;
using Common.Enums;
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
            Document.Head.AppendChild(new HTMLScriptElement()
            {
                Src = "./js/SkypeBootstrap.min.js",
                Async = false
            });
            Document.Head.AppendChild(new HTMLScriptElement()
            {
                Src = "./js/skype.js",
                Async = false
            });
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
                Name = "Customer Detail",
                Title = "Customer"
            };
            AddChild(customerForm);
        }

        public void Call()
        {
            var dialog = new ConfirmDialog()
            {
                Content = "Mark selected customer(s) as initial contact?",
                YesConfirmed = async() =>
                {
                    var customers = FindActiveComponent<GridView>();
                    var selected = customers.SelectMany(x => x.GetSelectedRow()).Cast<CustomerCare>();
                    selected.ForEach(x =>
                    {
                        x.Customer.LastCall = DateTime.Now;
                        if (x.Customer.CustomerStateId <= (int)CustomerStateEnum.InitContact)
                            x.Customer.CustomerStateId = (int)CustomerStateEnum.InitContact;
                    });
                    var res = await Client<Customer>.Instance.BulkUpdateAsync(selected.Select(x => x.Customer).ToList());
                    if (res)
                    {
                        Toast.Success("Update success");
                        FindComponent<GridView>().ForEach(x => x.ReloadData());
                    }
                }
            };
            AddChild(dialog);
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
