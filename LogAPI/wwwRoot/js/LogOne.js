/**
 * @version 1.0.0.0
 * @copyright Copyright ©  2019
 * @compiler Bridge.NET 17.9.0
 */
Bridge.assembly("LogOne", function ($asm, globals) {
    "use strict";

    require(["canvasjs"], function (CanvasJS) {
        Bridge.define("LogOne.App", {
            main: function Main () {
                var $step = 0,
                    $task1, 
                    $jumpFromFinally, 
                    $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                    $returnValue, 
                    truck, 
                    $async_e, 
                    $asyncBody = Bridge.fn.bind(this, function () {
                        try {
                            for (;;) {
                                $step = System.Array.min([0,1], $step);
                                switch ($step) {
                                    case 0: {
                                        new LogOne.Business.Dashboard.Dashboard().Render();
                                        new LogOne.Business.MenuComponent().Render();
                                        truck = new LogOne.Business.TruckManagement.AllTruck();
                                        $task1 = truck.RenderAsync();
                                        $step = 1;
                                        if ($task1.isCompleted()) {
                                            continue;
                                        }
                                        $task1.continue($asyncBody);
                                        return;
                                    }
                                    case 1: {
                                        $task1.getAwaitedResult();
                                        truck.Focus();
                                        $tcs.setResult(null);
                                        return;
                                    }
                                    default: {
                                        $tcs.setResult(null);
                                        return;
                                    }
                                }
                            }
                        } catch($async_e1) {
                            $async_e = System.Exception.create($async_e1);
                            $tcs.setException($async_e);
                        }
                    }, arguments);
    
                $asyncBody();
                return $tcs.task;
            }
        });
    
        Bridge.define("LogOne.Business.Dashboard.Dashboard", {
            inherits: [Components.Component],
            statics: {
                methods: {
                    Customers: function () {
                        var id = "Customers";
                        Components.Renderer.Panel(Components.Renderer.GridCell(MVVM.Html.Instance, 4)).Div.Id(id).EndOf$1(".cell");
    
                        var chart = new CanvasJS.Chart(id, { height: 300, animationEnabled: true, title: { text: "Top customers" }, axisX: { interval: 1 }, axisY2: { interlacedColor: "rgba(1,77,101,.2)", gridColor: "rgba(1,77,101,.1)", title: "Sales (USD)" }, data: System.Array.init([{ type: "bar", name: "companies", axisYType: "secondary", color: "#014D65", dataPoints: System.Array.init([{ y: 12, label: "Netherlands" }, { y: 15, label: "Switzerland" }, { y: 25, label: "Britain" }, { y: 28, label: "Germany" }, { y: 29, label: "France" }, { y: 52, label: "Japan" }, { y: 103, label: "China" }, { y: 134, label: "US" }], System.Object) }], System.Object) });
                        chart.render();
                    }
                }
            },
            fields: {
                Title: null
            },
            ctors: {
                init: function () {
                    this.Title = "Dashboard";
                },
                ctor: function () {
                    this.$initialize();
                    Components.Component.ctor.call(this);
    
                }
            },
            methods: {
                Render: function () {
                    if (this.IsExisted()) {
                        return;
                    }
                    this.HighLight();
                    this.ChartPanels();
                },
                HighLight: function () {
                    Components.Renderer.GridCell(Components.Renderer.GridCell(Components.Renderer.GridCell(Components.Renderer.GridCell(Components.Renderer.GridRow(Components.Renderer.Grid(MVVM.Html.Instance)), 3).Div.ClassName("icon-box bg-cyan fg-white").Div.ClassName("icon").Span.ClassName("mif-cart").End.End.Div.ClassName("content").Div.ClassName("p-2").Div.ClassName("text-upper").Text$2("SALES").End.Div.ClassName("text-upper text-bold text-lead").Text$2("41,400").End.End.Div.Attr("data-role", "progress").Attr("data-value", "75").Attr("data-small", "true").Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkCyan").End.Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text$2("70% Increase in 30 Days").EndOf$1(".cell"), 3).Div.ClassName("icon-box bg-orange fg-white").Div.ClassName("icon").Span.ClassName("mif-calendar").End.End.Div.ClassName("content").Div.ClassName("p-2").Div.ClassName("text-upper").Text$2("EVENTS").End.Div.ClassName("text-upper text-bold text-lead").Text$2("41,400").End.End.Div.Attr("data-role", "progress").Attr("data-value", "75").Attr("data-small", "true").Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkOrange").End.Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text$2("70% Increase in 30 Days").EndOf$1(".cell"), 3).Div.ClassName("icon-box bg-green fg-white").Div.ClassName("icon").Span.ClassName("fa fa-envelope").End.End.Div.ClassName("content").Div.ClassName("p-2").Div.ClassName("text-upper").Text$2("EMAIL").End.Div.ClassName("text-upper text-bold text-lead").Text$2("41,400").End.End.Div.Attr("data-role", "progress").Attr("data-value", "75").Attr("data-small", "true").Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkGreen").End.Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text$2("70% read").EndOf$1(".cell"), 3).Div.ClassName("icon-box bg-red fg-white").Div.ClassName("icon").Span.ClassName("fa fa-envelope").End.End.Div.ClassName("content").Div.ClassName("p-2").Div.ClassName("text-upper").Text$2("TASKS").End.Div.ClassName("text-upper text-bold text-lead").Text$2("12").End.End.Div.Attr("data-role", "progress").Attr("data-value", "20").Attr("data-small", "true").Attr("data-cls-bar", "bg-white").Attr("data-cls-back", "bg-darkRed").End.Div.ClassName("pl-2 pr-2").Span.ClassName("text-small").Text$2("Finished 20% today").EndOf$1(".grid").Render();
                },
                ChartPanels: function () {
                    Components.Renderer.GridRow(Components.Renderer.Grid(MVVM.Html.Instance.Div.Id("Dashboard")));
                    LogOne.Business.Dashboard.Dashboard.Customers();
                    this.SaleAnalysis();
                    this.SaleLeaderBoard();
                    this.MarketShare();
                    this.MonthlySaleData();
                    this.MonthlyExpense();
                },
                SaleAnalysis: function () {
                    var id = "SaleAnalysis";
                    Components.Renderer.Panel(Components.Renderer.GridCell(MVVM.Html.Instance, 4)).Div.Id(id).EndOf$1(".cell");
    
                    var chart = new CanvasJS.Chart(id, { height: 300, animationEnabled: true, theme: "light2", title: { text: "Sales Analysis - June 2019" }, data: System.Array.init([{ type: "funnel", indexLabelPlacement: "inside", indexLabelFontColor: "white", toolTipContent: "<b>{label}</b>: {y} <b>({percentage}%)</b>", indexLabel: "{label} ({percentage}%)", dataPoints: System.Array.init([{ y: 1400, label: "Leads" }, { y: 1212, label: "Initial Communication" }, { y: 1080, label: "Customer Evaluation" }, { y: 665, label: "Negotiation" }, { y: 578, label: "Order Received" }, { y: 549, label: "Payment" }], System.Object) }], System.Object) });
                    this.CalculatePercentage(chart);
                    chart.render();
                },
                CalculatePercentage: function (chart) {
                    var $t, $t1, $t2, $t3, $t4;
                    var dataPoint = ($t = chart.options.data)[System.Array.index(0, $t)].dataPoints;
                    var total = dataPoint[System.Array.index(0, dataPoint)].y;
                    for (var i = 0; i < dataPoint.length; i = (i + 1) | 0) {
                        if (i === 0) {
                            ($t1 = ($t2 = chart.options.data)[System.Array.index(0, $t2)].dataPoints)[System.Array.index(i, $t1)].percentage = Bridge.box(100, System.Int32);
                        } else {
                            ($t3 = ($t4 = chart.options.data)[System.Array.index(0, $t4)].dataPoints)[System.Array.index(i, $t3)].percentage = Bridge.box(System.Nullable.mul(System.Nullable.div(dataPoint[System.Array.index(i, dataPoint)].y, total), 100), System.Double, System.Nullable.toStringFn(System.Double.format), System.Nullable.getHashCodeFn(System.Double.getHashCode));
                        }
                    }
                },
                SaleLeaderBoard: function () {
                    var $t;
                    var id = "SaleLeaderBoard";
                    Components.Renderer.Panel(Components.Renderer.GridCell(MVVM.Html.Instance, 4)).Div.Id(id).EndOf$1(".grid");
    
                    var chart = new CanvasJS.Chart(id, { height: 300, animationEnabled: true, theme: "light2", title: { text: "Sale leaderboard" }, axisX: { interval: 1 }, axisY: { title: "Sale value (USD)" }, data: System.Array.init([{ type: "bar", toolTipContent: "<img src=\"https://canvasjs.com/wp-content/uploads/images/gallery/javascript-column-bar-charts/\"{url}\"\" style=\"width:40px; height:20px;\"> <b>{label}</b><br>Budget: ${y}bn<br>{gdp}% of GDP", indexLabelFontColor: "white", dataPoints: System.Array.init([($t = new LogContract.Models.SaleLeaderBoardDataPoint(), $t.label = "South Korea", $t.y = 36.8, $t.gdp = 2.7, $t.url = "skorea.png", $t), ($t = new LogContract.Models.SaleLeaderBoardDataPoint(), $t.label = "Germany", $t.y = 41.1, $t.gdp = 1.2, $t.url = "germany.png", $t), ($t = new LogContract.Models.SaleLeaderBoardDataPoint(), $t.label = "Japan", $t.y = 46.1, $t.gdp = 1.0, $t.url = "japan.png", $t), ($t = new LogContract.Models.SaleLeaderBoardDataPoint(), $t.label = "United Kingdom", $t.y = 48.3, $t.gdp = 1.9, $t.url = "uk.png", $t), ($t = new LogContract.Models.SaleLeaderBoardDataPoint(), $t.label = "India", $t.y = 55.9, $t.gdp = 2.5, $t.url = "india.png", $t), ($t = new LogContract.Models.SaleLeaderBoardDataPoint(), $t.label = "Russia", $t.y = 69.2, $t.gdp = 5.3, $t.url = "russia.png", $t), ($t = new LogContract.Models.SaleLeaderBoardDataPoint(), $t.label = "China", $t.y = 215.7, $t.gdp = 1.9, $t.url = "china.png", $t), ($t = new LogContract.Models.SaleLeaderBoardDataPoint(), $t.label = "United States", $t.y = 611.2, $t.gdp = 3.3, $t.url = "us.png", $t)], System.Object) }], System.Object) });
                    chart.render();
                },
                MarketShare: function () {
                    var id = "MarketShare";
                    Components.Renderer.Panel(Components.Renderer.GridCell(Components.Renderer.GridRow(Components.Renderer.Grid(MVVM.Html.Instance)), 4)).Div.Id(id).EndOf$1(".cell");
    
                    var chart = new CanvasJS.Chart(id, { height: 300, animationEnabled: true, exportEnabled: true, theme: "light2", title: { text: "Desktop Browser Market Share in 2016" }, data: System.Array.init([{ type: "pie", startAngle: 25, toolTipContent: "<b>{label}</b>: {y}%", showInLegend: true, legendText: "{label}", indexLabelFontSize: 16, indexLabel: "{label} - {y}%", dataPoints: System.Array.init([{ y: 51.08, label: "Chrome" }, { y: 27.34, label: "Internet Explorer" }, { y: 10.62, label: "Firefox" }, { y: 5.02, label: "Microsoft Edge" }, { y: 4.07, label: "Safari" }, { y: 1.22, label: "Opera" }, { y: 0.44, label: "Others" }], System.Object) }], System.Object) });
                    chart.render();
                },
                MonthlySaleData: function () {
                    var id = "MonthlySaleData";
                    Components.Renderer.Panel(Components.Renderer.GridCell(MVVM.Html.Instance, 4)).Div.Id(id).EndOf$1(".cell");
    
                    var chart = new CanvasJS.Chart(id, { height: 300, animationEnabled: true, exportEnabled: true, theme: "light2", title: { text: "Monthly Sales Data" }, axisX: { valueFormatString: "MMM" }, axisY: { prefix: "$" }, toolTip: { shared: true }, legend: { cursor: "pointer" }, data: System.Array.init([{ type: "column", name: "Actual Sales", showInLegend: true, xValueFormatString: "MMMM YYYY", yValueFormatString: "$#,##0", dataPoints: System.Array.init([{ x: new Date(2016, 0).getTime(), y: 20000 }, { x: new Date(2016, 1).getTime(), y: 30000 }, { x: new Date(2016, 2).getTime(), y: 25000 }, { x: new Date(2016, 3).getTime(), y: 70000, indexLabel: "High Renewals" }, { x: new Date(2016, 4).getTime(), y: 50000 }, { x: new Date(2016, 5).getTime(), y: 35000 }, { x: new Date(2016, 6).getTime(), y: 30000 }, { x: new Date(2016, 7).getTime(), y: 43000 }, { x: new Date(2016, 8).getTime(), y: 35000 }, { x: new Date(2016, 9).getTime(), y: 30000 }, { x: new Date(2016, 10).getTime(), y: 40000 }, { x: new Date(2016, 11).getTime(), y: 50000 }], System.Object) }, { type: "line", name: "Expected Sales", showInLegend: true, yValueFormatString: "$#,##0", dataPoints: System.Array.init([{ x: new Date(2016, 0).getTime(), y: 40000 }, { x: new Date(2016, 1).getTime(), y: 42000 }, { x: new Date(2016, 2).getTime(), y: 45000 }, { x: new Date(2016, 3).getTime(), y: 45000 }, { x: new Date(2016, 4).getTime(), y: 47000 }, { x: new Date(2016, 5).getTime(), y: 43000 }, { x: new Date(2016, 6).getTime(), y: 42000 }, { x: new Date(2016, 7).getTime(), y: 43000 }, { x: new Date(2016, 8).getTime(), y: 41000 }, { x: new Date(2016, 9).getTime(), y: 45000 }, { x: new Date(2016, 10).getTime(), y: 42000 }, { x: new Date(2016, 11).getTime(), y: 50000 }], System.Object) }, { type: "area", name: "Profit", markerBorderColor: "white", markerBorderThickness: 2, showInLegend: true, yValueFormatString: "$#,##0", dataPoints: System.Array.init([{ x: new Date(2016, 0).getTime(), y: 5000 }, { x: new Date(2016, 1).getTime(), y: 7000 }, { x: new Date(2016, 2).getTime(), y: 6000 }, { x: new Date(2016, 3).getTime(), y: 30000 }, { x: new Date(2016, 4).getTime(), y: 20000 }, { x: new Date(2016, 5).getTime(), y: 15000 }, { x: new Date(2016, 6).getTime(), y: 13000 }, { x: new Date(2016, 7).getTime(), y: 20000 }, { x: new Date(2016, 8).getTime(), y: 15000 }, { x: new Date(2016, 9).getTime(), y: 10000 }, { x: new Date(2016, 10).getTime(), y: 19000 }, { x: new Date(2016, 11).getTime(), y: 22000 }], System.Object) }], System.Object) });
                    chart.render();
                },
                MonthlyExpense: function () {
                    var id = "MonthlyExpense";
                    Components.Renderer.Panel(Components.Renderer.GridCell(MVVM.Html.Instance, 4)).Div.Id(id).EndOf$1(".cell");
    
                    var chart = new CanvasJS.Chart(id, { height: 300, animationEnabled: true, exportEnabled: true, theme: "light2", title: { text: "Monthly Expense" }, axisX: { valueFormatString: "MMM" }, axisY: { prefix: "$" }, toolTip: { shared: true }, legend: { cursor: "pointer" }, data: System.Array.init([{ type: "doughnut", innerRadius: 90, showInLegend: true, toolTipContent: "<b>{name}</b>= ${y} (#percent%)", indexLabel: "{name} - #percent%", dataPoints: System.Array.init([{ y: 450, name: "Food" }, { y: 120, name: "Insurance" }, { y: 300, name: "Travelling" }, { y: 800, name: "Housing" }, { y: 150, name: "Education" }, { y: 150, name: "Shopping" }, { y: 250, name: "Others" }], System.Object) }], System.Object) });
                    chart.render();
                }
            }
        });
    
        Bridge.define("LogOne.Business.MenuComponent", {
            inherits: [Components.Component],
            fields: {
                Title: null,
                MenuItems: null
            },
            ctors: {
                ctor: function () {
                    this.$initialize();
                    Components.Component.ctor.call(this);
                    this.MenuItems = function (_o4) {
                            var $t;
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.IsGroup = true, $t.ItemText = "Main", $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "Dashboard", $t.IconClass = "mif-home", $t.LinkedComponent = LogOne.Business.Dashboard.Dashboard, $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "Truck", $t.IconClass = "mif-truck", $t.LinkedComponent = LogOne.Business.TruckManagement.AllTruck, $t.MenuItems = function (_o1) {
                                    var $t1;
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Accessory", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Thu ti\u1ec1n kh\u00e1ch h\u00e0ng", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Thu ti\u1ec1n kh\u00e1ch h\u00e0ng h\u00e0ng lo\u1ea1t", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Phi\u1ebfu chi", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.IsDevider = true, $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Tr\u1ea3 ti\u1ec1n NCC", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "N\u1ed9p thu\u1ebf", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Tr\u1ea3 l\u01b0\u01a1ng", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "K\u1ebft qu\u1ea3 ki\u1ec3m k\u00ea", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "S\u1ed5 chi ti\u1ec1n m\u1eb7t", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Ki\u1ec3m k\u00ea qu\u1ef9", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o1.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "D\u1ef1 b\u00e1o d\u00f2ng ti\u1ec1n", $t1.IconClass = "fa fa-file-word", $t1));
                                    return _o1;
                                }(new (System.Collections.Generic.List$1(LogOne.Business.MenuItem)).ctor()), $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "Ng\u00e2n h\u00e0ng", $t.IconClass = "mif-library", $t.MenuItems = function (_o2) {
                                    var $t1;
                                    _o2.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Thu, chi ti\u1ec1n", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o2.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Thu ti\u1ec1n g\u1edfi", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o2.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Thu ti\u1ec1n kh\u00e1ch h\u00e0ng", $t1.IconClass = "fa fa-file-word", $t1));
                                    _o2.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "\u0110\u1ed1i chi\u1ebfu ng\u00e2n h\u00e0ng", $t1.IconClass = "fa fa-file-word", $t1));
                                    return _o2;
                                }(new (System.Collections.Generic.List$1(LogOne.Business.MenuItem)).ctor()), $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "Mua h\u00e0ng", $t.IconClass = "mif-add-shopping-cart", $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "B\u00e1n h\u00e0ng", $t.IconClass = "mif-truck", $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "H\u00f3a \u0111\u01a1n", $t.IconClass = "fa fa-file-invoice", $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "Kho", $t.IconClass = "fa fa-warehouse", $t.MenuItems = function (_o3) {
                                    var $t1;
                                    _o3.add(($t1 = new LogOne.Business.MenuItem(), $t1.ItemText = "Nh\u1eadp xu\u1ea5t kho", $t1.IconClass = "fa fa-file-word", $t1));
                                    return _o3;
                                }(new (System.Collections.Generic.List$1(LogOne.Business.MenuItem)).ctor()), $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "Settings", $t.IsGroup = true, $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "Thi\u1ebft l\u1eadp", $t.IconClass = "mif-cogs", $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "T\u00e0i kho\u1ea3n", $t.IconClass = "mif-user", $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.IsDevider = true, $t));
                            _o4.add(($t = new LogOne.Business.MenuItem(), $t.ItemText = "\u0110\u0103ng xu\u1ea5t", $t.IconClass = "mif-exit", $t));
                            return _o4;
                        }(new (System.Collections.Generic.List$1(LogOne.Business.MenuItem)).ctor());
                }
            },
            methods: {
                Render: function () {
                    MVVM.Html.Take$2(".sidebar-wrapper");
                    this.RenderMenuItems(this.MenuItems);
                    MVVM.Html.Take$2(".sidebar-wrapper ul").ClassName("sidebar-menu border bd-default");
                },
                RenderMenuItems: function (menuItems) {
                    MVVM.Html.Instance.Ul.ForEach$1(LogOne.Business.MenuItem, menuItems, Bridge.fn.bind(this, function (item, index) {
                        if (item.IsGroup) {
                            MVVM.Html.Instance.Li.ClassName("group-title").Text$2(item.ItemText).End.Render();
                        } else if (item.IsDevider) {
                            MVVM.Html.Instance.Li.ClassName("divider").End.Render();
                        } else {
                            MVVM.Html.Instance.Li.Anchor.Attr("data-role", "ripple").Event$3(LogOne.Business.MenuItem, "click", Bridge.fn.bind(this, function (menu, e) {
                                var $step = 0,
                                    $task1, 
                                    $jumpFromFinally, 
                                    li, 
                                    activeLi, 
                                    $t, 
                                    active, 
                                    className, 
                                    instance, 
                                    $asyncBody = Bridge.fn.bind(this, function () {
                                        for (;;) {
                                            $step = System.Array.min([0,1], $step);
                                            switch ($step) {
                                                case 0: {
                                                    li = Bridge.as(e.target, HTMLElement);
                                                    activeLi = document.querySelectorAll(".sidebar-wrapper li.active");
                                                    $t = Bridge.getEnumerator(activeLi, "getEnumerator");
                                                    try {
                                                        while ($t.moveNext()) {
                                                            active = Bridge.cast($t.Current, HTMLElement);
                                                            if (active.contains(li)) {
                                                                continue;
                                                            }
    
                                                            active.className = System.String.replaceAll(active.className, "active", "").trim();
                                                        }
                                                    } finally {
                                                        if (Bridge.is($t, System.IDisposable)) {
                                                            $t.System$IDisposable$Dispose();
                                                        }
                                                    }
                                                    className = (li.parentElement.className || "") + " active";
                                                    li.parentElement.className = className.trim();
                                                    instance = Bridge.as(Bridge.createInstance(menu.LinkedComponent), Components.Component);
                                                    $task1 = instance.RenderAsync();
                                                    $step = 1;
                                                    if ($task1.isCompleted()) {
                                                        continue;
                                                    }
                                                    $task1.continue($asyncBody);
                                                    return;
                                                }
                                                case 1: {
                                                    $task1.getAwaitedResult();
                                                    instance.Focus();
                                                    return;
                                                }
                                                default: {
                                                    return;
                                                }
                                            }
                                        }
                                    }, arguments);
    
                                $asyncBody();
                            }), item).Span.ClassName("icon " + (item.IconClass || "")).End.Text$2(item.ItemText).EndOf(MVVM.ElementType.a).Render();
                            if (item.MenuItems != null && item.MenuItems.Count > 0) {
                                this.RenderMenuItems(item.MenuItems);
                            }
                        }
                    }));
                }
            }
        });
    
        Bridge.define("LogOne.Business.MenuItem", {
            fields: {
                IsGroup: false,
                IsDevider: false,
                ItemText: null,
                IconClass: null,
                LinkedComponent: null,
                MenuItems: null
            }
        });
    
        Bridge.define("LogOne.Business.TruckManagement.AllTruck", {
            inherits: [Components.Component],
            fields: {
                Title: null,
                TruckId: 0,
                TruckHeader: null,
                TruckData: null,
                TruckPlate: null,
                FreightStateId: null,
                BrandName: null,
                Version: null,
                VendorId: null,
                Price: null,
                Currency: null,
                ActiveDate: null,
                ExpiredDate: null,
                DriverId: null
            },
            ctors: {
                init: function () {
                    this.Title = "Truck";
                    this.TruckHeader = new (MVVM.ObservableArray$1(Components.Header$1(LogAPI.Models.Truck))).ctor();
                    this.TruckData = new (MVVM.ObservableArray$1(LogAPI.Models.Truck)).ctor();
                    this.TruckPlate = new (MVVM.Observable$1(System.String)).ctor();
                    this.FreightStateId = new (MVVM.Observable$1(System.Int32)).ctor();
                    this.BrandName = new (MVVM.Observable$1(System.String)).ctor();
                    this.Version = new (MVVM.Observable$1(System.String)).ctor();
                    this.VendorId = new (MVVM.Observable$1(System.Int32)).ctor();
                    this.Price = new (MVVM.Observable$1(System.Decimal)).ctor();
                    this.Currency = new (MVVM.Observable$1(System.String)).ctor();
                    this.ActiveDate = new (MVVM.Observable$1(System.Nullable$1(System.DateTime))).ctor();
                    this.ExpiredDate = new (MVVM.Observable$1(System.Nullable$1(System.DateTime))).ctor();
                    this.DriverId = new (MVVM.Observable$1(System.Int32)).ctor();
                },
                ctor: function () {
                    var $t;
                    this.$initialize();
                    Components.Component.ctor.call(this);
                    this.TruckHeader.Data$1 = System.Array.init([($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.EditEvent = Bridge.fn.cacheBind(this, this.EditTruck), $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Truck plate", $t.FieldName = "TruckPlate", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Freight state", $t.FieldName = "FreightStateId", $t.Sortable = true, $t.Reference = LogAPI.Models.FreightState, $t.RefDisplayField = "Name", $t.RefValueField = "Id", $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Band name", $t.FieldName = "BrandName", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Version", $t.FieldName = "Version", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Vendor", $t.FieldName = "VendorId", $t.Sortable = true, $t.Reference = LogAPI.Models.Vendor, $t.RefDisplayField = "Name", $t.RefValueField = "Id", $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Long", $t.FieldName = "Long", $t.TextAlign = Components.TextAlign.right, $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Lat", $t.FieldName = "Lat", $t.TextAlign = Components.TextAlign.right, $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Driver", $t.FieldName = "DriverId", $t.Sortable = true, $t.Reference = LogAPI.Models.User, $t.RefDisplayField = "FullName", $t.RefValueField = "Id", $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Price", $t.FieldName = "Price", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Currency", $t.FieldName = "Currency", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Bought date", $t.FieldName = "BoughtDate", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Active date", $t.FieldName = "ActiveDate", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Maintenance start", $t.FieldName = "MaintenanceStart", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Maintenance end", $t.FieldName = "MaintenanceEnd", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Next maintenance date", $t.FieldName = "NextMaintenanceDate", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Maintenance period", $t.FieldName = "MaintenancePeriod", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Active", $t.FieldName = "Active", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Expiry date", $t.FieldName = "ExpiredDate", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Inserted date", $t.FieldName = "InsertedDate", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Inserted by", $t.FieldName = "InsertedBy", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Updated date", $t.FieldName = "UpdatedDate", $t.Sortable = true, $t), ($t = new (Components.Header$1(LogAPI.Models.Truck))(), $t.HeaderText = "Updated by", $t.FieldName = "UpdatedBy", $t.Sortable = true, $t)], Components.Header$1(LogAPI.Models.Truck));
                }
            },
            methods: {
                Render: function () { },
                RenderAsync: function () {
                    var $step = 0,
                        $task1, 
                        $taskResult1, 
                        $jumpFromFinally, 
                        $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                        $returnValue, 
                        client, 
                        trucks, 
                        $t, 
                        $async_e, 
                        $asyncBody = Bridge.fn.bind(this, function () {
                            try {
                                for (;;) {
                                    $step = System.Array.min([0,1], $step);
                                    switch ($step) {
                                        case 0: {
                                            if (this.IsExisted()) {
                                                $tcs.setResult(null);
                                                return;
                                            }
                                            this.RenderMenuButton();
                                            this.RenderImageCorner();
                                            this.RenderTruckDetail();
                                            client = new (LogContract.Interfaces.BaseClient$1(LogAPI.Models.Truck)).ctor();
                                            $task1 = client.GetList();
                                            $step = 1;
                                            if ($task1.isCompleted()) {
                                                continue;
                                            }
                                            $task1.continue($asyncBody);
                                            return;
                                        }
                                        case 1: {
                                            $taskResult1 = $task1.getAwaitedResult();
                                            trucks = $taskResult1;
                                            this.TruckData.Data$1 = ($t = LogAPI.Models.Truck, System.Linq.Enumerable.from(trucks, $t).ToArray($t));
                                            $tcs.setResult(null);
                                            return;
                                        }
                                        default: {
                                            $tcs.setResult(null);
                                            return;
                                        }
                                    }
                                }
                            } catch($async_e1) {
                                $async_e = System.Exception.create($async_e1);
                                $tcs.setException($async_e);
                            }
                        }, arguments);
    
                    $asyncBody();
                    return $tcs.task;
                },
                RenderMenuButton: function () {
                    Components.Renderer.Button(Components.Renderer.SmallSearchInput(Components.Renderer.Button(Components.Renderer.Button(MVVM.Html.Instance.Table.TRow.TData, "New", "button info small", "fa fa-plus").EndOf(MVVM.ElementType.td).TRow.TData, "Delete", "button secondary small", "fa fa-trash").EndOf(MVVM.ElementType.td).TRow.TData).EndOf(MVVM.ElementType.td).TData, "Search", "button info small", "fa fa-search").EndOf(MVVM.ElementType.table).Render();
                },
                RenderImageCorner: function () {
                    Components.Renderer.GridCell(Components.Renderer.GridRow(Components.Renderer.Grid(Components.Renderer.Table(LogAPI.Models.Truck, MVVM.Html.Instance, this.TruckHeader, this.TruckData))), 5).ClassName("image-corner").Img.Src("data:image/jpeg;base64,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").End.Div.H5.Text$2("ADDRESS").End.Span.Text$2("10385 Shadow Oak Dr").End.Br.Span.Text$2("Chatsworth, CA, 91311").End.Br.H5.Text$2("PHONE").End.Span.Text$2("(818) 555-2478").End.Br.H5.Text$2("EMAIL").End.Span.Text$2("wallyh@gmail.com").EndOf$1(".cell");
                },
                RenderTruckDetail: function () {
                    Components.Renderer.SmallInput$1(System.String, Components.Renderer.PaddingRem(Components.Renderer.Panel(Components.Renderer.HeightPercentage(Components.Renderer.TabContent(Components.Renderer.TabItem(Components.Renderer.TabItem(Components.Renderer.TabItem(Components.Renderer.Tab(Components.Renderer.GridCell(MVVM.Html.Instance, 7)), "Truck info", "truckInfo", true), "Maintenance", "truck-maintenance"), "Accessory", "truck-accessory").EndOf(MVVM.ElementType.ul)), 100)).Id("truckInfo"), Components.Direction.top, 0.8).Table.TRow.TData.Text$2("Truck plate").End.TData, this.TruckPlate).EndOf(MVVM.ElementType.td);
                    Components.Renderer.Margin(Components.Renderer.Button(Components.Renderer.Button(Components.Renderer.SmallDatePicker$1(System.Nullable$1(System.DateTime), Components.Renderer.SmallDatePicker$1(System.Nullable$1(System.DateTime), Components.Renderer.SmallInput$1(System.String, Components.Renderer.SmallInput$1(System.Decimal, Components.Renderer.SmallInput$1(System.Int32, Components.Renderer.SmallInput$1(System.String, Components.Renderer.SmallInput$1(System.String, Components.Renderer.SmallInput$1(System.Int32, MVVM.Html.Instance.TData.Text$2("Freight state").End.TData, this.FreightStateId).EndOf(MVVM.ElementType.td).TData.Text$2("Band name").End.TData, this.BrandName).EndOf(MVVM.ElementType.tr).TRow.TData.Text$2("Version").End.TData, this.Version).EndOf(MVVM.ElementType.td).TData.Text$2("Vendor").End.TData, this.VendorId).EndOf(MVVM.ElementType.td).TData.Text$2("Price").End.TData, this.Price).EndOf(MVVM.ElementType.tr).TRow.TData.Text$2("Currency").End.TData, this.Currency).EndOf(MVVM.ElementType.td).TData.Text$2("Active date").End.TData, this.ActiveDate).EndOf(MVVM.ElementType.td).TData.Text$2("Expiry date").End.TData, this.ExpiredDate).EndOf(MVVM.ElementType.tr).TRow.TData.End.TData, "Save", "button info small", "fa fa-save").AsyncEvent("click", Bridge.fn.cacheBind(this, this.CreateNewTruckAsync)).End, "Clear", "button secondary small", "fa fa-times"), Components.Direction.left, 5).EndOf(MVVM.ElementType.td).EndOf$1(".panel");
    
                    Components.Renderer.SmallInput(Components.Renderer.SmallInput(Components.Renderer.SmallInput(Components.Renderer.SmallInput(Components.Renderer.SmallInput(Components.Renderer.SmallInput(Components.Renderer.SmallInput(Components.Renderer.SmallDatePicker(Components.Renderer.PaddingRem(Components.Renderer.HeightPercentage(Components.Renderer.Panel(MVVM.Html.Instance).Id("truck-maintenance"), 100), Components.Direction.top, 0.8).Table.TRow.TData.Text$2("Maintenance start date").End.TData, System.DateTime.format(System.DateTime.getNow())).EndOf(MVVM.ElementType.td).TData.Text$2("Maintenance end date").End.TData, System.DateTime.format(System.DateTime.addDays(System.DateTime.getNow(), 3))).EndOf(MVVM.ElementType.td).TData.Text$2("Advance Paid").End.TData, "1.000.000").EndOf(MVVM.ElementType.tr).TData.Text$2("Paid").End.TData, "Incomplete").EndOf(MVVM.ElementType.td).TData.Text$2("Total").End.TData, "1.200.000.000").EndOf(MVVM.ElementType.td).TData.Text$2("Currency").End.TData, "VND").EndOf(MVVM.ElementType.tr).TRow.TData.Text$2("Vendor").End.TData, "Me Koong Distributor").EndOf(MVVM.ElementType.td).TData.Text$2("Accountable User").End.TData, "aaa").EndOf(MVVM.ElementType.td).EndOf$1(".panel");
    
                },
                CreateNewTruckAsync: function () {
                    var $step = 0,
                        $task1, 
                        $taskResult1, 
                        $task2, 
                        $taskResult2, 
                        $jumpFromFinally, 
                        $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                        $returnValue, 
                        truck, 
                        $t, 
                        client, 
                        addedTruck, 
                        updatedTruck, 
                        oldTruck, 
                        $async_e, 
                        $asyncBody = Bridge.fn.bind(this, function () {
                            try {
                                for (;;) {
                                    $step = System.Array.min([0,1,2,3,4,5], $step);
                                    switch ($step) {
                                        case 0: {
                                            truck = ($t = new LogAPI.Models.Truck(), $t.Id = this.TruckId, $t.TruckPlate = this.TruckPlate.Data$1, $t.FreightStateId = this.FreightStateId.Data$1, $t.BrandName = this.BrandName.Data$1, $t.Version = this.Version.Data$1, $t.VendorId = this.VendorId.Data$1, $t.Price = this.Price.Data$1, $t.Currency = this.Currency.Data$1, $t.Active = true, $t.ActiveDate = this.ActiveDate.Data$1, $t.ExpiredDate = this.ExpiredDate.Data$1, $t.InsertedBy = 1, $t.InsertedDate = System.DateTime.getNow(), $t.DriverId = 1, $t);
                                            client = new (LogContract.Interfaces.BaseClient$1(LogAPI.Models.Truck)).ctor();
                                            if (this.TruckId === 0) {
                                                $step = 1;
                                                continue;
                                            } else  {
                                                $step = 3;
                                                continue;
                                            }
                                        }
                                        case 1: {
                                            $task1 = client.PostAsync(truck);
                                            $step = 2;
                                            if ($task1.isCompleted()) {
                                                continue;
                                            }
                                            $task1.continue($asyncBody);
                                            return;
                                        }
                                        case 2: {
                                            $taskResult1 = $task1.getAwaitedResult();
                                            addedTruck = $taskResult1;
                                            this.TruckData.Add(addedTruck);
                                            $step = 5;
                                            continue;
                                        }
                                        case 3: {
                                            $task2 = client.PutAsync(truck);
                                            $step = 4;
                                            if ($task2.isCompleted()) {
                                                continue;
                                            }
                                            $task2.continue($asyncBody);
                                            return;
                                        }
                                        case 4: {
                                            $taskResult2 = $task2.getAwaitedResult();
                                            updatedTruck = $taskResult2;
                                            oldTruck = System.Linq.Enumerable.from(this.TruckData.Data$1, LogAPI.Models.Truck).first(Bridge.fn.bind(this, function (x) {
                                                return x.Id === this.TruckId;
                                            }));
                                            this.TruckData.Replace(oldTruck, updatedTruck);
                                            $step = 5;
                                            continue;
                                        }
                                        case 5: {
                                            this.ResetTruck();
                                            $tcs.setResult(null);
                                            return;
                                        }
                                        default: {
                                            $tcs.setResult(null);
                                            return;
                                        }
                                    }
                                }
                            } catch($async_e1) {
                                $async_e = System.Exception.create($async_e1);
                                $tcs.setException($async_e);
                            }
                        }, arguments);
    
                    $asyncBody();
                    return $tcs.task;
                },
                ResetTruck: function () {
                    this.TruckId = 0;
                    this.TruckPlate.Data$1 = null;
                    this.FreightStateId.Data$1 = 0;
                    this.FreightStateId.Data$1 = 0;
                    this.BrandName.Data$1 = null;
                    this.Version.Data$1 = null;
                    this.VendorId.Data$1 = 0;
                    this.Price.Data$1 = System.Decimal(0);
                    this.Currency.Data$1 = null;
                    this.ActiveDate.Data$1 = null;
                    this.ExpiredDate.Data$1 = null;
                    this.DriverId.Data$1 = 0;
                },
                EditTruck: function (truck) {
                    var $step = 0,
                        $jumpFromFinally, 
                        $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                        $returnValue, 
                        $async_e, 
                        $asyncBody = Bridge.fn.bind(this, function () {
                            try {
                                for (;;) {
                                    $step = System.Array.min([0], $step);
                                    switch ($step) {
                                        case 0: {
                                            this.TruckId = truck.Id;
                                            this.TruckPlate.Data$1 = truck.TruckPlate;
                                            this.FreightStateId.Data$1 = truck.FreightStateId;
                                            this.BrandName.Data$1 = truck.BrandName;
                                            this.Version.Data$1 = truck.Version;
                                            this.VendorId.Data$1 = truck.VendorId;
                                            this.Price.Data$1 = truck.Price;
                                            this.Currency.Data$1 = truck.Currency;
                                            this.ActiveDate.Data$1 = truck.ActiveDate;
                                            this.ExpiredDate.Data$1 = truck.ExpiredDate;
                                            this.DriverId.Data$1 = truck.DriverId;
                                            $tcs.setResult(null);
                                            return;
                                        }
                                        default: {
                                            $tcs.setResult(null);
                                            return;
                                        }
                                    }
                                }
                            } catch($async_e1) {
                                $async_e = System.Exception.create($async_e1);
                                $tcs.setException($async_e);
                            }
                        }, arguments);
    
                    $asyncBody();
                    return $tcs.task;
                },
                DeleteTruckAsync: function (truck) {
                    var $step = 0,
                        $task1, 
                        $taskResult1, 
                        $jumpFromFinally, 
                        $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                        $returnValue, 
                        client, 
                        $async_e, 
                        $asyncBody = Bridge.fn.bind(this, function () {
                            try {
                                for (;;) {
                                    $step = System.Array.min([0,1], $step);
                                    switch ($step) {
                                        case 0: {
                                            client = new (LogContract.Interfaces.BaseClient$1(LogAPI.Models.Truck)).ctor();
                                            $task1 = client.Delete(truck.Id);
                                            $step = 1;
                                            if ($task1.isCompleted()) {
                                                continue;
                                            }
                                            $task1.continue($asyncBody);
                                            return;
                                        }
                                        case 1: {
                                            $taskResult1 = $task1.getAwaitedResult();
                                            this.TruckData.Remove(truck);
                                            $tcs.setResult(null);
                                            return;
                                        }
                                        default: {
                                            $tcs.setResult(null);
                                            return;
                                        }
                                    }
                                }
                            } catch($async_e1) {
                                $async_e = System.Exception.create($async_e1);
                                $tcs.setException($async_e);
                            }
                        }, arguments);
    
                    $asyncBody();
                    return $tcs.task;
                }
            }
        });
        Bridge.init();
    });
});
