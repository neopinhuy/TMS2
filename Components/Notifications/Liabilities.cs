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
            var html = Html.Take("#app-bar").Div.ClassName("app-bar-container ml-auto")
                            .Anchor.ClassName("app-bar-item").Id("dropdown_toggle_LiabilitiesWarning")
                            .Span.ClassName("mif-bell").End
                            .Span.ClassName("badge bg-orange fg-white mt-2 mr-1").Text(count.ToString())
                            .EndOf(ElementType.a);
            html.Div.ClassName("pos-relative fix-pos-relative")
                .Div.ClassName("bg-red fg-white")
                    .DataAttr("role", "dropdown")
                    .DataAttr("toggle-element", "#dropdown_toggle_LiabilitiesWarning");
            html.Ul
                .Li.ClassName("header1").Text("You have " + count + " notifications").End
                .Li
                    .Ul.ClassName("menu").ForEach(LWarnings, RenderTask)
            .EndOf(".ml-auto");
        }

        private static void RenderTask(LiabilitiesWarning warning, int index)
        {
            Html.Instance.Li.Text($"{warning.Ledger.ReceiverFullName} - {warning.Ledger.Credit} - Due date {warning.DueDate}");
        }
    }
}