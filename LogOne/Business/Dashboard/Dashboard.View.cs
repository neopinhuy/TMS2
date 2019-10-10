using Bridge.Html5;
using Components;
using Common.Models;
using MVVM;
using static Retyped.canvasjs.CanvasJS;

namespace LogOne.Business.Dashboard
{
    public partial class Dashboard : Component
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
            Html.Instance.Div.Id(nameof(Dashboard)).Grid().GridRow();
            Customers();
            SaleAnalysis();
            SaleLeaderBoard();
            MarketShare();
            MonthlySaleData();
            MonthlyExpense();
        }

        private static void Customers()
        {
            string id = nameof(Customers);
            Html.Instance.GridCell(4).Panel().Div.Id(id).EndOf(".cell");

            var chart = new Chart(id, new ChartOptions
            {
                height = 300,
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
            string id = nameof(SaleAnalysis);
            Html.Instance.GridCell(4).Panel().Div.Id(id).EndOf(".cell");

            var chart = new Chart(id, new ChartOptions
            {
                height = 300,
                animationEnabled = true,
                theme = "light2",
                title = new ChartTitleOptions { text = "Sales Analysis - June 2019" },
                data = new ChartDataSeriesOptions[]
                {
                    new ChartDataSeriesOptions {
                        type = "funnel",
                        indexLabelPlacement = "inside",
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
            double? total = dataPoint[0].y;
            for (int i = 0; i < dataPoint.Length; i++)
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

        private void SaleLeaderBoard()
        {
            string id = nameof(SaleLeaderBoard);
            Html.Instance.GridCell(4).Panel().Div.Id(id).EndOf(".grid");

            var chart = new Chart(id, new ChartOptions
            {
                height = 300,
                animationEnabled = true,
                theme = "light2",
                title = new ChartTitleOptions { text = "Sale leaderboard" },
                axisX = new ChartAxisXOptions { interval = 1 },
                axisY = new ChartAxisYOptions
                {
                    title = "Sale value (USD)"
                },
                data = new ChartDataSeriesOptions[]
                {
                    new ChartDataSeriesOptions {
                        type = "bar",
                        toolTipContent = "<img src=\"https://canvasjs.com/wp-content/uploads/images/gallery/javascript-column-bar-charts/\"{url}\"\" style=\"width:40px; height:20px;\"> <b>{label}</b><br>Budget: ${y}bn<br>{gdp}% of GDP",
                        indexLabelFontColor = "white",
                        dataPoints = new ChartDataPoint [] {
                            new SaleLeaderBoardDataPoint { label= "South Korea", y= 36.8, gdp= 2.7, url= "skorea.png" },
                            new SaleLeaderBoardDataPoint { label= "Germany", y= 41.1, gdp= 1.2, url= "germany.png" },
                            new SaleLeaderBoardDataPoint { label= "Japan", y= 46.1, gdp= 1.0, url= "japan.png" },
                            new SaleLeaderBoardDataPoint { label= "United Kingdom", y= 48.3, gdp= 1.9, url= "uk.png" },
                            new SaleLeaderBoardDataPoint { label= "India", y= 55.9, gdp= 2.5, url= "india.png" },
                            new SaleLeaderBoardDataPoint { label= "Russia", y= 69.2, gdp= 5.3, url= "russia.png" },
                            new SaleLeaderBoardDataPoint { label= "China", y= 215.7, gdp= 1.9, url= "china.png" },
                            new SaleLeaderBoardDataPoint { label= "United States", y= 611.2, gdp= 3.3, url= "us.png" }
                        }
                    }
                }
            });
            chart.render();
        }

        private void MarketShare()
        {
            string id = nameof(MarketShare);
            Html.Instance.Grid().GridRow().GridCell(4).Panel().Div.Id(id).EndOf(".cell");

            var chart = new Chart(id, new ChartOptions
            {
                height = 300,
                animationEnabled = true,
                exportEnabled = true,
                theme = "light2",
                title = new ChartTitleOptions { text = "Desktop Browser Market Share in 2016" },
                data = new ChartDataSeriesOptions[]
                {
                    new ChartDataSeriesOptions {
                        type = "pie",
                        startAngle = 25,
                        toolTipContent = "<b>{label}</b>: {y}%",
                        showInLegend= true,
                        legendText= "{label}",
                        indexLabelFontSize= 16,
                        indexLabel= "{label} - {y}%",
                        dataPoints = new ChartDataPoint [] {
                            new ChartDataPoint { y= 51.08, label= "Chrome" },
                            new ChartDataPoint { y= 27.34, label= "Internet Explorer" },
                            new ChartDataPoint { y= 10.62, label= "Firefox" },
                            new ChartDataPoint { y= 5.02, label= "Microsoft Edge" },
                            new ChartDataPoint { y= 4.07, label= "Safari" },
                            new ChartDataPoint { y= 1.22, label= "Opera" },
                            new ChartDataPoint { y= 0.44, label= "Others" }
                        }
                    }
                }
            });
            chart.render();
        }

        private void MonthlySaleData()
        {
            string id = nameof(MonthlySaleData);
            Html.Instance.GridCell(4).Panel().Div.Id(id).EndOf(".cell");

            var chart = new Chart(id, new ChartOptions
            {
                height = 300,
                animationEnabled = true,
                exportEnabled = true,
                theme = "light2",
                title = new ChartTitleOptions { text = "Monthly Sales Data" },
                axisX = new ChartAxisXOptions { valueFormatString = "MMM" },
                axisY = new ChartAxisYOptions { prefix = "$" },
                toolTip = new ChartToolTipOptions { shared = true },
                legend = new ChartLegendOptions { cursor = "pointer" },
                data = new ChartDataSeriesOptions[]
                {
                    new ChartDataSeriesOptions {
                        type = "column",
                        name = "Actual Sales",
                        showInLegend= true,
                        xValueFormatString= "MMMM YYYY",
                        yValueFormatString= "$#,##0",
                        dataPoints = new ChartDataPoint [] {
                            new ChartDataPoint { x= new Date(2016, 0).GetTime(), y= 20000 },
                            new ChartDataPoint { x= new Date(2016, 1).GetTime(), y= 30000 },
                            new ChartDataPoint { x= new Date(2016, 2).GetTime(), y= 25000 },
                            new ChartDataPoint { x= new Date(2016, 3).GetTime(), y= 70000, indexLabel= "High Renewals" },
                            new ChartDataPoint { x= new Date(2016, 4).GetTime(), y= 50000 },
                            new ChartDataPoint { x= new Date(2016, 5).GetTime(), y= 35000 },
                            new ChartDataPoint { x= new Date(2016, 6).GetTime(), y= 30000 },
                            new ChartDataPoint { x= new Date(2016, 7).GetTime(), y= 43000 },
                            new ChartDataPoint { x= new Date(2016, 8).GetTime(), y= 35000 },
                            new ChartDataPoint { x= new Date(2016, 9).GetTime(), y=  30000},
                            new ChartDataPoint { x= new Date(2016, 10).GetTime(), y= 40000 },
                            new ChartDataPoint { x= new Date(2016, 11).GetTime(), y= 50000 }
                        }
                    },
                    new ChartDataSeriesOptions
                    {
                        type= "line",
                        name= "Expected Sales",
                        showInLegend= true,
                        yValueFormatString= "$#,##0",
                        dataPoints = new ChartDataPoint [] {
                            new ChartDataPoint { x= new Date(2016, 0).GetTime(), y= 40000 },
                            new ChartDataPoint { x= new Date(2016, 1).GetTime(), y= 42000 },
                            new ChartDataPoint { x= new Date(2016, 2).GetTime(), y= 45000 },
                            new ChartDataPoint { x= new Date(2016, 3).GetTime(), y= 45000 },
                            new ChartDataPoint { x= new Date(2016, 4).GetTime(), y= 47000 },
                            new ChartDataPoint { x= new Date(2016, 5).GetTime(), y= 43000 },
                            new ChartDataPoint { x= new Date(2016, 6).GetTime(), y= 42000 },
                            new ChartDataPoint { x= new Date(2016, 7).GetTime(), y= 43000 },
                            new ChartDataPoint { x= new Date(2016, 8).GetTime(), y= 41000 },
                            new ChartDataPoint { x= new Date(2016, 9).GetTime(), y= 45000 },
                            new ChartDataPoint { x= new Date(2016, 10).GetTime(), y= 42000 },
                            new ChartDataPoint { x= new Date(2016, 11).GetTime(), y= 50000 }
                        }
                    },
                    new ChartDataSeriesOptions
                    {
                        type= "area",
                        name= "Profit",
                        markerBorderColor= "white",
                        markerBorderThickness= 2,
                        showInLegend= true,
                        yValueFormatString= "$#,##0",
                        dataPoints = new ChartDataPoint [] {
                            new ChartDataPoint { x= new Date(2016, 0).GetTime(), y= 5000 },
                            new ChartDataPoint { x= new Date(2016, 1).GetTime(), y= 7000 },
                            new ChartDataPoint { x= new Date(2016, 2).GetTime(), y= 6000},
                            new ChartDataPoint { x= new Date(2016, 3).GetTime(), y= 30000 },
                            new ChartDataPoint { x= new Date(2016, 4).GetTime(), y= 20000 },
                            new ChartDataPoint { x= new Date(2016, 5).GetTime(), y= 15000 },
                            new ChartDataPoint { x= new Date(2016, 6).GetTime(), y= 13000 },
                            new ChartDataPoint { x= new Date(2016, 7).GetTime(), y= 20000 },
                            new ChartDataPoint { x= new Date(2016, 8).GetTime(), y= 15000 },
                            new ChartDataPoint { x= new Date(2016, 9).GetTime(), y=  10000},
                            new ChartDataPoint { x= new Date(2016, 10).GetTime(), y= 19000 },
                            new ChartDataPoint { x= new Date(2016, 11).GetTime(), y= 22000 }
                        }
                    }
                }
            });
            chart.render();
        }

        private void MonthlyExpense()
        {
            string id = nameof(MonthlyExpense);
            Html.Instance.GridCell(4).Panel().Div.Id(id).EndOf(".cell");

            var chart = new Chart(id, new ChartOptions
            {
                height = 300,
                animationEnabled = true,
                exportEnabled = true,
                theme = "light2",
                title = new ChartTitleOptions { text = "Monthly Expense" },
                axisX = new ChartAxisXOptions { valueFormatString = "MMM" },
                axisY = new ChartAxisYOptions { prefix = "$" },
                toolTip = new ChartToolTipOptions { shared = true },
                legend = new ChartLegendOptions { cursor = "pointer" },
                data = new ChartDataSeriesOptions[]
                {
                    new ChartDataSeriesOptions {
                        type= "doughnut",
                        innerRadius= 90,
                        showInLegend= true,
                        toolTipContent= "<b>{name}</b>= ${y} (#percent%)",
                        indexLabel= "{name} - #percent%",
                        dataPoints = new ChartDataPoint [] {
                            new ChartDataPoint { y= 450, name= "Food" },
                            new ChartDataPoint { y= 120, name= "Insurance" },
                            new ChartDataPoint { y= 300, name= "Travelling" },
                            new ChartDataPoint { y= 800, name= "Housing" },
                            new ChartDataPoint { y= 150, name= "Education" },
                            new ChartDataPoint { y= 150, name= "Shopping"},
                            new ChartDataPoint { y= 250, name= "Others" }
                        }
                    }
                }
            });
            chart.render();
        }
    }
}
