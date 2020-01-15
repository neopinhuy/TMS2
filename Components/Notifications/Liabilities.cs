using Common.Clients;
using MVVM;
using System.Collections.Generic;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components.Notifications
{
    public class LiabilitiesNotification : Component
    {
        public List<LiabilitiesWarning> LWarnings { get; set; } = new List<LiabilitiesWarning>();

        public override void Render()
        {
            RenderAsync();
        }

        public async Task RenderAsync()
        {
            var client = new Client("Ledger");
            var count = await client.GetAsync(null, "Countliabilitieswarning");
            var warnings = await Client<LiabilitiesWarning>.Instance.GetList($"?$expand=ProcessStatus($select=Id,Name),Ledger($select=ReceiverFullName)&$filter= Active eq true " +
                                                                                                                                $"and ProcessStatus/Parent/Name eq 'LiabilitiesWarningStatus' " +
                                                                                                                                $"and ProcessStatus/Name eq 'UnreadStatus' ");
            LWarnings = warnings.value;
            var html = Html.Take("#app-bar").Div.ClassName("app-bar-container ml-auto")
                            .Anchor.ClassName("app-bar-item").Id("dropdown_toggle_LiabilitiesWarning")
                            .Span.ClassName("mif-bell").End
                            .Span.ClassName("badge bg-orange fg-white mt-2 mr-1").Text(count.ToString())
                            .EndOf(ElementType.a);
            html.Div.ClassName("pos-relative fix-pos-relative")
                .Div.ClassName("fg-black")
                    .DataAttr("role", "dropdown")
                    .DataAttr("toggle-element", "#dropdown_toggle_LiabilitiesWarning");
            html.Ul.ClassName("ul-Warning")
                .Li.ClassName("header1").Text("You have " + count + " notifications").End
                .Li.ClassName("li-Root")
                    .Ul.ClassName("menu")
                            .ForEach(LWarnings, (li, index) =>
                            {
                                html.Li.ClassName("liItems").Anchor.Href("#")
                                            .H4.ClassName("h4-items").Text(li.DueDate.ToString()).End
                                            .P.ClassName("p-warning").Text(li.Ledger.ReceiverFullName).EndOf(ElementType.li);
                            })
            .EndOf(".ml-auto");
        }
    }
}