using Components;
using MVVM;
using System;

namespace LogOne.NghiepVu.Dashboard
{
    public partial class ThongKe : Component
    {
        public override void Render()
        {
            if (IsExisted())
            {
                return;
            }
            Html.Instance
                .Grid().GridRow()
                .GridCell(4).Div.ClassName("icon-box bg-cyan fg-white")
                    .Div.ClassName("icon").Span.ClassName("mif-cart").End.End
                    .Div.ClassName("content")
                        .Div.ClassName("p-2")
                        .Div.ClassName("text-upper").Text("SALES").End
                        .Div.ClassName("text-upper text-bold text-lead").Text("41,400").End.End
                        .Div.Attr("data-role", "progress").Attr("data-value", "75").Attr("data-small", "true")
                            .Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkCyan").End
                    .Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text("70% Increase in 30 Days")
                    .EndOf(".cell")

                .GridCell(4).Div.ClassName("icon-box bg-orange fg-white")
                    .Div.ClassName("icon").Span.ClassName("mif-calendar").End.End
                    .Div.ClassName("content")
                        .Div.ClassName("p-2")
                        .Div.ClassName("text-upper").Text("EVENTS").End
                        .Div.ClassName("text-upper text-bold text-lead").Text("41,400").End.End
                        .Div.Attr("data-role", "progress").Attr("data-value", "75").Attr("data-small", "true")
                            .Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkOrange").End
                    .Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text("70% Increase in 30 Days")
                    .EndOf(".cell")

                .GridCell(4).Div.ClassName("icon-box bg-green fg-white")
                    .Div.ClassName("icon").Span.ClassName("fa fa-envelope").End.End
                    .Div.ClassName("content")
                        .Div.ClassName("p-2")
                        .Div.ClassName("text-upper").Text("EVENTS").End
                        .Div.ClassName("text-upper text-bold text-lead").Text("41,400").End.End
                        .Div.Attr("data-role", "progress").Attr("data-value", "75").Attr("data-small", "true")
                            .Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkGreen").End
                    .Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text("70% Increase in 30 Days")
                    .EndOf(".cell")
                .Render();
        }
    }
}
