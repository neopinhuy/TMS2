using System;
using System.Linq;
using System.Threading.Tasks;
using Components;
using LogAPI.Models;
using LogOne.APIClients;
using MVVM;

namespace LogOne.NghiepVu.TruckManagement
{
    public partial class AllTruck : Component
    {
        public override void Render()
        {
        }

        public override async Task RenderAsync() {
            if (IsExisted()) return;
            RenderImageCorner();
            RenderTruckDetail();
            // Load truck data
            var client = new BaseClient<Truck>();
            var trucks = await client.Get();
            TruckData.Data = trucks.ToArray();
        }

        public void RenderImageCorner() 
        {
            Html.Instance.Table(TruckHeader, TruckData)
                .Grid().GridRow().GridCell(5).ClassName("image-corner")
                .H3.Text("Walter Hobb").Span.ClassName("fa fa-pencil").End.End
                .H4.Text("Programmer").End
                .Img.Src("data:image/jpeg;base64,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").End
                .Div.H5.Text("ADDRESS").End
                .Span.Text("10385 Shadow Oak Dr").End.Br
                .Span.Text("Chatsworth, CA, 91311").End.Br
                .H5.Text("PHONE").End
                .Span.Text("(818) 555-2478").End.Br
                .H5.Text("EMAIL").End
                .Span.Text("wallyh@gmail.com").EndOf(".cell");
        }

        public void RenderTruckDetail() 
        {
            Html.Instance.GridCell(7)
            .Tab().TabItem("Truck info", "truckInfo", true)
                .TabItem("Maintenance", "truck-maintenance")
                .TabItem("Accessory", "truck-accessory").EndOf(ElementType.ul)
            .TabContent().HeightPercentage(100)
                .Panel().Id("truckInfo").HeightPercentage(100).PaddingRem(Direction.top, 0.8)
                .Table.TRow.TData.Text("Truck plate").End
                .TData.SmallInput("0982-K8").EndOf(ElementType.td)
                .TData.Text("Freight state").End
                .TData.SmallInput("Moving").EndOf(ElementType.td)
                .TData.Text("Band name").End
                .TData.SmallInput("Ford").EndOf(ElementType.tr)
                .TRow.TData.Text("Version").End
                .TData.SmallInput("Everest").EndOf(ElementType.td)
                .TData.Text("Vendor").End
                .TData.SmallInput("Me koog distributor").EndOf(ElementType.td)
                .TData.Text("Price").End
                .TData.SmallInput("1.200.000.000").EndOf(ElementType.tr)
                .TRow.TData.Text("Currency").End
                .TData.SmallInput("VND").EndOf(ElementType.td)
                .TData.Text("Active date").End
                .TData.SmallInput("20/01/2018").EndOf(ElementType.td)
                .TData.Text("Expiry date").End
                .TData.SmallInput("20/01/2018").EndOf(".panel");

            Html.Instance.Panel().Id("truck-maintenance")
                .Table.TRow.TData.Text("Maintenance start date").End
                .TData.SmallDatePicker(DateTime.Now.ToString()).EndOf(ElementType.td)
                .TData.Text("Maintenance end date").End
                .TData.SmallInput(DateTime.Now.AddDays(3).ToString()).EndOf(ElementType.td);
        }
    }
}
