using Bridge.Html5;
using Common.Clients;
using ElementType = MVVM.ElementType;
using Components.Forms;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using TMS.UI.Business.Accounting;
using TMS.UI.Business.Asset;
using TMS.UI.Business.Sale;
using Common.ViewModels;

namespace TMS.UI.Notifications
{
    public class LiabilitiesNotification : Components.Component
    {
        private PopupEditor<Truck> _truckForm;
        private PopupEditor<Ledger> _LiabilitiesForm;
        public WarningAndNotificationsVM WarningAndNotificationsVM { get; set; }
        public List<LiabilitiWarningVM> LWarnings { get; set; } = new List<LiabilitiWarningVM>();
        public List<TruckWarningVM> LWarningsTruck { get; set; } = new List<TruckWarningVM>();

        public List<CustomerCareWarningVM> LWarningsCustomerCare { get; set; } = new List<CustomerCareWarningVM>();

        public override void Render()
        {
            RenderAsync();

        }

        public async Task RenderAsync()
        {
            var clientLiabilities = new Client("LiabilitiesWarning");
            var objNotification = await clientLiabilities.GetAsync(null, "Notifications");

            WarningAndNotificationsVM = objNotification.As<WarningAndNotificationsVM>();
            
            LWarnings = WarningAndNotificationsVM.LWarningsLiabilities.ToList();
            LWarningsTruck = WarningAndNotificationsVM.LWarningsTruck.ToList();
            LWarningsCustomerCare = WarningAndNotificationsVM.LWarningsCustomerCare.ToList();

            var count = WarningAndNotificationsVM.CountLWarningsLiabilities;
            var countTruck = WarningAndNotificationsVM.CountLWarningsTruck;
            var countCustomer = WarningAndNotificationsVM.CountLWarningsCustomerCare;
            Html html = RenderLibitiesWarning(count, countTruck);
            RenderCustomerWarning(countCustomer, html);
            RenderProfile(html); html.EndOf(".ml-auto");
        }

        private static void RenderProfile(Html html)
        {
            #region profile user
            html.A.ClassName("app-bar-item").Id("dropdown_toggle_Profile")
                            .Img.Src("./image/chinese.jfif").ClassName("user-image").Id("user-image").End.Span.ClassName("hidden -xs").Id("name-user").Text("Nguyễn Văn A")
                            .EndOf(ElementType.a);
            html.Div.ClassName("pos-relative fix-pos-relative shadow")
                                    .DataAttr("role", "dropdown")
                                        .DataAttr("toggle-element", "#dropdown_toggle_Profile")
                                    .Div.ClassName("fg-black");
            html.Ul.ClassName("ul-Warning")
                .Li.ClassName("user-header").Img.Src("./image/chinese.jfif").ClassName("img-circle").End
                .P.Id("Username-text").Text("Nguyễn Văn A").End.Span.Id("text-address").Text("227 Nguyễn Văn Cừ").End
                .EndOf(".user-header")
                .Li.ClassName("user-footer").Div.ClassName("pull-right").A.Href("javascript;").ClassName("btn-signout").Text("Sign out").EndOf(".pos-relative");
            #endregion
        }

        private void RenderCustomerWarning(object countCustomer, Html html)
        {
            #region customers warning
            html.A.ClassName("app-bar-item").Id("dropdown_toggle_CustomersWarning")
                            .Span.ClassName("fa fa-users white").End
                            .Span.ClassName("badge bg-green fg-white mt-2 mr-1").Id("span-count-customercarewarning").Text(countCustomer.ToString())
                            .EndOf(ElementType.a);
            html.Div.ClassName("pos-relative fix-pos-relative shadow")
                                                .DataAttr("role", "dropdown")
                                                    .DataAttr("toggle-element", "#dropdown_toggle_CustomersWarning")
                                                .Div.ClassName("fg-black");

            html.Ul.ClassName("ul-Warning")
                .Li.ClassName("header1").Text("You have ").Span.Id("count-customercarewarning").Text(countCustomer.ToString()).End.Text(" notifications").End
                .Li.ClassName("li-Root").Span.ClassName("span-warning").Text("Customercare warning").End.Span.ClassName("badge bg-orange fg-white mt-2 mr-1 fix-float-left").Id("count-customercarewarning-2").Text(countCustomer.ToString()).End
                .Ul.ClassName("menu")
                .ForEach(LWarningsCustomerCare, (li, index) =>
                {
                    html.Li.ClassName("liItems").A.ClassName("a-items").Href("javascript:;")
                                .Event(Bridge.Html5.EventType.Click, OpenCWarning, li)
                                .Div.ClassName("pull-left").Img.Src("./image/" + li.Avatar).ClassName("img-circle").EndOf(".pull-left")
                                .H4.ClassName("h4-items").Text(li.LastContactDate?.ToString("dd/MM/yyyy")).End
                                .P.ClassName("p-warning").Text(li.GroupName + "-" + li.FirstName + " " + li.LastName).EndOf(ElementType.li);
                }).Li.ClassName("footer-viewall").A.Href("javascript:;").Text("See All")
                                                 .Event(Bridge.Html5.EventType.Click, OpenCALLWarning)
                .EndOf(".li-Root").EndOf(".pos-relative");
            #endregion
        }

