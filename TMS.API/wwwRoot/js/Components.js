/**
 * @version 1.0.0.0
 * @copyright Copyright ©  2019
 * @compiler Bridge.NET 17.9.0
 */
Bridge.assembly("Components", function ($asm, globals) {
    "use strict";

    Bridge.define("Components.BorderType", {
        $kind: "enum",
        statics: {
            fields: {
                dotted: 0,
                dasheddashed: 1,
                solid: 2,
                double: 3,
                groove: 4,
                ridge: 5,
                inset: 6,
                outset: 7,
                none: 8,
                hidden: 9
            }
        }
    });

    Bridge.define("Components.Component", {
        props: {
            FullClassName: {
                get: function () {
                    return System.String.replaceAll(Bridge.Reflection.getTypeFullName(Bridge.getType(this)), ".", "_");
                }
            }
        },
        methods: {
            RenderAsync: function () {
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
                                        this.Render();
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
            /**
             * Check if the component has been mounted to the main tab
             *
             * @instance
             * @public
             * @this Components.Component
             * @memberof Components.Component
             * @return  {boolean}        True if it has been mounted, and vice versa
             */
            IsExisted: function () {
                var tab = document.querySelector(System.String.format("#tab-content #{0}", [this.FullClassName]));
                if (tab != null) {
                    return true;
                }
                MVVM.Html.Take$2("#tabs").Li.Anchor.Href(System.String.format("#{0}", [this.FullClassName])).Event$1("mouseup", Bridge.fn.cacheBind(this, this.CloseTheTab)).Text$2(this.Title).End.Span.ClassName("icon fa fa-times").Event("click", Bridge.fn.cacheBind(this, this.Close)).End.Render();
                MVVM.Html.Take$2("#tab-content").Div.Id(this.FullClassName).Render();
                return false;
            },
            CloseTheTab: function (e) {
                var which = System.Convert.toInt64(e.which);
                var button = System.Convert.toInt64(e.button);
                if (which.equals(System.Int64(2)) || button.equals(System.Int64(1))) {
                    e.preventDefault();
                    this.Close();
                }
            },
            Close: function () {
                MVVM.Html.Take$2(System.String.format("#tabs a[href='#{0}']", [this.FullClassName]));
                var isActive = System.String.contains(MVVM.Html.Context.parentElement.className,"active");
                var previousTab = MVVM.Html.Context.parentElement.previousElementSibling;
                var nextTab = MVVM.Html.Context.parentElement.nextElementSibling;
                MVVM.Html.Context.parentElement.remove();
                MVVM.Html.Take$2("#" + (this.FullClassName || ""));
                MVVM.Html.Context.remove();
                if (isActive) {
                    if (previousTab != null) {
                        previousTab.firstElementChild.click();
                    }
                    if (nextTab != null) {
                        nextTab.firstElementChild.click();
                    }
                }
            },
            Focus: function () {
                var html = MVVM.Html.Take$2(System.String.format("a[href='#{0}'", [this.FullClassName]));
                html.Trigger("click");
            }
        }
    });

    Bridge.define("Components.Direction", {
        $kind: "enum",
        statics: {
            fields: {
                top: 0,
                right: 1,
                bottom: 2,
                left: 3
            }
        }
    });

    Bridge.define("Components.Header$1", function (T) { return {
        fields: {
            HeaderText: null,
            FieldName: null,
            Reference: null,
            RefValueField: null,
            RefDisplayField: null,
            GroupName: null,
            Sortable: false,
            DataType: null,
            Format: null,
            TextAlign: null,
            EditEvent: null,
            DeleteEvent: null
        },
        ctors: {
            init: function () {
                this.RefValueField = "Id";
                this.RefDisplayField = "Name";
            }
        }
    }; });

    Bridge.define("Components.MasterData");

    Bridge.define("Components.Renderer", {
        statics: {
            methods: {
                ColSpan: function (html, colSpan) {
                    return html.Attr("colspan", Bridge.toString(colSpan));
                },
                RowSpan: function (html, colSpan) {
                    return html.Attr("rowspan", Bridge.toString(colSpan));
                },
                Panel: function (html, text) {
                    if (text === void 0) { text = ""; }
                    html.Div.ClassName("panel");
                    if (!System.String.isNullOrEmpty(text)) {
                        html.Label.ClassName("header").Text$2(text).End.Render();
                    }
                    return html;
                },
                SmallDatePicker: function (html, value) {
                    if (value === void 0) { value = null; }
                    html.Input.ClassName("input-small").Attr("data-role", "calendarpicker").Attr("data-format", "%d/%m/%Y");
                    if (!System.String.isNullOrEmpty(value)) {
                        html.Value(value);
                    }
                    return html;
                },
                SmallDatePicker$1: function (T, html, value) {
                    html.Input.ClassName("input-small").Attr("data-role", "calendarpicker").Attr("data-format", "%d/%m/%Y").Value$1(T, value);
                    return html;
                },
                /**
                 * Non auto enclosing element
                 *
                 * @static
                 * @public
                 * @this Components.Renderer
                 * @memberof Components.Renderer
                 * @param   {MVVM.Html}    html         
                 * @param   {string}       text         
                 * @param   {string}       className    
                 * @param   {string}       icon
                 * @return  {MVVM.Html}
                 */
                Button: function (html, text, className, icon) {
                    if (text === void 0) { text = ""; }
                    if (className === void 0) { className = "button info small"; }
                    if (icon === void 0) { icon = ""; }
                    html.Button.Render();
                    if (!System.String.isNullOrEmpty(icon)) {
                        html.Span.ClassName(icon).End.Text$2(" ").Render();
                    }
                    return html.ClassName(className).Text$2(text);
                },
                /**
                 * Render small input, not an auto enclosing component
                 *
                 * @static
                 * @public
                 * @this Components.Renderer
                 * @memberof Components.Renderer
                 * @param   {MVVM.Html}    html     
                 * @param   {string}       value    
                 * @param   {string}       align
                 * @return  {MVVM.Html}
                 */
                SmallInput: function (html, value, align) {
                    if (value === void 0) { value = ""; }
                    if (align === void 0) { align = "left"; }
                    return html.Input.ClassName("input-small " + (align || "")).Attr("data-role", "input").Value(value);
                },
                /**
                 * Render small input, not an auto enclosing component
                 *
                 * @static
                 * @public
                 * @this Components.Renderer
                 * @memberof Components.Renderer
                 * @param   {Function}             T        
                 * @param   {MVVM.Html}            html     
                 * @param   {MVVM.Observable$1}    value    
                 * @param   {string}               align
                 * @return  {MVVM.Html}
                 */
                SmallInput$1: function (T, html, value, align) {
                    if (align === void 0) { align = "left"; }
                    return html.Input.ClassName("input-small " + (align || "")).Attr("data-role", "input").Value$1(T, value);
                },
                /**
                 * Render small search input, not an auto enclosing component
                 *
                 * @static
                 * @public
                 * @this Components.Renderer
                 * @memberof Components.Renderer
                 * @param   {MVVM.Html}    html     
                 * @param   {string}       value    
                 * @param   {string}       align
                 * @return  {MVVM.Html}
                 */
                SmallSearchInput: function (html, value, align) {
                    if (value === void 0) { value = ""; }
                    if (align === void 0) { align = "left"; }
                    return Components.Renderer.PlaceHolder(Components.Renderer.SmallInput(html, value, align), "Search...").Attr("data-search-button", System.Boolean.toString((true)));
                },
                PlaceHolder: function (html, value) {
                    return html.Attr("placeholder", value);
                },
                SmallDropDown: function (T, html, list, selectedItem, displayField, valueField) {
                    if (displayField === void 0) { displayField = null; }
                    if (valueField === void 0) { valueField = null; }
                    return html.Dropdown$1(T, list, selectedItem, displayField, valueField).ClassName("input-small").Attr("data-role", "select").Attr("style", "mind-width: 120px");
                },
                SmallRadio: function (html, name, text) {
                    return html.Input.ClassName("input-small").Type("radio").Attr("data-role", "radio").Attr("data-style", "2").Attr("name", name).Attr("data-cls-check", "myCheck").Attr("data-caption", text);
                },
                SmallCheckbox: function (html, text, check) {
                    if (check === void 0) { check = false; }
                    html.Input.ClassName("input-small").Type("checkbox").Attr("data-role", "checkbox").Attr("data-style", "2").Attr("data-cls-check", "myCheckbox").Attr("data-caption", text);
                    if (check) {
                        html.Attr("checked", System.Boolean.toString(check));
                    }
                    return html;
                },
                Disabled: function (html) {
                    return html.Attr("disabled", "disabled");
                },
                Readonly: function (html) {
                    return html.Attr("readonly", "readonly");
                },
                Grid: function (html) {
                    return html.Div.ClassName("grid");
                },
                GridRow: function (html) {
                    return html.Div.ClassName("row");
                },
                GridCell: function (html, size) {
                    return html.Div.ClassName("cell cell-" + size);
                },
                Margin: function (html, direction, margin, unit) {
                    if (unit === void 0) { unit = "px"; }
                    return html.Style(System.String.format("margin-{0} : {1}{2}", Bridge.box(direction, Components.Direction, System.Enum.toStringFn(Components.Direction)), Bridge.box(margin, System.Double, System.Double.format, System.Double.getHashCode), unit));
                },
                MarginRem: function (html, direction, margin) {
                    return html.Style(System.String.format("margin-{0} : {1}rem", Bridge.box(direction, Components.Direction, System.Enum.toStringFn(Components.Direction)), Bridge.box(margin, System.Double, System.Double.format, System.Double.getHashCode)));
                },
                Padding: function (html, direction, padding, unit) {
                    if (unit === void 0) { unit = "px"; }
                    return html.Style(System.String.format("padding-{0} : {1}{2}", Bridge.box(direction, Components.Direction, System.Enum.toStringFn(Components.Direction)), Bridge.box(padding, System.Double, System.Double.format, System.Double.getHashCode), unit));
                },
                PaddingRem: function (html, direction, margin) {
                    return html.Style(System.String.format("padding-{0} : {1}rem", Bridge.box(direction, Components.Direction, System.Enum.toStringFn(Components.Direction)), Bridge.box(margin, System.Double, System.Double.format, System.Double.getHashCode)));
                },
                Width: function (html, width) {
                    return html.Style(System.String.format("width: {0}px", [Bridge.box(width, System.Int32)]));
                },
                WidthPercentage: function (html, width) {
                    return html.Style(System.String.format("width: {0}%", [Bridge.box(width, System.Int32)]));
                },
                Height: function (html, height) {
                    return html.Style(System.String.format("height: {0}px", [Bridge.box(height, System.Int32)]));
                },
                HeightPercentage: function (html, height) {
                    return html.Style(System.String.format("height: {0}%", [Bridge.box(height, System.Int32)]));
                },
                Border: function (html, width, borderType, color, direction) {
                    if (width === void 0) { width = 0; }
                    if (borderType === void 0) { borderType = 2; }
                    if (color === void 0) { color = "000"; }
                    if (direction === void 0) { direction = null; }
                    if (direction != null) {
                        return html.Style(System.String.format("border-{0}: {1}px {2} #{3}", Bridge.box(direction, Components.Direction, System.Nullable.toStringFn(System.Enum.toStringFn(Components.Direction)), System.Nullable.getHashCode), Bridge.box(width, System.Int32), Bridge.box(borderType, Components.BorderType, System.Enum.toStringFn(Components.BorderType)), color));
                    }
                    return html.Style(System.String.format("border: {0}px {1} #{2}", Bridge.box(width, System.Int32), Bridge.box(borderType, Components.BorderType, System.Enum.toStringFn(Components.BorderType)), color));
                },
                Display: function (html, display) {
                    return html.Style(System.String.format("display: {0};", [display]));
                },
                /**
                 * Render the table and its wrapper, auto enclosing component
                 *
                 * @static
                 * @public
                 * @this Components.Renderer
                 * @memberof Components.Renderer
                 * @param   {Function}                  Data          Generic type of the data row
                 * @param   {MVVM.Html}                 html          Html
                 * @param   {MVVM.ObservableArray$1}    headerData    Header description
                 * @param   {MVVM.ObservableArray$1}    rowData       Row data
                 * @return  {MVVM.Html}
                 */
                Table: function (Data, html, headerData, rowData) {
                    var table = new (Components.Table$1(Data))(headerData, rowData);
                    table.Render();
                    return html;
                },
                Tab: function (html) {
                    return html.Ul.Attr("data-role", "tabs").Attr("data-expand", "true");
                },
                TabItem: function (html, title, reference, active) {
                    if (active === void 0) { active = false; }
                    html.Li.Anchor.Href("#" + (reference || "")).Text$2(title).End.Render();
                    if (active) {
                        html.ClassName("active");
                    }
                    return html.End;
                },
                TabContent: function (html) {
                    return html.Div.ClassName("tabs-content");
                },
                TextAlign: function (html, alignment) {
                    if (alignment === void 0) { alignment = 8; }
                    return html.Style("text-align: " + (System.Nullable.toString(alignment, System.Enum.toStringFn(Components.TextAlign)) || ""));
                },
                Icon: function (html, iconClass) {
                    return html.Span.ClassName(iconClass);
                },
                RenderAndFocus: function (component) {
                    component.Render();
                    component.Focus();
                }
            }
        }
    });

    Bridge.define("Components.Table$1", function (Data) { return {
        statics: {
            methods: {
                CalcTextAlign: function (textAlign, cellData) {
                    if (textAlign != null || cellData == null) {
                        return textAlign;
                    }
                    if (Commmon.Extensions.Util.IsNumber(cellData)) {
                        return Components.TextAlign.right;
                    } else if (Bridge.is(cellData, System.String)) {
                        return Components.TextAlign.left;
                    }
                    return Components.TextAlign.center;
                }
            }
        },
        fields: {
            Headers: null,
            RowData: null,
            Sources: null,
            timeOut: null
        },
        ctors: {
            ctor: function (metadata, rowData) {
                this.$initialize();
                this.Headers = metadata;
                this.RowData = rowData;
            }
        },
        methods: {
            Render: function () {
                MVVM.Html.Instance.Div.ClassName("table-wrapper").Table.ClassName("table striped");
                var table = MVVM.Html.Context;
                MVVM.Html.Instance.End.End.Render();
                this.Headers.Subscribe$2(function (x) { });
                this.RowData.Subscribe$2(Bridge.fn.bind(this, function (args) {
                    if (System.Nullable.eq(args.Action, MVVM.ObservableAction.Update)) {
                    }
                    this.Rerender(table);
                }));
            },
            Rerender: function (table) {
                if (this.timeOut != null) {
                    window.clearTimeout(System.Nullable.getValue(this.timeOut));
                }
                this.timeOut = window.setTimeout(Bridge.fn.bind(this, function () {
                    var $step = 0,
                        $task1, 
                        $jumpFromFinally, 
                        $asyncBody = Bridge.fn.bind(this, function () {
                            for (;;) {
                                $step = System.Array.min([0,1], $step);
                                switch ($step) {
                                    case 0: {
                                        MVVM.Html.Take(table).Clear();
                                        this.RenderTableHeader(table);
                                        $task1 = this.GetMasterData();
                                        $step = 1;
                                        if ($task1.isCompleted()) {
                                            continue;
                                        }
                                        $task1.continue($asyncBody);
                                        return;
                                    }
                                    case 1: {
                                        $task1.getAwaitedResult();
                                        this.RenderTableContent(table);
                                        return;
                                    }
                                    default: {
                                        return;
                                    }
                                }
                            }
                        }, arguments);

                    $asyncBody();
                }));
            },
            GetMasterData: function () {
                var $step = 0,
                    $task1, 
                    $taskResult1, 
                    $jumpFromFinally, 
                    $tcs = new System.Threading.Tasks.TaskCompletionSource(), 
                    $returnValue, 
                    headerSources, 
                    $t, 
                    sourcesRequests, 
                    $async_e, 
                    $asyncBody = Bridge.fn.bind(this, function () {
                        try {
                            for (;;) {
                                $step = System.Array.min([0,1], $step);
                                switch ($step) {
                                    case 0: {
                                        headerSources = ($t = Components.Header$1(Data), System.Linq.Enumerable.from(Commmon.Extensions.Util.DistinctBy(Components.Header$1(Data), System.Type, System.Linq.Enumerable.from(this.Headers.Data$1, Components.Header$1(Data)).where(function (x) {
                                            return x.Reference != null;
                                        }), function (x) {
                                            return x.Reference;
                                        }), $t).toList($t));

                                        sourcesRequests = System.Linq.Enumerable.from(headerSources, Components.Header$1(Data)).select(function (x) {
                                            var sourceType = System.Array.init([x.Reference], System.Type);
                                            var type = Common.Clients.BaseClient$1.apply(null, sourceType);
                                            var httpGet = Bridge.Reflection.getMembers(type, 8, 284, "GetList");
                                            var client = Bridge.createInstance(type);
                                            return Bridge.unbox(Bridge.Reflection.midel(httpGet, Bridge.unbox(client))(null));
                                        });
                                        $task1 = System.Threading.Tasks.Task.whenAll(sourcesRequests);
                                        $step = 1;
                                        if ($task1.isCompleted()) {
                                            continue;
                                        }
                                        $task1.continue($asyncBody);
                                        return;
                                    }
                                    case 1: {
                                        $taskResult1 = $task1.getAwaitedResult();
                                        this.Sources = Bridge.unbox(($taskResult1));
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
            RenderTableHeader: function (table) {
                var html = MVVM.Html.Take(table);
                var headers = this.Headers.Data$1;
                var hasGroup = System.Linq.Enumerable.from(this.Headers.Data$1, Components.Header$1(Data)).any(function (x) {
                        return !System.String.isNullOrEmpty(x.GroupName);
                    });
                html.Thead.TRow.ForEach$1(Components.Header$1(Data), headers, function (header, index) {
                    if (hasGroup && !System.String.isNullOrEmpty(header.GroupName)) {
                        if (!Bridge.referenceEquals(header, System.Linq.Enumerable.from(headers, Components.Header$1(Data)).firstOrDefault(function (x) {
                                return Bridge.referenceEquals(x.GroupName, header.GroupName);
                            }, null))) {
                            return;
                        }
                        html.Th.Render();
                        Components.Renderer.ColSpan(html, System.Linq.Enumerable.from(headers, Components.Header$1(Data)).count(function (x) {
                                return Bridge.referenceEquals(x.GroupName, header.GroupName);
                            }));
                        html.Text$2(header.GroupName).Render();
                        return;
                    }
                    html.Th.Render();
                    if (hasGroup && System.String.isNullOrEmpty(header.GroupName)) {
                        Components.Renderer.RowSpan(html, 2);
                    }
                    if (!Bridge.staticEquals(header.EditEvent, null) || !Bridge.staticEquals(header.DeleteEvent, null)) {
                        Components.Renderer.Margin(Components.Renderer.Icon(Components.Renderer.TextAlign(html, Components.TextAlign.center), "mif-folder-open"), Components.Direction.right, 0).End.Render();
                    } else {
                        html.Span.Text$2(header.HeaderText).End.Render();
                        if (header.Sortable) {
                            html.Span.ClassName("fa fa-filter").Event$1("click", function (e) {
                                MVVM.Html.Take$1(Bridge.as(e.target, HTMLElement)).Closest(MVVM.ElementType.th);
                                var boudingRect = MVVM.Html.Context.getBoundingClientRect();
                                var filter = new Components.ColumnFilter();
                                filter.Render();
                                filter.Top = boudingRect.bottom;
                                filter.Left = boudingRect.left;
                                filter.Toggle();
                            }).End.Render();
                        }
                    }
                    html.EndOf(MVVM.ElementType.th);
                }).EndOf(MVVM.ElementType.tr).Render();

                if (hasGroup) {
                    html.TRow.ForEach$1(Components.Header$1(Data), headers, function (header, index) {
                        if (hasGroup && !System.String.isNullOrEmpty(header.GroupName)) {
                            html.Th.Span.Text$2(header.HeaderText).EndOf(MVVM.ElementType.th);
                        }
                    });
                }
                html.EndOf(MVVM.ElementType.thead);
            },
            RenderTableContent: function (table) {
                var html = MVVM.Html.Take(table);
                html.TBody.ForEach$1(Data, this.RowData.Data$1, Bridge.fn.cacheBind(this, this.RenderRowData)).EndOf$1(".table-wrapper").Render();
            },
            RenderRowData: function (row, index) {
                var html = MVVM.Html.Instance;
                html.TRow.ForEach$1(Components.Header$1(Data), this.Headers.Data$1, Bridge.fn.bind(this, function (header, headerIndex) {
                    var $t, $t1, $t2, $t3;
                    html.TData.Render();
                    if (!Bridge.staticEquals(header.EditEvent, null)) {
                        html.Button.ClassName("button small warning").EventAsync(Data, "click", header.EditEvent, row).Span.ClassName("fa fa-edit").EndOf(MVVM.ElementType.button);
                    }
                    if (!Bridge.staticEquals(header.DeleteEvent, null)) {
                        Components.Renderer.Margin(html.Button.ClassName("button small secondary"), Components.Direction.left, 4).EventAsync(Data, "click", header.DeleteEvent, row).Span.ClassName("fa fa-trash").EndOf(MVVM.ElementType.button);
                    }
                    if (!System.String.isNullOrEmpty(header.FieldName)) {
                        if (!row.hasOwnProperty(header.FieldName)) {
                            throw new System.InvalidOperationException.$ctor1("Cannot find property " + (header.FieldName || ""));
                        }
                        var cellData = row[header.FieldName];
                        var cellText = ($t = (cellData != null ? Bridge.toString(cellData) : null), $t != null ? $t : "");
                        if (cellData != null && Bridge.is(cellData, System.DateTime)) {
                            cellText = System.String.format("{0:dd/MM/yyyy}", [Bridge.box(Bridge.as(cellData, System.DateTime, true), System.DateTime, System.Nullable.toStringFn(System.DateTime.format), System.Nullable.getHashCode)]);
                        }
                        if (header.Reference != null) {
                            var source = ($t1 = System.Linq.Enumerable.from(this.Sources, System.Collections.Generic.IEnumerable$1(System.Object)).firstOrDefault(function (x) {
                                        return Bridge.referenceEquals(Bridge.getType(System.Linq.Enumerable.from(x, System.Object).firstOrDefault(null, null)), header.Reference);
                                    }, null)) != null ? $t1 : null;
                            cellText = ($t2 = System.Linq.Enumerable.from(source, System.Object).firstOrDefault(function (x) {
                                        return Bridge.referenceEquals(x[header.RefValueField], cellData);
                                    }, null)) != null && ($t3 = $t2[header.RefDisplayField]) != null ? Bridge.toString($t3) : null;
                            header.TextAlign = !System.String.isNullOrEmpty(cellText) ? Components.TextAlign.left : header.TextAlign;
                        }
                        header.TextAlign = Components.Table$1(Data).CalcTextAlign(header.TextAlign, cellData);
                        Components.Renderer.TextAlign(html, header.TextAlign).Text$2(cellText).End.Render();
                    }
                }));
            }
        }
    }; });

    Bridge.define("Components.TextAlign", {
        $kind: "enum",
        statics: {
            fields: {
                center: 0,
                end: 1,
                inherit: 2,
                initial: 3,
                justify: 4,
                left: 5,
                right: 6,
                start: 7,
                unset: 8
            }
        }
    });

    Bridge.define("Components.ColumnFilter", {
        inherits: [Components.Component],
        fields: {
            Title: null,
            Left: 0,
            Top: 0
        },
        methods: {
            Render: function () {
                MVVM.Html.Take$2("#columnFilter");
                if (MVVM.Html.Context != null) {
                    return;
                }

                Components.Renderer.SmallCheckbox(Components.Renderer.SmallCheckbox(Components.Renderer.SmallCheckbox(Components.Renderer.SmallCheckbox(Components.Renderer.SmallCheckbox(Components.Renderer.Panel(Components.Renderer.SmallCheckbox(Components.Renderer.SmallInput(MVVM.Html.Take$1(document.body).Div.Id("columnFilter").ClassName("hide").Div.Div.ClassName("div-sort").Button.ClassName("button small rounded").Span.ClassName("fa fa-sort-amount-up-alt").End.Text$2(" Ascending").End.Button.ClassName("button small rounded").Span.ClassName("fa fa-sort-amount-down-alt").End.Text$2(" Descending").End.End.Div.ClassName("div-type").Anchor.Text$2("Filter by Condition").End.Anchor.Text$2("Filter by Value").End.End).ClassName("searchbox").Attr("placeholder", "Search").End.Div.ClassName("div-edt-val"), "Select All").End), "8/13/2011").End, "14/11/2011").End, "27/12/2018").End, "05/06/2019").End, "23/09/2019").End.End.Render();
            },
            Toggle: function () {
                var $t;
                MVVM.Html.Take$2("#columnFilter");
                if (MVVM.Html.Context == null) {
                    throw new System.InvalidOperationException.$ctor1("Column filter hasn't been initialized");
                }
                var isHidden = System.String.contains(MVVM.Html.Context.className,"hide");
                if (isHidden) {
                    MVVM.Html.Context.className = MVVM.Html.Context.className.replace(new RegExp("\\s?hide\\s?"), "");
                } else {
                    ($t = MVVM.Html.Context).className = ($t.className || "") + "hide";
                }
                var filter = Bridge.as(MVVM.Html.Context, HTMLElement);
                filter.style.top = System.Double.format(this.Top) + "px";
                filter.style.left = System.Double.format(this.Left) + "px";
            }
        }
    });
});
