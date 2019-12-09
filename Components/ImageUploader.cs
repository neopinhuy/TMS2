using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using MVVM;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using ElementType = MVVM.ElementType;

namespace Components
{
    public class ImageUploader : Component
    {
        private Observable<string> _path;
        private readonly UserInterface _ui;
        private const string _defaultImg = "image/truck.webp";
        private const string pathSeparator = "    ";
        private HTMLFormElement _form;
        public ImageUploader(UserInterface ui)
        {
            _ui = ui;
        }

        public override void Render()
        {
            var isMultiple = _ui.Precision == 0;
            var strPaths = Entity?.GetComplexPropValue(_ui.FieldName)?.ToString();
            var paths = strPaths?.Split(pathSeparator);
            _path = new Observable<string>(strPaths);
            _path.Subscribe(arg => { if (Entity != null) Entity[_ui.FieldName] = arg.NewData; });

            Html.Take(RootHtmlElement).ClassName("uploader").ColSpan(2)
                .Label.Attr("for", $"id_{GetHashCode()}");
            InteractiveElement = Html.Context;
            Html.Instance.Img.ClassName("thumb")
                    .Style(_ui.Style)
                    .Src(paths.HasElement() ? paths.ElementAt(0) : _ui.Label ?? _defaultImg)
                .EndOf(ElementType.img);
            if (paths.HasElement() && paths.Length > 1) RenderImages(paths.Skip(1));
            Html.Instance
                .Img.ClassName("icon").Src("image/icon_camera.png").EndOf(ElementType.label)
                .Form.Attr("method", "POST").Attr("enctype", "multipart/form-data").Render();
            _form = Html.Context as HTMLFormElement;
            Html.Instance.Input.Id($"id_{GetHashCode()}").Attr("name", "files").Type("file");
            if (isMultiple)
            {
                Html.Instance.Attr("multiple", "multiple");
            }
            Html.Instance.AsyncEvent(EventType.Change, RenderImage).End.Render();
            _path.Subscribe(arg =>
            {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
            });
        }

        private void RenderImages(IEnumerable<string> paths)
        {
            if (paths.Nothing()) return;
            Html.Instance.ForEach(paths, RenderImage);
        }

        private void RenderImage(string path)
        {
            Html.Take(InteractiveElement)
                .Img.ClassName("thumb")
                .Style(_ui.Style)
                .Src(path ?? _ui.Label ?? _defaultImg).Render();
        }

        private async Task RenderImage(Event e)
        {
            var files = e.Target["files"] as FileList;
            if (files.Nothing()) return;
            files.ForEach(file =>
            {
                var reader = new FileReader();
                reader.AddEventListener(EventType.Load, (f) =>
                {
                    RenderImage(f.Target["result"]?.ToString());
                });
                reader.ReadAsDataURL(file);
            });

            // Upload to the server
            var form = new FormData(_form);
            var xhr = new XMLHttpRequest();
            var client = new Client("file");
            var path = await client.PostFilesAsync(form);
            _path.Data = string.Join(pathSeparator, path);
        }
    }
}
