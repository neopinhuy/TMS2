using MVVM;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components
{
    public class Uploader : Component
    {
        private readonly Observable<string> _path;
        private readonly UserInterface _ui;
        private string defaultImg = "image/truck.webp";
        public Uploader(Observable<string> path, UserInterface ui)
        {
            _path = path;
            _ui = ui;
        }

        public override async Task RenderAsync()
        {
            Html.Instance.ClassName("uploader").HeightRem(_ui.Row ?? 12).ColSpan(2).Div
                    .Label.Attr("for", $"id_{GetHashCode()}")
                    .Img.Src(_path.Data ?? defaultImg).End
                    .Img.Src("image/icon_camera.png")
                    .EndOf(ElementType.label)
                .Input.Id($"id_{GetHashCode()}").Type("file").End.Render();
        }
    }
}
