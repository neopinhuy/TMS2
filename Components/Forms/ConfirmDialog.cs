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
            ContainerElement = Html.Context;
            jQuery.select(Html.Context).HotKey("esc", Dispose);
            Html.Instance.Div.ClassName("popup-content").Style("top: auto;")
                .Div.ClassName("popup-title").Text(Title)
                .Div.ClassName("icon-box").Span.ClassName("fa fa-times")
                    .Event(EventType.Click, Dispose)
                .EndOf(".popup-title")
                .Div.ClassName("popup-body");

            Html.Instance.P.Text(Content).End.Div.MarginRem(Direction.top, 1)
                .Button("Yes", "button secondary small", "fa fa-trash")
                    .Event(EventType.Click, () =>
                    {
                        Dispose();
                        YesConfirmed?.Invoke();
                    }).End
                .Button("No", "button info small", "mif-exit")
                    .MarginRem(Direction.left, 1)
                    .Event(EventType.Click, Dispose).End
                .Button("Cancel", "button info small", "fa fa-times")
                    .MarginRem(Direction.left, 1)
                    .Event(EventType.Click, Dispose)
                    .Trigger(EventType.Focus)
                .EndOf(".backdrop");
        }

        public Action YesConfirmed { get; set; }

        protected override void RemoveDOM()
        {
            ContainerElement.Remove();
        }
    }
}
