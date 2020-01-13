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
    public class CustomerCareDetailBL : TabEditor<CustomerCareVM>
    {
        public CustomerCareDetailBL()
        {
            
        }

        public async Task AddLog(CustomerCareVM vm)
        {
            var lastContact = vm.Customer;
            var log = vm.CustomerCareLog;
            CustomerCareLog saved;
            await CalcEstimatedCost(log);
            if (log.Id <= 0)
            {
                lastContact.LastContactDate = log.ContactDate;
                log.CustomerId = vm.CustomerId;
                log.InsertedDate = DateTime.Now;
                saved = await Client<CustomerCareLog>.Instance.PostAsync(log);
                await Client<Customer>.Instance.UpdateAsync(lastContact);
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

        private static async Task CalcEstimatedCost(CustomerCareLog log)
        {
            if (!log.QuotationId.HasValue) return;
            var client = new Client<Quotation>();
            var quotation = (await client.GetList($"?$expand=PriceType&$filter=Active eq true and Id eq {log.QuotationId}"))?.value?.FirstOrDefault();
            if (quotation == null) return;
            if (quotation.PriceType.Enum == (int)PriceTypeEnum.Volume)
            {
                log.EstimatedCost = log.Volume * quotation.Price;
            }
            else if (quotation.PriceType.Enum == (int)PriceTypeEnum.Weight)
            {
                log.EstimatedCost = log.Weight * quotation.Price;
            }
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
            group.Entity[nameof(CustomerCareVM.CustomerCareLog)].CopyProp(log);
            group.UpdateView();
        }

        public async Task SaveCustomerCare()
        {
            var customerCare = Entity.CastProp<CustomerCare>();
            var customer = customerCare.Customer;
            customer.CustomerCareLog = null;
            var client = new Client<CustomerCare>();
            CustomerCare saved;
            if (customerCare.Id <= 0)
            {
                saved = await client.PostAsync(customerCare);
            }
            else
            {
                saved = await client.UpdateAsync(customerCare);
            }
            if (saved != null)
            {
                Toast.Success("Save customer care succeeded");
                Parent.UpdateView();
            }
            else
                Toast.Warning("Save customer care failed");
        }
    }
}
