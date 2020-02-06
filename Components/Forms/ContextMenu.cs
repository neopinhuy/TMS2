using Bridge.Html5;
using Components.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using static Retyped.jquery;
using ElementType = MVVM.ElementType;

namespace Components.Forms
{
    public delegate void ClickHandler();
    public class ContextMenuItem
    {
        public string Icon { get; set; }
        public string Text { get; set; }
        public Action<object> Click { get; set; }
        public object Parameter { get; set; }
    }

    public class ContextMenu : Component
    {
        public double Top { get; set; }
        public double Left { get; set; }
        public List<ContextMenuItem> ContextMenuItems = new List<ContextMenuItem>();
        public override void Render()
        {
            Html.Take(Document.Body).Ul.ClassName("context-menu")
                .TabIndex(-1).Trigger(EventType.Focus).Floating(Top, Left);
            RootHtmlElement = Html.Context;
            jQuery.select(RootHtmlElement).HotKey("esc", Dispose);
            Html.Instance.Event(EventType.FocusOut, Dispose)
                .Event(EventType.Click, Dispose)
                .ForEach(ContextMenuItems, (item, index) =>
                {
                    Html.Instance.Li.Event(EventType.Click, item.Click, item.Parameter)
                        .Icon(item.Icon).End
                        .Span.Text(item.Text).EndOf(ElementType.li);
                });
            AfterRendered?.Invoke();
        }

        protected override void RemoveDOM()
        {
            try
            {
                base.RemoveDOM();
            }
            catch (System.Exception)
            {
            }
        }
    }
}
