using Bridge.Html5;
using Components.Extensions;
using MVVM;
using static Retyped.jquery;

namespace Components.Forms
{
    public class PopupEditor<T> : EditForm<T>
    {
        public override void Render()
        {
            Html.Take(Document.Body).Div.ClassName("backdrop");
            jQuery.select(Html.Context).HotKey("esc", Dispose);
            Html.Instance.Div.ClassName("popup-content")
                .Div.ClassName("popup-title").Text(Title)
                .Div.ClassName("icon-box").Span.ClassName("fa fa-times")
                    .Event(EventType.Click, Dispose)
                .EndOf(".popup-title")
                .Div.ClassName("popup-body");
            RootHtmlElement = Html.Context as HTMLElement;
            base.Render();
        }

        public override void Dispose()
        {
            RootHtmlElement.ParentElement.ParentElement.Remove();
        }
    }
}
