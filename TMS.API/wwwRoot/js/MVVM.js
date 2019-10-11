/**
 * @version 1.0.0.0
 * @copyright Copyright ©  2019
 * @compiler Bridge.NET 17.9.0
 */
Bridge.assembly("MVVM", function ($asm, globals) {
    "use strict";

    Bridge.define("MVVM.ElementType", {
        $kind: "enum",
        statics: {
            fields: {
                a: 0,
                abbr: 1,
                address: 2,
                area: 3,
                article: 4,
                aside: 5,
                audio: 6,
                b: 7,
                base: 8,
                bdi: 9,
                bdo: 10,
                blockquote: 11,
                button: 12,
                canvas: 13,
                caption: 14,
                cite: 15,
                code: 16,
                col: 17,
                colgroup: 18,
                datalist: 19,
                dd: 20,
                del: 21,
                details: 22,
                dfn: 23,
                div: 24,
                dl: 25,
                dt: 26,
                em: 27,
                embed: 28,
                fieldset: 29,
                figcaption: 30,
                figure: 31,
                footer: 32,
                form: 33,
                h1: 34,
                h2: 35,
                h3: 36,
                h4: 37,
                h5: 38,
                h6: 39,
                head: 40,
                header: 41,
                i: 42,
                iframe: 43,
                img: 44,
                input: 45,
                ins: 46,
                kbd: 47,
                keygen: 48,
                label: 49,
                legend: 50,
                li: 51,
                link: 52,
                main: 53,
                map: 54,
                mark: 55,
                menu: 56,
                menuitem: 57,
                meta: 58,
                meter: 59,
                nav: 60,
                object: 61,
                ol: 62,
                ptgroup: 63,
                option: 64,
                output: 65,
                p: 66,
                param: 67,
                pre: 68,
                progress: 69,
                q: 70,
                rp: 71,
                rt: 72,
                ruby: 73,
                s: 74,
                samp: 75,
                script: 76,
                section: 77,
                select: 78,
                small: 79,
                source: 80,
                span: 81,
                strong: 82,
                style: 83,
                sub: 84,
                summary: 85,
                sup: 86,
                table: 87,
                tbody: 88,
                td: 89,
                textarea: 90,
                tfoot: 91,
                th: 92,
                thead: 93,
                time: 94,
                title: 95,
                tr: 96,
                track: 97,
                u: 98,
                ul: 99,
                var: 100,
                video: 101
            }
        }
    });

    Bridge.define("MVVM.Html", {
        statics: {
            fields: {
                _instance: null,
                Context: null
            },
            props: {
                Instance: {
                    get: function () {
                        if (MVVM.Html._instance == null) {
                            MVVM.Html._instance = new MVVM.Html.ctor();
                        }
                        return MVVM.Html._instance;
                    }
                }
            },
            methods: {
                Take$2: function (selector) {
                    MVVM.Html.Context = document.querySelector(selector);
                    return MVVM.Html.Instance;
                },
                Take$1: function (ele) {
                    MVVM.Html.Context = ele;
                    return MVVM.Html.Instance;
                },
                Take: function (ele) {
                    MVVM.Html.Context = ele;
                    return MVVM.Html.Instance;
                }
            }
        },
        props: {
            Div: {
                get: function () {
                    return this.Add(MVVM.ElementType.div);
                }
            },
            H1: {
                get: function () {
                    return this.Add(MVVM.ElementType.h1);
                }
            },
            H2: {
                get: function () {
                    return this.Add(MVVM.ElementType.h2);
                }
            },
            H3: {
                get: function () {
                    return this.Add(MVVM.ElementType.h3);
                }
            },
            H4: {
                get: function () {
                    return this.Add(MVVM.ElementType.h4);
                }
            },
            H5: {
                get: function () {
                    return this.Add(MVVM.ElementType.h5);
                }
            },
            H6: {
                get: function () {
                    return this.Add(MVVM.ElementType.h6);
                }
            },
            Nav: {
                get: function () {
                    return this.Add(MVVM.ElementType.nav);
                }
            },
            Input: {
                get: function () {
                    return this.Add(MVVM.ElementType.input);
                }
            },
            Select: {
                get: function () {
                    return this.Add(MVVM.ElementType.select);
                }
            },
            Option: {
                get: function () {
                    return this.Add(MVVM.ElementType.option);
                }
            },
            Span: {
                get: function () {
                    return this.Add(MVVM.ElementType.span);
                }
            },
            I: {
                get: function () {
                    return this.Add(MVVM.ElementType.i);
                }
            },
            Img: {
                get: function () {
                    return this.Add(MVVM.ElementType.img);
                }
            },
            Button: {
                get: function () {
                    return this.Add(MVVM.ElementType.button);
                }
            },
            Table: {
                get: function () {
                    return this.Add(MVVM.ElementType.table);
                }
            },
            Thead: {
                get: function () {
                    return this.Add(MVVM.ElementType.thead);
                }
            },
            Th: {
                get: function () {
                    return this.Add(MVVM.ElementType.th);
                }
            },
            TBody: {
                get: function () {
                    return this.Add(MVVM.ElementType.tbody);
                }
            },
            TRow: {
                get: function () {
                    return this.Add(MVVM.ElementType.tr);
                }
            },
            TData: {
                get: function () {
                    return this.Add(MVVM.ElementType.td);
                }
            },
            P: {
                get: function () {
                    return this.Add(MVVM.ElementType.p);
                }
            },
            TextArea: {
                get: function () {
                    return this.Add(MVVM.ElementType.textarea);
                }
            },
            Br: {
                get: function () {
                    var br = document.createElement("br");
                    MVVM.Html.Context.appendChild(br);
                    return this;
                }
            },
            Hr: {
                get: function () {
                    var hr = document.createElement("hr");
                    MVVM.Html.Context.appendChild(hr);
                    return this;
                }
            },
            Ul: {
                get: function () {
                    return this.Add(MVVM.ElementType.ul);
                }
            },
            Li: {
                get: function () {
                    return this.Add(MVVM.ElementType.li);
                }
            },
            Anchor: {
                get: function () {
                    return this.Add(MVVM.ElementType.a);
                }
            },
            Form: {
                get: function () {
                    return this.Add(MVVM.ElementType.form);
                }
            },
            Label: {
                get: function () {
                    return this.Add(MVVM.ElementType.label);
                }
            },
            End: {
                get: function () {
                    MVVM.Html.Context = MVVM.Html.Context.parentElement;
                    return this;
                }
            }
        },
        ctors: {
            $ctor2: function (selector) {
                this.$initialize();
                MVVM.Html.Context = document.querySelector(selector);
            },
            ctor: function () {
                this.$initialize();

            },
            $ctor1: function (ele) {
                this.$initialize();
                MVVM.Html.Context = ele;
            }
        },
        methods: {
            EndOf: function (type) {
                return this.EndOf$1(System.Enum.toString(MVVM.ElementType, type));
            },
            EndOf$1: function (selector) {
                var result = MVVM.Html.Context;
                while (result != null) {
                    if (result.querySelector(selector) != null) {
                        break;
                    } else {
                        result = result.parentElement;
                    }
                }

                MVVM.Html.Context = result || (function () {
                    throw new System.InvalidOperationException.$ctor1("Cannot find the element of selector " + (selector || ""));
                })();
                return this;
            },
            Closest: function (type) {
                return this.Closest$1(System.Enum.toString(MVVM.ElementType, type));
            },
            Closest$1: function (selector) {
                var result = MVVM.Html.Context;
                while (result != null) {
                    if (result.parentElement != null && result.parentElement.querySelector(selector) != null) {
                        break;
                    } else {
                        result = result.parentElement;
                    }
                }

                MVVM.Html.Context = result || (function () {
                    throw new System.InvalidOperationException.$ctor1("Cannot find the element of selector " + (selector || ""));
                })();
                return this;
            },
            Render$1: function (html) {
                MVVM.Html.Context.innerHTML = html;
            },
            Render: function () { },
            Add: function (type) {
                var ele = document.createElement(System.Enum.toString(MVVM.ElementType, type));
                MVVM.Html.Context.appendChild(ele);
                MVVM.Html.Context = ele;
                return this;
            },
            Id: function (id) {
                MVVM.Html.Context.id = id;
                return this;
            },
            ClassName: function (className) {
                className = (MVVM.Html.Context.className || "") + " " + (className || "");
                MVVM.Html.Context.className = className.trim();
                return this;
            },
            Style: function (style) {
                MVVM.Html.Context.style.cssText += style.trim();
                return this;
            },
            Clear: function () {
                MVVM.Html.Context.innerHTML = "";
                return this;
            },
            Value: function (val) {
                var input = { };
                var textArea = { };
                Bridge.Deconstruct(this.GetInputOrTextArea().$clone(), input, textArea);
                if (input.v != null) {
                    input.v.value = val;
                } else if (textArea.v != null) {
                    textArea.v.value = val;
                }
                return this;
            },
            Value$1: function (T, val) {
                var $t, $t1;
                var input = { };
                var textArea = { };
                Bridge.Deconstruct(this.GetInputOrTextArea().$clone(), input, textArea);
                if (input.v != null) {
                    input.v.value = ($t = val.Data$1) != null ? Bridge.toString($t) : null;
                    input.v.oninput = Bridge.fn.combine(input.v.oninput, function (e) {
                        val.Data$1 = System.String.isNullOrEmpty(input.v.value) ? Bridge.getDefaultValue(T) : Bridge.cast(Bridge.unbox(System.Convert.changeType(input.v.value, T), T), T);
                    });
                    val.Subscribe$1(function (arg) {
                        var $t1;
                        input.v.value = ($t1 = arg.NewData) != null ? Bridge.toString($t1) : null;
                    });
                } else if (textArea.v != null) {
                    textArea.v.value = ($t1 = val.Data$1) != null ? Bridge.toString($t1) : null;
                    textArea.v.oninput = Bridge.fn.combine(textArea.v.oninput, function (e) {
                        val.Data$1 = System.String.isNullOrEmpty(textArea.v.value) ? Bridge.getDefaultValue(T) : Bridge.cast(Bridge.unbox(System.Convert.changeType(textArea.v.value, T), T), T);
                    });
                    val.Subscribe$1(function (arg) {
                        var $t2;
                        textArea.v.value = ($t2 = arg.NewData) != null ? Bridge.toString($t2) : null;
                    });
                }
                return this;
            },
            GetInputOrTextArea: function () {
                var input = Bridge.as(MVVM.Html.Context, HTMLInputElement);
                var textArea = Bridge.as(MVVM.Html.Context, HTMLTextAreaElement);
                return new (System.ValueTuple$2(HTMLInputElement,HTMLTextAreaElement)).$ctor1(input, textArea);
            },
            Attr: function (attr, val) {
                MVVM.Html.Context.setAttribute(attr, val);
                return this;
            },
            Type: function (val) {
                MVVM.Html.Context.setAttribute("type", val);
                return this;
            },
            Href: function (val) {
                MVVM.Html.Context.setAttribute("href", val);
                return this;
            },
            Src: function (val) {
                MVVM.Html.Context.setAttribute("src", val);
                return this;
            },
            Text$2: function (val) {
                var text = document.createTextNode(val);
                MVVM.Html.Context.appendChild(text);
                return this;
            },
            Text: function (val) {
                var text = document.createTextNode(Bridge.toString(val.Data));
                val.Subscribe(function (arg) {
                    var $t;
                    text.textContent = ($t = arg.NewData) != null ? Bridge.toString($t) : null;
                });
                MVVM.Html.Context.appendChild(text);
                return this;
            },
            Text$1: function (val) {
                var text = document.createTextNode(val.Data$1);
                val.Subscribe$1(function (arg) {
                    text.textContent = arg.NewData;
                });
                MVVM.Html.Context.appendChild(text);
                return this;
            },
            Event: function (type, action) {
                MVVM.Html.Context.addEventListener(type, function (e) {
                    action();
                });
                return this;
            },
            Event$1: function (type, action) {
                MVVM.Html.Context.addEventListener(type, function (e) {
                    action(e);
                });
                return this;
            },
            Event$4: function (T, type, action, model) {
                MVVM.Html.Context.addEventListener(type, function (e) {
                    action(e, model);
                });
                return this;
            },
            Event$2: function (T, type, action, model) {
                MVVM.Html.Context.addEventListener(type, function (e) {
                    action(model);
                });
                return this;
            },
            Event$3: function (T, type, action, model) {
                MVVM.Html.Context.addEventListener(type, function (e) {
                    action(model, e);
                });
                return this;
            },
            AsyncEvent: function (type, action) {
                MVVM.Html.Context.addEventListener(type, Bridge.fn.bind(this, function (e) {
                    var $step = 0,
                        $task1, 
                        $jumpFromFinally, 
                        $asyncBody = Bridge.fn.bind(this, function () {
                            for (;;) {
                                $step = System.Array.min([0,1], $step);
                                switch ($step) {
                                    case 0: {
                                        $task1 = action();
                                        $step = 1;
                                        if ($task1.isCompleted()) {
                                            continue;
                                        }
                                        $task1.continue($asyncBody);
                                        return;
                                    }
                                    case 1: {
                                        $task1.getAwaitedResult();
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
                return this;
            },
            EventAsync: function (T, type, action, model) {
                MVVM.Html.Context.addEventListener(type, Bridge.fn.bind(this, function (e) {
                    var $step = 0,
                        $task1, 
                        $jumpFromFinally, 
                        $asyncBody = Bridge.fn.bind(this, function () {
                            for (;;) {
                                $step = System.Array.min([0,1], $step);
                                switch ($step) {
                                    case 0: {
                                        $task1 = action(model);
                                        $step = 1;
                                        if ($task1.isCompleted()) {
                                            continue;
                                        }
                                        $task1.continue($asyncBody);
                                        return;
                                    }
                                    case 1: {
                                        $task1.getAwaitedResult();
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
                return this;
            },
            Trigger: function (type) {
                (MVVM.Html.Context[System.Enum.toString(System.String, type)])();
                return this;
            },
            ClearContextContent: function () {
                MVVM.Html.Context.innerHTML = "";
            },
            ForEach$1: function (T, list, renderer) {
                if (list == null) {
                    throw new System.ArgumentNullException.$ctor1("list");
                }
                var element = MVVM.Html.Context;

                var length = System.Linq.Enumerable.from(list, T).count();
                var index = -1;
                var enumerator = Bridge.getEnumerator(list, T);

                while (((index = (index + 1) | 0)) < length) {
                    MVVM.Html.Context = element;
                    enumerator.System$Collections$IEnumerator$moveNext();
                    renderer.call(element, enumerator[Bridge.geti(enumerator, "System$Collections$Generic$IEnumerator$1$" + Bridge.getTypeAlias(T) + "$Current$1", "System$Collections$Generic$IEnumerator$1$Current$1")], Bridge.box(index, System.Int32));
                }
                MVVM.Html.Context = element;
                return this;
            },
            ForEach: function (T, observableArray, renderer) {
                var $t;
                if (observableArray == null) {
                    throw new System.ArgumentNullException.$ctor1("observableArray");
                }
                var element = MVVM.Html.Context;

                var array = Bridge.as(observableArray.Data$1, Array);
                var length = array.length;
                var index = -1;

                while (((index = (index + 1) | 0)) < length) {
                    MVVM.Html.Context = element;
                    renderer.call(element, ($t = array[index], $t != null ? $t : Bridge.box(index, System.Int32)), Bridge.box(index, System.Int32));
                }
                observableArray.Subscribe$2(Bridge.fn.bind(this, function (e) {
                    var $t1;
                    e.Element = element;
                    e.Renderer = renderer;
                    e.Action = ($t1 = e.Action, $t1 != null ? $t1 : MVVM.ObservableAction.Render);
                    this.Update(T, e);
                }));
                return this;
            },
            Update: function (T, arg) {
                var $t;
                var numOfElement = 0;
                MVVM.Html.Context = arg.Element;
                switch (arg.Action) {
                    case MVVM.ObservableAction.Push: 
                        arg.Renderer.call(arg.Element, arg.Item, Bridge.box(arg.Index, System.Int32));
                        break;
                    case MVVM.ObservableAction.Add: 
                        if (arg.Index === ((arg.Array.length - 1) | 0)) {
                            arg.Renderer.call(arg.Element, arg.Item, Bridge.box(arg.Index, System.Int32));
                            return;
                        }
                        var div = document.createElement("div");
                        MVVM.Html.Context = div;
                        arg.Renderer.call(div, arg.Item, Bridge.box(arg.Index, System.Int32));
                        this.AppendChildList(arg.Element, div, arg.Index);
                        break;
                    case MVVM.ObservableAction.Remove: 
                        numOfElement = (Bridge.Int.div(arg.Element.children.length, (((arg.Array.length + 1) | 0)))) | 0;
                        this.RemoveChildList(arg.Element, arg.Index, numOfElement);
                        break;
                    case MVVM.ObservableAction.Move: 
                        numOfElement = (Bridge.Int.div(arg.Element.children.length, arg.Array.length)) | 0;
                        var newIndex = arg.Index;
                        var oldIndex = System.Array.indexOfT(arg.Array, arg.Item);
                        if (newIndex === oldIndex) {
                            return;
                        }
                        var firstOldElementIndex = Bridge.Int.mul(oldIndex, numOfElement);
                        var nodeToInsert = oldIndex < newIndex ? arg.Element.children[Bridge.Int.mul((((newIndex + 1) | 0)), numOfElement)] : arg.Element.children[Bridge.Int.mul(newIndex, numOfElement)];
                        for (var j = 0; j < numOfElement; j = (j + 1) | 0) {
                            arg.Element.insertBefore(arg.Element.children[firstOldElementIndex], nodeToInsert);
                            if (oldIndex > newIndex) {
                                firstOldElementIndex = (firstOldElementIndex + 1) | 0;
                            }
                        }
                        break;
                    case MVVM.ObservableAction.Render: 
                        this.ClearContextContent();
                        var length = arg.Array.length;
                        var i = -1;
                        while (((i = (i + 1) | 0)) < length) {
                            MVVM.Html.Context = arg.Element;
                            arg.Renderer.call(arg.Element, ($t = arg.Array)[System.Array.index(i, $t)], Bridge.box(i, System.Int32));
                        }
                        break;
                }
            },
            AppendChildList: function (parent, tmpNode, index) {
                var previousNode = null;
                index = Bridge.Int.mul(index, tmpNode.children.length);
                previousNode = parent.children[index];
                while (tmpNode.children.length > 0) {
                    parent.insertBefore(tmpNode.children[0], previousNode);
                }
            },
            RemoveChildList: function (parent, index, numOfElement) {
                var startIndex = Bridge.Int.mul(index, numOfElement);
                for (var i = 0; i < numOfElement && parent.children.length > 0; i = (i + 1) | 0) {
                    parent.removeChild(parent.children[startIndex]);
                }
            },
            Dropdown$1: function (T, list, selectedItem, displayField, valueField) {
                if (displayField === void 0) { displayField = null; }
                if (valueField === void 0) { valueField = null; }
                if (!Bridge.referenceEquals(MVVM.Html.Context.nodeName.toLowerCase(), "select")) {
                    this.Select.Render();
                }
                var select = Bridge.as(MVVM.Html.Context, HTMLSelectElement);
                list.ForEach(Bridge.fn.bind(this, function (model) {
                    var text = displayField == null ? Bridge.toString(model) : Bridge.as(model[displayField], System.String);
                    var value = valueField == null ? Bridge.toString(model) : Bridge.as(model[valueField], System.String);
                    this.Option.Text$2(text).Value(value).End.Render();
                }));
                select.selectedIndex = this.GetSelectedIndex(T, list, selectedItem, valueField);
                return this;
            },
            Dropdown: function (T, list, selectedItem, displayField, valueField) {
                var $t;
                if (!Bridge.referenceEquals(MVVM.Html.Context.nodeName.toLowerCase(), "select")) {
                    this.Select.Render();
                }
                var select = Bridge.as(MVVM.Html.Context, HTMLSelectElement);

                this.ForEach(T, list, Bridge.fn.bind(this, function (model, index) {
                    var text = Bridge.as(model[displayField], System.String);
                    var value = Bridge.as(model[valueField], System.String);
                    this.Option.Text$2(text).Value(value).End.Render();
                }));

                select.selectedIndex = this.GetSelectedIndex(T, ($t = T, System.Linq.Enumerable.from(list.Data$1, $t).toList($t)), selectedItem.Data$1, valueField);
                list.Subscribe$2(Bridge.fn.bind(this, function (realList) {
                    var $t1;
                    select.selectedIndex = this.GetSelectedIndex(T, ($t1 = T, System.Linq.Enumerable.from(realList.Array, $t1).toList($t1)), selectedItem.Data$1, valueField);
                }));

                selectedItem.BindingNodes.add(select);

                this.Event("change", function () {
                    var $t1;
                    var selectedObj = ($t1 = list.Data$1)[System.Array.index(select.selectedIndex, $t1)];
                    selectedItem.Data$1 = selectedObj;
                });

                selectedItem.Subscribe$1(Bridge.fn.bind(this, function (val) {
                    var $t1;
                    select.selectedIndex = this.GetSelectedIndex(T, ($t1 = T, System.Linq.Enumerable.from(list.Data$1, $t1).toList($t1)), val.NewData, valueField);
                }));

                return this;
            },
            GetSelectedIndex: function (T, list, item, valueField) {
                if (item == null) {
                    return -1;
                }
                var arr = list.ToArray();
                var index = System.Array.indexOfT(arr, item);
                if (!Bridge.referenceEquals(valueField, "")) {
                    var selectedItem = System.Array.find(T, arr, function (x) {
                            return Bridge.referenceEquals(x[valueField], item[valueField]);
                        });
                    index = System.Array.indexOfT(arr, selectedItem);
                }
                return index;
            },
            Visible: function (visible) {
                var ele = Bridge.as(MVVM.Html.Context, HTMLElement);
                ele.style.display = visible.Data$1 ? "" : System.Enum.toString(System.String, "none");
                visible.Subscribe$1(function (arg) {
                    ele.style.display = arg.NewData ? "" : System.Enum.toString(System.String, "none");
                });
                return this;
            },
            Hidden: function (hidden) {
                var ele = Bridge.as(MVVM.Html.Context, HTMLElement);
                ele.style.display = hidden.Data$1 ? System.Enum.toString(System.String, "none") : "";
                hidden.Subscribe$1(function (arg) {
                    ele.style.display = arg.NewData ? System.Enum.toString(System.String, "none") : "";
                });
                return this;
            }
        }
    });

    Bridge.define("MVVM.Observable", {
        statics: {
            fields: {
                _computedStack: null,
                _exeStack: null
            },
            ctors: {
                init: function () {
                    this._computedStack = new (System.Collections.Generic.List$1(MVVM.Observable)).ctor();
                    this._exeStack = new (System.Collections.Generic.List$1(MVVM.Observable)).ctor();
                }
            },
            methods: {
                Of: function (T, value) {
                    return new (MVVM.Observable$1(T)).$ctor1(value);
                },
                Of$1: function (T, value) {
                    return new (MVVM.Observable$1(T)).$ctor2(value);
                },
                Of$2: function (T, value) {
                    return new (MVVM.ObservableArray$1(T)).$ctor1(value);
                }
            }
        },
        fields: {
            BindingNodes: null,
            _computedFn: null,
            _oldValue: null,
            _newValue: null,
            _subscribers: null,
            _dependencies: null,
            delayTime: null,
            animationFrameId: 0
        },
        props: {
            Data: {
                get: function () {
                    var res;
                    if (!Bridge.staticEquals(this._computedFn, null)) {
                        MVVM.Observable._computedStack.add(this);
                        res = this._computedFn();
                        this._oldValue = this._newValue;
                        this._newValue = res;
                        MVVM.Observable._computedStack.removeAt(((MVVM.Observable._computedStack.Count - 1) | 0));
                    } else {
                        res = this._newValue;
                    }
                    if (MVVM.Observable._computedStack.Count > 0) {
                        this.SetDependency(MVVM.Observable._computedStack.getItem(((MVVM.Observable._computedStack.Count - 1) | 0)));
                    }
                    return res;
                },
                set: function (value) {
                    if (Bridge.referenceEquals(this._newValue, value)) {
                        return;
                    }
                    this._oldValue = this._newValue;
                    this._newValue = value;
                    this.NotifyChange();
                }
            }
        },
        ctors: {
            init: function () {
                this.BindingNodes = new (System.Collections.Generic.List$1(HTMLElement)).ctor();
                this._subscribers = new (System.Collections.Generic.List$1(Function)).ctor();
                this._dependencies = new (System.Collections.Generic.List$1(MVVM.Observable)).ctor();
                this.animationFrameId = -1;
            },
            $ctor1: function (data) {
                this.$initialize();
                this._oldValue = data;
                this._newValue = data;
            },
            ctor: function (data) {
                var $t;
                this.$initialize();
                this._computedFn = data;
                MVVM.Observable._computedStack.add(this);
                this._newValue = ($t = data(), this._oldValue = $t, $t);
                MVVM.Observable._computedStack.removeAt(((MVVM.Observable._computedStack.Count - 1) | 0));
            }
        },
        methods: {
            Subscribe: function (subscriber) {
                this._subscribers.add(subscriber);
            },
            SetDependency: function (dependency) {
                var index = this._dependencies.indexOf(dependency);
                if (index >= 0 || Bridge.referenceEquals(dependency, this)) {
                    return;
                }
                this._dependencies.add(dependency);
            },
            Notify: function () {
                var isBeingExecuted = MVVM.Observable._exeStack.indexOf(this) >= 0;
                if (isBeingExecuted) {
                    return;
                }
                MVVM.Observable._exeStack.add(this);
                var newData = this.Data;
                this._subscribers.ForEach(Bridge.fn.bind(this, function (subscriber) {
                    var $t;
                    subscriber(($t = new MVVM.ObservableArgs(), $t.NewData = newData, $t.OldData = this._oldValue, $t));
                }));
                this._dependencies.ForEach(function (dpc) {
                    dpc.NotifyChange();
                });
                MVVM.Observable._exeStack.remove(this);
            },
            NotifyChange: function () {
                var $t;
                if (Bridge.staticEquals(this._computedFn, null) && this.delayTime == null) {
                    this.Notify();
                } else {
                    window.clearTimeout(this.animationFrameId);
                    this.animationFrameId = window.setTimeout(Bridge.fn.cacheBind(this, this.Notify), ($t = this.delayTime, $t != null ? $t : 0));
                }
            },
            SetDelay: function (delay) {
                this.delayTime = delay;
            }
        }
    });

    Bridge.define("MVVM.ObservableAction", {
        $kind: "enum",
        statics: {
            fields: {
                Render: 0,
                Push: 1,
                Add: 2,
                Update: 3,
                Remove: 4,
                Move: 5
            }
        }
    });

    Bridge.define("MVVM.ObservableArgs", {
        fields: {
            NewData: null,
            OldData: null
        }
    });

    Bridge.define("MVVM.ObservableArgs$1", function (T) { return {
        fields: {
            NewData: Bridge.getDefaultValue(T),
            OldData: Bridge.getDefaultValue(T)
        }
    }; });

    Bridge.define("MVVM.ObservableArrayArgs$1", function (T) { return {
        fields: {
            Array: null,
            Item: Bridge.getDefaultValue(T),
            Index: 0,
            Action: null,
            Element: null,
            Renderer: null
        }
    }; });

    Bridge.define("MVVM.SelectListItem", {
        fields: {
            Value: null,
            Display: null
        }
    });

    Bridge.define("MVVM.Observable$1", function (T) { return {
        inherits: [MVVM.Observable],
        props: {
            Data$1: {
                get: function () {
                    return Bridge.cast(Bridge.unbox(Bridge.ensureBaseProperty(this, "Data").$MVVM$Observable$Data, T), T);
                },
                set: function (value) {
                    Bridge.ensureBaseProperty(this, "Data").$MVVM$Observable$Data = value;
                }
            }
        },
        ctors: {
            ctor: function () {
                this.$initialize();
                MVVM.Observable.$ctor1.call(this, Bridge.getDefaultValue(T));

            },
            $ctor1: function (data) {
                this.$initialize();
                MVVM.Observable.$ctor1.call(this, data);

            },
            $ctor2: function (data) {
                this.$initialize();
                MVVM.Observable.ctor.call(this, data);

            }
        },
        methods: {
            Subscribe$1: function (subscriber) {
                var action = subscriber;
                this._subscribers.add(action);
            },
            Notify: function () {
                var isBeingExecuted = MVVM.Observable._exeStack.indexOf(this) >= 0;
                if (isBeingExecuted) {
                    return;
                }
                MVVM.Observable._exeStack.add(this);
                var newData = this.Data$1;
                this._subscribers.ForEach(Bridge.fn.bind(this, function (subscriber) {
                    var $t;
                    subscriber(($t = new (MVVM.ObservableArgs$1(T))(), $t.NewData = newData, $t.OldData = Bridge.cast(Bridge.unbox(this._oldValue, T), T), $t));
                }));
                this._dependencies.ForEach(function (dpc) {
                    dpc.NotifyChange();
                });
                MVVM.Observable._exeStack.remove(this);
            }
        }
    }; });

    Bridge.define("MVVM.ObservableArray$1", function (T) { return {
        inherits: [MVVM.Observable$1(System.Array.type(T))],
        ctors: {
            ctor: function () {
                this.$initialize();
                MVVM.Observable$1(System.Array.type(T)).$ctor1.call(this, System.Array.init([], T));
            },
            $ctor1: function (data) {
                this.$initialize();
                MVVM.Observable$1(System.Array.type(T)).$ctor1.call(this, data);
            }
        },
        methods: {
            Subscribe$2: function (subscriber) {
                var action = subscriber;
                if (!this._subscribers.contains(action)) {
                    this._subscribers.add(action);
                }
            },
            Notify: function () {
                var $t;
                this.NotifyArrayChanged(($t = new (MVVM.ObservableArrayArgs$1(T))(), $t.Array = this.Data$1, $t.Item = Bridge.getDefaultValue(T), $t.Index = -1, $t.Action = MVVM.ObservableAction.Render, $t));
            },
            NotifyArrayChanged: function (arg) {
                var isBeingExecuted = MVVM.Observable._exeStack.contains(this);
                if (isBeingExecuted) {
                    return;
                }
                MVVM.Observable._exeStack.add(this);
                this._subscribers.ForEach(function (subscriber) {
                    subscriber(arg);
                });
                this._dependencies.ForEach(function (dpc) {
                    dpc.NotifyChange();
                });
                MVVM.Observable._exeStack.remove(this);
            },
            Add: function (item, index) {
                var $t, $t1;
                if (index === void 0) { index = null; }
                var array = this.Data$1;
                var position = ($t = index, $t != null ? $t : array.length);
                array.splice(position, 0, item);
                this.NotifyArrayChanged(($t1 = new (MVVM.ObservableArrayArgs$1(T))(), $t1.Array = array, $t1.Item = item, $t1.Index = position, $t1.Action = MVVM.ObservableAction.Add, $t1));
            },
            AddRange: function (items) {
                if (items === void 0) { items = []; }
                items.forEach(Bridge.fn.bind(this, function (x) {
                        this.Add(x);
                    }));
            },
            Remove: function (item) {
                var array = this.Data$1;
                var index = System.Array.indexOfT(array, item);
                this.RemoveAt(index);
            },
            RemoveAt: function (index) {
                var $t;
                var array = this.Data$1;
                var item = array[System.Array.index(index, array)];
                array.splice(index, 1);
                this.NotifyArrayChanged(($t = new (MVVM.ObservableArrayArgs$1(T))(), $t.Array = array, $t.Item = item, $t.Index = index, $t.Action = MVVM.ObservableAction.Remove, $t));
            },
            Replace: function (item, itemUpdated) {
                var array = this.Data$1;
                var index = System.Array.indexOfT(array, item);
                this.RemoveAt(index);
                this.Add(itemUpdated, index);
            },
            Update: function (item, index) {
                var $t;
                var array = this.Data$1;
                array[System.Array.index(index, array)] = item;
                this.NotifyArrayChanged(($t = new (MVVM.ObservableArrayArgs$1(T))(), $t.Array = array, $t.Item = item, $t.Index = index, $t.Action = MVVM.ObservableAction.Update, $t));
            }
        }
    }; });
});
