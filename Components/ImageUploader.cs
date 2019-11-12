using Bridge.Html5;
using Common.Clients;
using MVVM;
using System.Threading.Tasks;
using TMS.API.Models;
using ElementType = MVVM.ElementType;

namespace Components
{
    public class ImageUploader : Component
    {
        private Observable<string> _path;
        private readonly UserInterface _ui;
        private const string defaultImg = "image/truck.webp";
        private HTMLImageElement _img;
        private HTMLFormElement _form;
        public ImageUploader(UserInterface ui)
        {
            _ui = ui;
        }

        public override void Render()
        {
            _path = new Observable<string>(Entity?[_ui.FieldName]?.ToString());
            _path.Subscribe(arg => { if (Entity != null) Entity[_ui.FieldName] = arg.NewData; });

            Html.Instance.ClassName("uploader").HeightRem(_ui.Row ?? 12).ColSpan(2)
                .Label.Attr("for", $"id_{GetHashCode()}")
                .Img.ClassName("thumb").Src(_path.Data ?? defaultImg).Render();

            _img = Html.Context as HTMLImageElement;
            Html.Instance.End
                .Img.ClassName("icon").Src("image/icon_camera.png").EndOf(ElementType.label)
                .Form.Attr("method", "POST").Attr("enctype", "multipart/form-data").Render();
            _form = Html.Context as HTMLFormElement;
            Html.Instance.Input.Id($"id_{GetHashCode()}").Attr("name", "files").Type("file");
            InteractiveElement = Html.Context;
            Html.Instance.AsyncEvent(EventType.Change, RenderImage).End.Render();
            _path.Subscribe(arg =>
            {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                if (Entity != null) Entity[_ui.FieldName] = arg.NewData;
                ValueChanged?.Invoke(arg);
            });
        }

        private async Task RenderImage(Event e)
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

            // Upload to the server
            var form = new FormData(_form);
            var xhr = new XMLHttpRequest();
            var client = new Client<File>();
            var path = await client.PostFilesAsync(form);
            _path.Data = path[0];
        }
    }
}
