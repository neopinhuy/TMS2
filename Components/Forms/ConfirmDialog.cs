using Bridge.Html5;
using Components.Extensions;
using MVVM;
using System;
using static Retyped.jquery;

namespace Components.Forms
{
    public class ConfirmDialog : Component
    {
        public string Title { get; set; } = "Confirmation";
        public string Content { get; set; } = "Are you sure you want to delete?";
        public override void Render()
        {
            Html.Take(Document.Body).Div.ClassName("backdrop").Style("align-items: center;");
            RootHtmlElement = Html.Context;
            jQuery.select(Html.Context).HotKey("esc", Dispose);
            Html.Instance.Div.ClassName("popup-content").Style("top: auto;")
                .Div.ClassName("popup-title").Text(Title)
                .Div.ClassName("icon-box").Span.ClassName("fa fa-times")
                    .Event(EventType.Click, Dispose)
                .EndOf(".popup-title")
                .Div.ClassName("popup-body");

            Html.Instance.P.Text(Content).End.Div.MarginRem(Direction.top, 1)
                .Button("Delete", "button secondary small", "fa fa-trash")
                    .Event(EventType.Click, () => { DeleteConfirmed(); }).End
                .Button("No", "button info small", "mif-exit")
                    .MarginRem(Direction.left, 1)
                    .Event(EventType.Click, Dispose)
                .EndOf(".backdrop");
        }

        public Action DeleteConfirmed { get; set; }

        public override void Dispose()
        {
            RootHtmlElement.Remove();
        }
    }
}
