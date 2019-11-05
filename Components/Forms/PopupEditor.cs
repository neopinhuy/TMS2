using Bridge.Html5;
using Common.Clients;
using Components.Extensions;
using MVVM;
using System.Threading.Tasks;
using static Retyped.jquery;

namespace Components.Forms
{
    public partial class PopupEditor<T> : Component
    {
        private readonly EditForm<T> _editor;
        public T Entity { get; set; }
        public ObservableArray<T> EntityList { get; set; }

        public PopupEditor()
        {
            _editor = new EditForm<T>
            {
                Parent = this
            };
        }

        public virtual async Task Save()
        {
            _editor.Save();
        }

        public override async Task RenderAsync()
        {
            Html.Take(Document.Body).Div.ClassName("backdrop");
            RootElement = Html.Context as HTMLElement;
            _editor.RootElement = RootElement;
            jQuery.select(RootElement).HotKey("esc", Dispose);
            Html.Instance.Div.ClassName("popup-content")
                .Div.ClassName("popup-title").Text(_editor.Title)
                .Div.ClassName("icon-box").Span.ClassName("fa fa-times")
                    .Event(EventType.Click, Dispose)
                .EndOf(".popup-title")
                .Div.ClassName("popup-body");
            _editor.Entity = Entity;
            await _editor.RenderAsync();
        }
    }
}
