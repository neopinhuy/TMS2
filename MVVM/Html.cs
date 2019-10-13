using Bridge.Html5;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MVVM
{
    public class Html
    {
        private static Html _instance;
        public static Element Context { get; set; }

        public Html(string selector)
        {
            Context = Document.QuerySelector(selector);
        }

        public Html()
        {
            
        }

        public Html(Element ele)
        {
            Context = ele;
        }

        public static Html Take(string selector)
        {
            Context = Document.QuerySelector(selector);
            return Instance;
        }

        public static Html Take(HTMLElement ele)
        {
            Context = ele;
            return Instance;
        }

        public static Html Take(Element ele)
        {
            Context = ele;
            return Instance;
        }

        public static Html Instance
        {
            get
            {
                if (_instance == null) _instance = new Html();
                return _instance;
            }
        }

        public Html Div
        {
            get
            {
                return Add(ElementType.div);
            }
        }

        public Html H1
        {
            get
            {
                return Add(ElementType.h1);
            }
        }

        public Html H2
        {
            get
            {
                return Add(ElementType.h2);
            }
        }

        public Html H3
        {
            get
            {
                return Add(ElementType.h3);
            }
        }

        public Html H4
        {
            get
            {
                return Add(ElementType.h4);
            }
        }

        public Html H5
        {
            get
            {
                return Add(ElementType.h5);
            }
        }

        public Html H6
        {
            get
            {
                return Add(ElementType.h6);
            }
        }

        public Html Nav
        {
            get
            {
                return Add(ElementType.nav);
            }
        }

        public Html Input
        {
            get
            {
                return Add(ElementType.input);
            }
        }

        public Html Select
        {
            get
            {
                return Add(ElementType.select);
            }
        }

        public Html Option
        {
            get
            {
                return Add(ElementType.option);
            }
        }

        public Html Span
        {
            get
            {
                return Add(ElementType.span);
            }
        }

        public Html I
        {
            get
            {
                return Add(ElementType.i);
            }
        }

        public Html Img
        {
            get
            {
                return Add(ElementType.img);
            }
        }

        public Html Button
        {
            get
            {
                return Add(ElementType.button);
            }
        }

        public Html Table
        {
            get
            {
                return Add(ElementType.table);
            }
        }

        public Html Thead
        {
            get
            {
                return Add(ElementType.thead);
            }
        }

        public Html Th
        {
            get
            {
                return Add(ElementType.th);
            }
        }

        public Html TBody
        {
            get
            {
                return Add(ElementType.tbody);
            }
        }

        public Html TRow
        {
            get
            {
                return Add(ElementType.tr);
            }
        }

        public Html TData
        {
            get
            {
                return Add(ElementType.td);
            }
        }

        public Html P
        {
            get
            {
                return Add(ElementType.p);
            }
        }

        public Html TextArea
        {
            get
            {
                return Add(ElementType.textarea);
            }
        }

        public Html Br
        {
            get
            {
                var br = new HTMLBRElement();
                Context.AppendChild(br);
                return this;
            }
        }

        public Html Hr
        {
            get
            {
                var hr = new HTMLHRElement();
                Context.AppendChild(hr);
                return this;
            }
        }

        public Html Ul
        {
            get
            {
                return Add(ElementType.ul);
            }
        }

        public Html Li
        {
            get
            {
                return Add(ElementType.li);
            }
        }

        public Html Anchor
        {
            get
            {
                return Add(ElementType.a);
            }
        }

        public Html Form
        {
            get
            {
                return Add(ElementType.form);
            }
        }

        public Html Label
        {
            get
            {
                return Add(ElementType.label);
            }
        }

        public Html End
        {
            get
            {
                Context = Context.ParentElement;
                return this;
            }
        }

        public Html EndOf(ElementType type)
        {
            return EndOf(type.ToString());
        }

        public Html EndOf(string selector)
        {
            var result = Context;
            while (result != null)
            {
                if (result.QuerySelector(selector) != null)
                {
                    break;
                }
                else
                {
                    result = result.ParentElement;
                }
            }

            Context = result ?? throw new InvalidOperationException("Cannot find the element of selector " + selector);
            return this;
        }

        public Html Closest(ElementType type)
        {
            return Closest(type.ToString());
        }

        public Html Closest(string selector)
        {
            var result = Context;
            while (result != null)
            {
                if (result.ParentElement != null && result.ParentElement.QuerySelector(selector) != null)
                {
                    break;
                }
                else
                {
                    result = result.ParentElement;
                }
            }

            Context = result ?? throw new InvalidOperationException("Cannot find the element of selector " + selector);
            return this;
        }

        public void Render(string html)
        {
            Context.InnerHTML = html;
        }

        public void Render()
        {
            // Method intentionally left empty.
        }

        public Html Add(ElementType type)
        {
            var ele = Document.CreateElement(type.ToString());
            Context.AppendChild(ele);
            Context = ele;
            return this;
        }

        public Html Id(string id)
        {
            Context.Id = id;
            return this;
        }

        public Html ClassName(string className)
        {
            className = Context.ClassName + " " + className;
            Context.ClassName = className.Trim();
            return this;
        }

        public Html Style(string style)
        {
            Context["style"]["cssText"] += style.Trim();
            return this;
        }

        public Html Clear()
        {
            Context.InnerHTML = string.Empty;
            return this;
        }

        public Html Value(string val)
        {
            var (input, textArea) = GetInputOrTextArea();
            if (input != null)
            {
                input.Value = val;
            }
            else if (textArea != null)
            {
                textArea.Value = val;
            }
            else
            {
                this.Attr("value", val);
            }
            return this;
        }

        public Html Value<T>(Observable<T> val)
        {
            var (input, textArea) = GetInputOrTextArea();
            if (input != null)
            {
                input.Value = val.Data?.ToString();
                input.OnInput += (e) =>
                {
                    val.Data = string.IsNullOrEmpty(input.Value) ? default(T) : (T)Convert.ChangeType(input.Value, typeof(T));
                };
                val.Subscribe(arg =>
                {
                    input.Value = arg.NewData?.ToString();
                });
            }
            else if (textArea != null)
            {
                textArea.Value = val.Data?.ToString();
                textArea.OnInput += (e) =>
                {
                    val.Data = string.IsNullOrEmpty(textArea.Value) ? default(T) : (T)Convert.ChangeType(textArea.Value, typeof(T));
                };
                val.Subscribe(arg =>
                {
                    textArea.Value = arg.NewData?.ToString();
                });
            }
            return this;
        }

        private (HTMLInputElement, HTMLTextAreaElement) GetInputOrTextArea()
        {
            var input = Context as HTMLInputElement;
            var textArea = Context as HTMLTextAreaElement;
            return (input, textArea);
        }

        public Html Attr(string attr, string val)
        {
            Context.SetAttribute(attr, val);
            return this;
        }

        public Html Type(string val)
        {
            Context.SetAttribute("type", val);
            return this;
        }

        public Html Href(string val)
        {
            Context.SetAttribute("href", val);
            return this;
        }

        public Html Src(string val)
        {
            Context.SetAttribute("src", val);
            return this;
        }

        public Html Text(string val)
        {
            var text = new Text(val);
            Context.AppendChild(text);
            return this;
        }

        public Html Text(Observable val)
        {
            var text = new Text(val.Data.ToString());
            val.Subscribe(arg =>
            {
                text.TextContent = arg.NewData?.ToString();
            });
            Context.AppendChild(text);
            return this;
        }

        public Html Text(Observable<string> val)
        {
            var text = new Text(val.Data);
            val.Subscribe(arg =>
            {
                text.TextContent = arg.NewData;
            });
            Context.AppendChild(text);
            return this;
        }

        public Html Event(EventType type, Action action)
        {
            Context.AddEventListener(type, (e) =>
            {
                action();
            });
            return this;
        }

        public Html Event(EventType type, Action<Event> action)
        {
            Context.AddEventListener(type, (e) =>
            {
                action(e);
            });
            return this;
        }

        public Html Event<T>(EventType type, Action<Event, T> action, T model)
        {
            Context.AddEventListener(type, (e) =>
            {
                action(e, model);
            });
            return this;
        }

        public Html AsyncEvent(EventType type, Func<Task> action)
        {
            Context.AddEventListener(type, async (Event e) =>
            {
                await action();
            });
            return this;
        }

        public Html Event<T>(EventType type, Action<T> action, T model)
        {
            Context.AddEventListener(type, (e) =>
            {
                action(model);
            });
            return this;
        }

        public Html EventAsync<T>(EventType type, Func<T, Task> action, T model)
        {
            Context.AddEventListener(type, async (e) =>
            {
                await action(model);
            }); 
            return this;
        }

        public Html Event<T>(EventType type, Action<T, Event> action, T model)
        {
            Context.AddEventListener(type, (e) =>
            {
                action(model, e);
            });
            return this;
        }

        public Html Trigger(EventType type)
        {
            (Context[type.ToString()] as Action)();
            return this;
        }

        public void ClearContextContent()
        {
            Context.InnerHTML = string.Empty;
        }

        public Html ForEach<T>(IEnumerable<T> list, Action<T, int> renderer)
        {
            if (list == null)
                throw new ArgumentNullException(nameof(list));
            var element = Context;

            var length = list.Count();
            var index = -1;
            var enumerator = list.GetEnumerator();

            while (++index < length)
            {
                Context = element;
                enumerator.MoveNext();
                renderer.Call(element, enumerator.Current, index);
            }
            Context = element;
            return this;
        }

        public Html ForEach<T>(ObservableArray<T> observableArray, Action<T, int> renderer)
        {
            if (observableArray == null)
                throw new ArgumentNullException(nameof(observableArray));
            var element = Context;

            var array = observableArray.Data as Array;
            var length = array.Length;
            var index = -1;

            while (++index < length)
            {
                Context = element;
                renderer.Call(element, array[index] ?? index, index);
            }
            observableArray.Subscribe((ObservableArrayArgs<T> e) =>
            {
                e.Element = element;
                e.Renderer = renderer;
                e.Action = e.Action ?? ObservableAction.Render;
                Update(e);
            });
            return this;
        }

        private void Update<T>(ObservableArrayArgs<T> arg)
        {
            var numOfElement = 0;
            Context = arg.Element;
            switch (arg.Action)
            {
                case ObservableAction.Push:
                    arg.Renderer.Call(arg.Element, arg.Item, arg.Index);
                    break;
                case ObservableAction.Add:
                    if (arg.Index == arg.Array.Length - 1)
                    {
                        arg.Renderer.Call(arg.Element, arg.Item, arg.Index);
                        return;
                    }
                    var div = new HTMLDivElement();
                    Context = div;
                    arg.Renderer.Call(div, arg.Item, arg.Index);
                    AppendChildList(arg.Element, div, arg.Index);
                    break;
                case ObservableAction.Remove:
                    numOfElement = arg.Element.Children.Length / (arg.Array.Length + 1);
                    RemoveChildList(arg.Element, arg.Index, numOfElement);
                    break;
                case ObservableAction.Move:
                    numOfElement = arg.Element.Children.Length / arg.Array.Length;
                    var newIndex = arg.Index;
                    var oldIndex = Array.IndexOf(arg.Array, arg.Item);
                    if (newIndex == oldIndex)
                        return;
                    var firstOldElementIndex = oldIndex * numOfElement;
                    var nodeToInsert = oldIndex < newIndex ? arg.Element.Children[(newIndex + 1) * numOfElement] : arg.Element.Children[newIndex * numOfElement];
                    for (var j = 0; j < numOfElement; j++)
                    {
                        arg.Element.InsertBefore(arg.Element.Children[firstOldElementIndex], nodeToInsert);
                        if (oldIndex > newIndex)
                            firstOldElementIndex++;
                    }
                    break;
                case ObservableAction.Render:
                    ClearContextContent();
                    var length = arg.Array.Length;
                    var i = -1;
                    while (++i < length)
                    {
                        Context = arg.Element;
                        arg.Renderer.Call(arg.Element, arg.Array[i], i);
                    }
                    break;
            }
        }

        private void AppendChildList(Element parent, Element tmpNode, int index)
        {
            Element previousNode = null;
            index = index * tmpNode.Children.Length;
            previousNode = parent.Children[index];
            while (tmpNode.Children.Length > 0)
            {
                parent.InsertBefore(tmpNode.Children[0], previousNode);
            }
        }

        private void RemoveChildList(Element parent, int index, int numOfElement)
        {
            var startIndex = index * numOfElement;
            for (var i = 0; i < numOfElement && parent.Children.Length > 0; i++)
            {
                parent.RemoveChild(parent.Children[startIndex]);
            }
        }

        public Html Dropdown<T>(List<T> list, T selectedItem, string displayField = null, string valueField = null)
        {
            if (Context.NodeName.ToLowerCase() != "select")
            {
                Select.Render();
            }
            var select = Context as HTMLSelectElement;
            list.ForEach((T model) => {
                var text = displayField == null ? model.ToString() : model[displayField]?.ToString();
                var value = valueField == null ? model.ToString() : model[valueField]?.ToString();
                Option.Text(text).Value(value).End.Render();
            });
            select.SelectedIndex = GetSelectedIndex(list, selectedItem, valueField);
            return this;
        }

        public Html Dropdown<T>(ObservableArray<T> list, Observable<T> selectedItem, string displayField, string valueField)
        {
            if (Context.NodeName.ToLowerCase() != "select")
            {
                Select.Render();
            }
            var select = Context as HTMLSelectElement;

            ForEach(list, (T model, int index) => {
                var text = model[displayField]?.ToString();
                var value = model[valueField]?.ToString();
                Option.Text(text).Value(value).End.Render();
            });

            select.SelectedIndex = GetSelectedIndex(list.Data.ToList(), selectedItem.Data, valueField);
            list.Subscribe(realList => {
                select.SelectedIndex = GetSelectedIndex(realList.Array.ToList(), selectedItem.Data, valueField);
            });

            selectedItem.BindingNodes.Add(select);

            Event(EventType.Change, () => {
                var selectedObj = list.Data[select.SelectedIndex];
                selectedItem.Data = selectedObj;
            });

            // Subscribe change from selectedItem, to update selected index
            selectedItem.Subscribe(val => {
                select.SelectedIndex = GetSelectedIndex(list.Data.ToList(), val.NewData, valueField);
            });

            return this;
        }

        private int GetSelectedIndex<T>(List<T> list, T item, string valueField)
        {
            if (item == null)
                return -1;
            var arr = list.ToArray();
            var index = Array.IndexOf(arr, item);
            if (valueField != "")
            {
                var selectedItem = Array.Find(arr, x => {
                    return x[valueField] == item[valueField];
                });
                index = Array.IndexOf(arr, selectedItem);
            }
            return index;
        }

        public Html Visible(Observable<bool> visible)
        {
            var ele = Context as HTMLElement;
            ele.Style.Display = visible.Data ? "" : Display.None.ToString();
            visible.Subscribe(arg =>
            {
                ele.Style.Display = arg.NewData ? "" : Display.None.ToString();
            });
            return this;
        }

        public Html Hidden(Observable<bool> hidden)
        {
            var ele = Context as HTMLElement;
            ele.Style.Display = hidden.Data ? Display.None.ToString(): string.Empty;
            hidden.Subscribe(arg =>
            {
                ele.Style.Display = arg.NewData ? Display.None.ToString() : string.Empty;
            });
            return this;
        }
    }
}
