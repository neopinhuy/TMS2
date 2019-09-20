using Components;
using MVVM;
using static Retyped.canvasjs.CanvasJS;

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
            HighLight();
            ChartPanels();
        }

        private void HighLight()
        {
            Html.Instance.Grid().GridRow()
                .GridCell(3).Div.ClassName("icon-box bg-cyan fg-white")
                    .Div.ClassName("icon").Span.ClassName("mif-cart").End.End
                    .Div.ClassName("content")
                        .Div.ClassName("p-2")
                        .Div.ClassName("text-upper").Text("SALES").End
                        .Div.ClassName("text-upper text-bold text-lead").Text("41,400").End.End
                        .Div.Attr("data-role", "progress").Attr("data-value", "75").Attr("data-small", "true")
                            .Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkCyan").End
                    .Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text("70% Increase in 30 Days")
                    .EndOf(".cell")

                .GridCell(3).Div.ClassName("icon-box bg-orange fg-white")
                    .Div.ClassName("icon").Span.ClassName("mif-calendar").End.End
                    .Div.ClassName("content")
                        .Div.ClassName("p-2")
                        .Div.ClassName("text-upper").Text("EVENTS").End
                        .Div.ClassName("text-upper text-bold text-lead").Text("41,400").End.End
                        .Div.Attr("data-role", "progress").Attr("data-value", "75").Attr("data-small", "true")
                            .Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkOrange").End
                    .Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text("70% Increase in 30 Days")
                    .EndOf(".cell")

                .GridCell(3).Div.ClassName("icon-box bg-green fg-white")
                    .Div.ClassName("icon").Span.ClassName("fa fa-envelope").End.End
                    .Div.ClassName("content")
                        .Div.ClassName("p-2")
                        .Div.ClassName("text-upper").Text("EMAIL").End
                        .Div.ClassName("text-upper text-bold text-lead").Text("41,400").End.End
                        .Div.Attr("data-role", "progress").Attr("data-value", "75").Attr("data-small", "true")
                            .Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkGreen").End
                    .Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text("70% read")
                    .EndOf(".cell")

                .GridCell(3).Div.ClassName("icon-box bg-red fg-white")
                    .Div.ClassName("icon").Span.ClassName("fa fa-envelope").End.End
                    .Div.ClassName("content")
                        .Div.ClassName("p-2")
                        .Div.ClassName("text-upper").Text("TASKS").End
                        .Div.ClassName("text-upper text-bold text-lead").Text("12").End.End
                        .Div.Attr("data-role", "progress").Attr("data-value", "20").Attr("data-small", "true")
                            .Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkRed").End
                    .Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text("Finished 20% today")
                    .EndOf(".grid")
                .Render();
        }

        private void ChartPanels()
        {
            Html.Instance.Grid().GridRow();
            Customers();
            SaleAnalysis();
        }

        private static void Customers()
        {
            Html.Instance.GridCell(6).Div.Id("Fortune500").End.End.Render();

            var chart = new Chart("Fortune500", new ChartOptions
            {
                animationEnabled = true,
                title = new ChartTitleOptions { text = "Top customers" },
                axisX = new ChartAxisXOptions { interval = 1 },
                axisY2 = new ChartAxisYOptions
                {
                    interlacedColor = "rgba(1,77,101,.2)",
                    gridColor = "rgba(1,77,101,.1)",
                    title = "Sales (USD)",
                },
                data = new ChartDataSeriesOptions[]
                {
                    new ChartDataSeriesOptions {
                        type = "bar",
                        name = "companies",
                        axisYType = "secondary",
                        color = "#014D65",
                        dataPoints = new ChartDataPoint[]
                        {
                            new ChartDataPoint { y = 3, label = "Sweden" },
                            new ChartDataPoint { y = 7, label = "Taiwan" },
                            new ChartDataPoint { y = 5, label = "Russia" },
                            new ChartDataPoint { y = 9, label = "Spain" },
                            new ChartDataPoint { y = 7, label = "Brazil" },
                            new ChartDataPoint { y = 7, label = "India" },
                            new ChartDataPoint { y = 9, label = "Italy" },
                            new ChartDataPoint { y = 8, label = "Australia" },
                            new ChartDataPoint { y = 11, label = "Canada" },
                            new ChartDataPoint { y = 15, label = "South Korea" },
                            new ChartDataPoint { y = 12, label = "Netherlands" },
                            new ChartDataPoint { y = 15, label = "Switzerland" },
                            new ChartDataPoint { y = 25, label = "Britain" },
                            new ChartDataPoint { y = 28, label = "Germany" },
                            new ChartDataPoint { y = 29, label = "France" },
                            new ChartDataPoint { y = 52, label = "Japan" },
                            new ChartDataPoint { y = 103, label = "China" },
                            new ChartDataPoint { y = 134, label = "US" },
                        }
                    }
                }
            });
            chart.render();
        }

        private void SaleAnalysis()
        {
            var id = nameof(SaleAnalysis);
            Html.Instance.GridCell(6).Div.Id(id).End.End.Render();

            var chart = new Chart(id, new ChartOptions
            {
                animationEnabled = true,
                theme = "light2",
                title = new ChartTitleOptions { text = "Sales Analysis - June 2019" },
                data = new ChartDataSeriesOptions[]
                {
                    new ChartDataSeriesOptions {
                        type = "funnel",
                        indexLabelPlacement = "insider",
                        indexLabelFontColor = "white",
                        toolTipContent =  "<b>{label}</b>: {y} <b>({percentage}%)</b>",
                        indexLabel = "{label} ({percentage}%)",
                        dataPoints = new ChartDataPoint [] {
                            new ChartDataPoint { y =  1400, label =  "Leads" },
                            new ChartDataPoint { y =  1212, label =  "Initial Communication" },
                            new ChartDataPoint { y =  1080, label =  "Customer Evaluation" },
                            new ChartDataPoint { y =  665,  label =  "Negotiation" },
                            new ChartDataPoint { y =  578, label =  "Order Received" },
                            new ChartDataPoint { y =  549, label =  "Payment" }
                        }
                    }
                }
            });
            CalculatePercentage(chart);
            chart.render();
        }

        private void CalculatePercentage(Chart chart)
        {
            var dataPoint = chart.options.data[0].dataPoints;
            var total = dataPoint[0].y;
            for (var i = 0; i < dataPoint.Length; i++)
            {
                if (i == 0)
                {
                    chart.options.data[0].dataPoints[i]["percentage"] = 100;
                }
                else
                {
                    chart.options.data[0].dataPoints[i]["percentage"] = dataPoint[i].y / total * 100;
                }
            }
        }
    }
}
