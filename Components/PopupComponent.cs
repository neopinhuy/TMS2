using System.Threading.Tasks;
using Bridge.Html5;
using MVVM;

namespace Components
{
    public abstract class PopupComponent : Component
    {
        public virtual string Title { get; set; }
        public string Top { get; set; } = "68px";
        public string Left { get; set; } = "306px";
        public string Width { get; set; } = "74%";
        public string Height { get; set; } = "82%";
        public override async Task RenderAsync()
        {
            _masterData = await MasterData.GetSingletonAsync();
            Html.Take(Document.Body).Div.ClassName("backdrop");
            RootElement = Html.Context as HTMLElement;
            Html.Instance.Div.ClassName("popup-content")
                .Style($"top: {Top}; left: {Left}; width: {Width}; Height: {Height};")
                .Div.ClassName("popup-title").Text(Title)
                .Div.ClassName("icon-box").Span.ClassName("fa fa-times")
                    .Event(EventType.Click, Dispose)
                .EndOf(".popup-title")
                .Div.ClassName("popup-body");
        }
    }
}
