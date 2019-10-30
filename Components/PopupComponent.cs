using Bridge.Html5;
using Components.Extensions;
using MVVM;
using System.Threading.Tasks;
using TMS.API.Models;
using static Retyped.jquery;

namespace Components
{
    public abstract class PopupComponent : Component
    {
        public virtual string Title { get; set; }

        public override async Task RenderAsync()
        {
            _masterData = await MasterData.GetSingletonAsync();
            Html.Take(Document.Body).Div.ClassName("backdrop");
            RootElement = Html.Context as HTMLElement;
            jQuery.select(RootElement).HotKey("esc", Dispose);
            Html.Instance.Div.ClassName("popup-content")
                .Div.ClassName("popup-title").Text(Title)
                .Div.ClassName("icon-box").Span.ClassName("fa fa-times")
                    .Event(EventType.Click, Dispose)
                .EndOf(".popup-title")
                .Div.ClassName("popup-body");
        }
    }
}
