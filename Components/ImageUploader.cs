using Bridge.Html5;
using MVVM;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components
{
    public class ImageUploader : Component
    {
        private readonly Observable<string> _path;
        private readonly UserInterface _ui;
        private const string defaultImg = "image/truck.webp";
        private HTMLImageElement _img;
        public ImageUploader(Observable<string> path, UserInterface ui)
        {
            _path = path;
            _ui = ui;
        }

        public override async Task RenderAsync()
        {
            Html.Instance.ClassName("uploader").HeightRem(_ui.Row ?? 12).ColSpan(2).Div
                .Label.Attr("for", $"id_{GetHashCode()}")
                .Img.Src(_path.Data ?? defaultImg).Render();

            _img = Html.Context as HTMLImageElement;

            Html.Instance.End.Img.Src("image/icon_camera.png")
                .EndOf(MVVM.ElementType.label)
                .Input.Id($"id_{GetHashCode()}").Type("file").Event(EventType.Change, RenderImage).End.Render();
        }

        private void RenderImage(Event e)
        {
            var files = e.Target["files"] as FileList;
            var file = files[0];
            var reader = new FileReader();
            reader.AddEventListener(EventType.Load, (f) =>
            {
                _img.Src = f.Target["result"]?.ToString();
            });
            reader.ReadAsDataURL(file);
        }
    }
}