        private Html RenderLibitiesWarning(object count, object countTruck)
        {
            var html = Html.Take("#app-bar").Div.ClassName("app-bar-container ml-auto")

            #region libilities + truck maintenance warning
                            .A.ClassName("app-bar-item").Id("dropdown_toggle_LiabilitiesWarning")
                            .Span.ClassName("mif-bell").End
                            .Span.ClassName("badge bg-orange fg-white mt-2 mr-1").Id("span-count").Text((int.Parse(count.ToString()) + int.Parse(countTruck.ToString())).ToString())
                            .EndOf(ElementType.a);
            html.Div.ClassName("pos-relative fix-pos-relative shadow")
                .DataAttr("role", "dropdown")
                    .DataAttr("toggle-element", "#dropdown_toggle_LiabilitiesWarning")
                .Div.ClassName("fg-black");

            html.Ul.ClassName("ul-Warning")
                .Li.ClassName("header1").Text("You have ").Span.Id("span-count-liabilitiesWarning").Text((int.Parse(count.ToString()) + int.Parse(countTruck.ToString())).ToString()).End.Text(" notifications").End
                .Li.ClassName("li-Root").Span.ClassName("span-warning").Text("Liabilities warning").End.Span.ClassName("badge bg-orange fg-white mt-2 mr-1 fix-float-left").Id("count-LiabilitiesWarning").Text(count.ToString()).End

                    .Ul.ClassName("menu")
                            .ForEach(LWarnings, (li, index) =>
                            {
                                html.Li.ClassName("liItems").A.ClassName("a-items").Href("javascript:;")
                                            .Event(Bridge.Html5.EventType.Click, OpenLWarning, li)
                                            .Div.ClassName("pull-left").I.ClassName("icon fa fa-hand-holding-usd text-red").EndOf(".pull-left")
                                            .H4.ClassName("h4-items").Text(li.DueDate?.ToString("dd/MM/yyyy")).End
                                            .P.ClassName("p-warning").Text(li.ReceiverFullName + "-" + li.AccountType + "-" + li.ReceiverBank).EndOf(ElementType.li);
                            }).Li.ClassName("footer-viewall").A.Href("javascript:;").Text("See All")
                                                             .Event(Bridge.Html5.EventType.Click, OpenLiabilitiWarning)
                            .EndOf(".li-Root")
                .Li.ClassName("li-Root").Span.ClassName("span-warning").Text("Truck maintenance warning").End.Span.ClassName("badge bg-orange fg-white mt-2 mr-1 fix-float-left").Id("count-TruckWarning").Text(countTruck.ToString()).End
                    .Ul.ClassName("menu")
                            .ForEach(LWarningsTruck, (li, index) =>
                            {
                                html.Li.ClassName("liItems").A.Href("javascript:;")
                                            .Event(Bridge.Html5.EventType.Click, OpenTruckWarning, li)
                                            .Div.ClassName("pull-left").I.ClassName("fa fa-truck text-yellow").EndOf(".pull-left")
                                            .H4.ClassName("h4-items").Text(li.NextMaintenanceDate?.ToString("dd/MM/yyyy")).End
                                            .P.ClassName("p-warning").Text(li.FirstName + " " + li.LastName + "-" + (li.TruckPlate ?? "") + "-" + (li.Color ?? "")).EndOf(ElementType.li);
                            }).Li.ClassName("footer-viewall").A.Href("javascript:;").Text("See All")
                                                             .Event(Bridge.Html5.EventType.Click, OpenTruck).EndOf(".pos-relative");
            #endregion
            return html;
        }

        private void OpenCALLWarning()
        {
            var tab = new CustomerCareWarningBL();
            tab.Render();
            tab.Focus();
        }

