using Bridge.Html5;
using Components.Extensions;
using MVVM;
using System.Threading.Tasks;
using static Retyped.jquery;

namespace Components
{
    public abstract class PopupComponent : Component
    {
        public virtual string Title { get; set; }
        private string top = "68px";
        private string left = "306px";
        public string Top
        {
            get => top;
            set
            {
                top = value;
                Html.Take(_content).Style(new { top });
            }
        }
        public string Left
        {
            get => left;
            set
            {
                left = value;
                Html.Take(_content).Style(new { left });
            }
        }
        protected HTMLDivElement _content;

        public override async Task RenderAsync()
        {
            _masterData = await MasterData.GetSingletonAsync();
            Html.Take(Document.Body).Div.ClassName("backdrop");
            RootElement = Html.Context as HTMLElement;
            Html.Instance.Div.ClassName("popup-content");
            _content = Html.Context as HTMLDivElement;
            jQuery.select(_content).HotKey("esc", Dispose);

            Html.Instance.Style($"top: {Top}; left: {Left};")
                .Div.ClassName("popup-title").Text(Title)
                .Div.ClassName("icon-box").Span.ClassName("fa fa-times")
                    .Event(EventType.Click, Dispose)
                .EndOf(".popup-title")
                .Div.ClassName("popup-body");
        }
    }
}
