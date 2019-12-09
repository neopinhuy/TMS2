using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using MVVM;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

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
            var strPaths = Entity?.GetComplexPropValue(_ui.FieldName)?.ToString();
            var paths = strPaths?.Split(pathSeparator);
            RenderUploadForm();
            RenderImagesAndIcon(paths);
            _path = new Observable<string>(strPaths);
            _path.Subscribe(arg =>
            {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
            });
        }

        private void RenderImagesAndIcon(IEnumerable<string> paths)
        {
            Html.Take(InteractiveElement).Clear();
            if (paths.HasElement()) paths.ForEach(RenderImage);
            else RenderImage(string.Empty);
            RenderIcon();
        }

        private void RenderUploadForm()
        {
            var isMultiple = _ui.Precision == 0;
            Html.Take(RootHtmlElement)
                .ClassName("uploader").ColSpan(2)
                .Form.Attr("method", "POST").Attr("enctype", "multipart/form-data")
                .Input.Id($"id_{GetHashCode()}").Attr("name", "files").Type("file")
                .AsyncEvent(EventType.Change, UploadImages).Render();
            if (isMultiple)
            {
                Html.Instance.Attr("multiple", "multiple");
            }
            Html.Instance.End.Label.Attr("for", $"id_{GetHashCode()}");
            InteractiveElement = Html.Context;
            _form = InteractiveElement.ParentElement as HTMLFormElement;
            RenderIcon();
        }

        private void RenderIcon()
        {
            Html.Take(InteractiveElement).Img.ClassName("icon").Src("image/icon_camera.png").End.Render();
        }

        private void RenderImage(string path)
        {
            Html.Take(InteractiveElement)
                .Img.ClassName("thumb")
                .Style(_ui.Style)
                .Src(path.HasAnyChar() ? path : _ui.Label ?? _defaultImg).Render();
        }

        private async Task UploadImages(Event e)
        {
            var files = e.Target["files"] as FileList;
            if (files.Nothing()) return;
            
            var form = new FormData(_form);
            var xhr = new XMLHttpRequest();
            var client = new Client("file");
            var pathList = await client.PostFilesAsync(form);
            var paths = _path.Data + pathSeparator + string.Join(pathSeparator, pathList);
            pathList = paths.Trim().Split(pathSeparator).Distinct().ToList();
            _path.Data = string.Join(pathSeparator, pathList);
            RenderImagesAndIcon(pathList);
        }
    }
}
