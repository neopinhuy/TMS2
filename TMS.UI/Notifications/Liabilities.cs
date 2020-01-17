using Common.Clients;
using Common.Extensions;
using Components.Forms;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using TMS.UI.Business.Accounting;
using TMS.UI.Business.Asset;

namespace TMS.UI.Notifications
{
    public class LiabilitiesNotification : Components.Component
    {
        private PopupEditor<Truck> _truckForm;
        public List<LiabilitiesWarning> LWarnings { get; set; } = new List<LiabilitiesWarning>();
        public List<Truck> LWarningsTruck { get; set; } = new List<Truck>();

        public override void Render()
        {
            RenderAsync();
        }

        public async Task RenderAsync()
        {
            var setting = await Client<MasterData>.Instance.GetList("?$filter=Active eq true and Name eq 'MaintenanceSettings'");
            var parsed = int.TryParse(setting.value.FirstOrDefault()?.Description, out int res);
            DateTime today = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 00, 00, 00, 000);
            DateTime commingtoday = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 23, 59, 59, 999);
            var commingDate = today.AddDays(parsed ? res : 3);
            var client = new Client("Ledger");
            var count = await client.GetAsync(null, "Countliabilitieswarning");
            var warnings = await Client<LiabilitiesWarning>.Instance.GetList($"?$expand=ProcessStatus($select=Id,Name),Ledger($select=ReceiverFullName),Ledger($expand=AccountType($select=Description),ReceiverBank($select=Name))&$filter= Active eq true " + $"and ProcessStatus/Name eq 'UnreadStatus' " + $"&$orderby=InsertedDate&$top=5");
            var warningsTruck = await Client<Truck>.Instance.GetList($"?$expand=Driver($select=LastName,FirstName)&$filter= Active eq true and NextMaintenanceDate lt " + commingDate.ToISOFormat() + $" and NextMaintenanceDate gt " + today.ToISOFormat()+$"&$orderby=InsertedDate&$top=5");
            var clientTruck = new Client("TruckMaintenance");
            var countTruck = await clientTruck.GetAsync(null, "CountMaintenanceWarning");
            LWarnings = warnings.value;
            LWarningsTruck = warningsTruck.value;
            var html = Html.Take("#app-bar").Div.ClassName("app-bar-container ml-auto")
                            .Anchor.ClassName("app-bar-item").Id("dropdown_toggle_LiabilitiesWarning")
                            .Span.ClassName("mif-bell").End
                            .Span.ClassName("badge bg-orange fg-white mt-2 mr-1").Text((int.Parse(count.ToString()) + int.Parse(countTruck.ToString())).ToString())
                            .EndOf(ElementType.a);
                                html.Div.ClassName("pos-relative fix-pos-relative shadow")
                                    .DataAttr("role", "dropdown")
                                        .DataAttr("toggle-element", "#dropdown_toggle_LiabilitiesWarning")
                                    .Div.ClassName("fg-black");
                                    
                            html.Ul.ClassName("ul-Warning")
                                .Li.ClassName("header1").Text("You have " + (int.Parse(count.ToString()) + int.Parse(countTruck.ToString())).ToString() + " notifications").End
                                .Li.ClassName("li-Root").Span.ClassName("span-warning").Text("Liabilities warning").End.Span.ClassName("badge bg-orange fg-white mt-2 mr-1 fix-float-left").Text(count.ToString()).End

                                    .Ul.ClassName("menu")
                                            .ForEach(LWarnings, (li, index) =>
                                            {
                                                html.Li.ClassName("liItems").Anchor.ClassName("a-items").Href("javascript:;")
                                                            .Event(Bridge.Html5.EventType.Click, OpenLWarning, li)
                                                            .Div.ClassName("pull-left").I.ClassName("icon fa fa-hand-holding-usd text-red").EndOf(".pull-left")
                                                            .H4.ClassName("h4-items").Text(li.DueDate?.ToString("dd/MM/yyyy")).End
                                                            .P.ClassName("p-warning").Text(li.Ledger.ReceiverFullName + "-" + li.Ledger.AccountType.Description + "-" + li.Ledger.ReceiverBank.Name).EndOf(ElementType.li);
                                            }).Li.ClassName("footer-viewall").Anchor.Href("javascript:;").Text("See All")
                                                                             .Event(Bridge.Html5.EventType.Click, OpenLiabilitiWarning)
                                            .EndOf(".li-Root")
                                .Li.ClassName("li-Root").Span.ClassName("span-warning").Text("Truck maintenance warning").End.Span.ClassName("badge bg-orange fg-white mt-2 mr-1 fix-float-left").Text(countTruck.ToString()).End
                                    .Ul.ClassName("menu")
                                            .ForEach(LWarningsTruck, (li, index) =>
                                            {
                                                html.Li.ClassName("liItems").Anchor.Href("javascript:;")
                                                            .Event(Bridge.Html5.EventType.Click, OpenTruckWarning, li)
                                                            .Div.ClassName("pull-left").I.ClassName("fa fa-truck text-yellow").EndOf(".pull-left")
                                                            .H4.ClassName("h4-items").Text(li.NextMaintenanceDate?.ToString("dd/MM/yyyy")).End
                                                            .P.ClassName("p-warning").Text(li.Driver?.FirstName + " " + li.Driver?.LastName + "-" + (li.TruckPlate ?? "") + "-" + (li.Color ?? "")).EndOf(ElementType.li);
                                            }).Li.ClassName("footer-viewall").Anchor.Href("javascript:;").Text("See All")
                                                                             .Event(Bridge.Html5.EventType.Click, OpenTruck)
                            .EndOf(".ml-auto");
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
            var tab = new LiabilitiesBL();
            tab.Render();
            tab.Focus();

            var detail = new PopupEditor<LiabilitiesWarning>
            {
                Id = lw.Id,
                Name = "LW Detail",
                Title = $"Warning - {lw.Ledger.ReceiverFullName}"
            };
            tab.AddChild(detail);
        }
        private void OpenTruckWarning(Truck truck)
        {
            var tab = new TruckBL();
            tab.Render();
            tab.Focus();
            _truckForm = new PopupEditor<Truck>
            {
                Entity = truck
            };
            tab.AddChild(_truckForm);
        }

    }
}