        private void OpenCWarning(Event evt,CustomerCareWarning cus)
        {
            try
            {
                UpdateStatusCustomerAsync(cus);
                Document.GetElementById("span-count-customercarewarning").TextContent = (int.Parse(Document.GetElementById("span-count-customercarewarning").TextContent) - 1).ToString();
                Document.GetElementById("count-customercarewarning").TextContent = Document.GetElementById("span-count-customercarewarning").TextContent;
                Document.GetElementById("count-customercarewarning-2").TextContent = Document.GetElementById("span-count-customercarewarning").TextContent.ToString();
            }
            catch (Exception)
            {

                throw;
            }

            
            var tab = new CustomerCareWarningBL();
            tab.Render();
            tab.Focus();
        }

        private void OpenTruck()
        {
            var tab = new TruckBL();
            tab.Render();
            tab.Focus();
        }

        private void OpenLiabilitiWarning()
        {
            var tab = new LiabilitiesBL();
            tab.Render();
            tab.Focus();
        }

        private void OpenLWarning(LiabilitiesWarning lw)
        {
            try
            {
                UpdateStatusLiabilitiesAsync(lw);
                Document.GetElementById("span-count").TextContent = (int.Parse(Document.GetElementById("span-count").TextContent) - 1).ToString();
                Document.GetElementById("span-count-liabilitiesWarning").TextContent = Document.GetElementById("span-count").TextContent;
                Document.GetElementById("count-LiabilitiesWarning").TextContent = (int.Parse(Document.GetElementById("count-LiabilitiesWarning").TextContent) - 1).ToString();
            }
            catch (Exception)
            {

                throw;
            }
            var tab = new LiabilitiesBL();
            tab.Render();
            tab.Focus();

            _LiabilitiesForm = new PopupEditor<Ledger>
            {
                Id = lw.LedgerId ?? 0,
                Entity = lw.Ledger,
                Name = "EditLedger",
                Title = $"Warning - {lw.Ledger.ReceiverFullName}"
            };
            tab.AddChild(_LiabilitiesForm);
        }
        private async Task UpdateStatusLiabilitiesAsync(LiabilitiesWarning liabilities)
        {
            var setting = await Client<MasterData>.Instance.GetList("?$filter=Active eq true and Name eq 'Read'");
            var parsed = setting.value.FirstOrDefault()?.Id;
            liabilities.ProcessStatusId = parsed;
            await Client<LiabilitiesWarning>.Instance.UpdateAsync(liabilities);
        }
        private async Task UpdateStatusTruckAsync(TruckMaintenanceWarning truckMaintenanceWarning)
        {
            var setting = await Client<MasterData>.Instance.GetList("?$filter=Active eq true and Name eq 'Read'");
            var parsed = setting.value.FirstOrDefault()?.Id;
            truckMaintenanceWarning.ProcessStatusId = parsed;
            await Client<TruckMaintenanceWarning>.Instance.UpdateAsync(truckMaintenanceWarning);
        }
        private async Task UpdateStatusCustomerAsync(CustomerCareWarning customerCareWarning)
        {
            var setting = await Client<MasterData>.Instance.GetList("?$filter=Active eq true and Name eq 'Read'");
            var parsed = setting.value.FirstOrDefault()?.Id;
            customerCareWarning.ProcessStatusId = parsed;
            await Client<CustomerCareWarning>.Instance.UpdateAsync(customerCareWarning);
        }
        private void OpenTruckWarning(TruckMaintenanceWarning entity)
        {
            try
            {
                UpdateStatusTruckAsync(entity);
                Document.GetElementById("span-count").TextContent = (int.Parse(Document.GetElementById("span-count").TextContent) - 1).ToString();
                Document.GetElementById("span-count-liabilitiesWarning").TextContent = Document.GetElementById("span-count").TextContent;
                 Document.GetElementById("count-TruckWarning").TextContent= (int.Parse(Document.GetElementById("count-TruckWarning").TextContent) - 1).ToString();
            }
            catch (Exception)
            {

                throw;
            }
            var tab = new TruckBL();
            tab.Render();
            tab.Focus();
            _truckForm = new PopupEditor<Truck>
            {
                Id = entity.TruckId ?? 0,
                Entity = entity.Truck,
                Name = "Truck Detail",
                Title = $"Warning - {entity.Truck.TruckPlate}"
            };
            tab.AddChild(_truckForm);
        }

    }
}