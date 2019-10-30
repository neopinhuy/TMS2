using Bridge.Html5;
using MVVM;
using System.Threading.Tasks;
using TMS.API.Models;
using ElementType = MVVM.ElementType;

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
            Html.Instance.ClassName("uploader").HeightRem(_ui.Row ?? 12).ColSpan(2)
                .Label.Attr("for", $"id_{GetHashCode()}")
                .Img.ClassName("thumb").Src(_path.Data ?? defaultImg).Render();

            _img = Html.Context as HTMLImageElement;
            Html.Instance.End
                .Img.ClassName("icon").Src("image/icon_camera.png").EndOf(ElementType.label)
                .Input.Id($"id_{GetHashCode()}").Type("file").Event(EventType.Change, RenderImage).End.Render();
        }

        private void RenderImage(Event e)
        {
            var files = e.Target["files"] as FileList;
            var file = files[0];
            if (file == null) return;
            var reader = new FileReader();
            reader.AddEventListener(EventType.Load, (f) =>
            {
                _img.Src = f.Target["result"]?.ToString();
            });
            reader.ReadAsDataURL(file);
        }
    }
}
