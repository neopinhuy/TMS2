using Bridge.Html5;
using Components.Extensions;
using MVVM;
using static Retyped.jquery;

namespace Components.Forms
{
    public class ContextMenu : Component
    {
        public double Top { get; set; }
        public double Left { get; set; }

        public override void Render()
        {
            Html.Take(Document.Body).Ul.ClassName("context-menu")
                .TabIndex(-1).Trigger(EventType.Focus).Floating(Top, Left);
            RootHtmlElement = Html.Context;
            jQuery.select(RootHtmlElement).HotKey("esc", Dispose);
            Html.Instance.Event(EventType.FocusOut, Dispose);
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
