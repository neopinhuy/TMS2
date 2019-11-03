using Bridge.Html5;
using Components.Extensions;
using MVVM;
using System.Threading.Tasks;
using static Retyped.jquery;

namespace Components.Forms
{
    public partial class PopupEditor<T> : Component
    {
        private readonly EditForm<T> _editor;
        public T Data { get; set; }

        public PopupEditor()
        {
            _editor = new EditForm<T>();
        }

        public override async Task RenderAsync()
        {
            Html.Take(Document.Body).Div.ClassName("backdrop");
            RootElement = Html.Context as HTMLElement;
            jQuery.select(RootElement).HotKey("esc", Dispose);
            Html.Instance.Div.ClassName("popup-content")
                .Div.ClassName("popup-title").Text(_editor.Title)
                .Div.ClassName("icon-box").Span.ClassName("fa fa-times")
                    .Event(EventType.Click, Dispose)
                .EndOf(".popup-title")
                .Div.ClassName("popup-body");
            _editor.Data = Data;
            await _editor.RenderAsync();
        }
    }
}
