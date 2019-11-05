using Bridge.Html5;
using Components.Extensions;
using MVVM;
using System.Threading.Tasks;
using static Retyped.jquery;

namespace Components.Forms
{
    public partial class PopupEditor<T> : EditForm<T>
    {
        public override async Task RenderAsync()
        {
            Html.Take(Document.Body).Div.ClassName("backdrop");
            RootHtmlElement = Html.Context as HTMLElement;
            jQuery.select(RootHtmlElement).HotKey("esc", Dispose);
            Html.Instance.Div.ClassName("popup-content")
                .Div.ClassName("popup-title").Text(Title)
                .Div.ClassName("icon-box").Span.ClassName("fa fa-times")
                    .Event(EventType.Click, Dispose)
                .EndOf(".popup-title")
                .Div.ClassName("popup-body");
            await base.RenderAsync();
        }
    }
}
