using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using MVVM;
using System;
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
        private const string _iconImg = "image/icon_camera.png";
        private const string pathSeparator = "    ";
        private HTMLFormElement _form;
        private bool _isRemoving;
        public ImageUploader(UserInterface ui)
        {
            _ui = ui;
        }

        public override void Render()
        {
            var strPaths = Entity?.GetComplexPropValue(_ui.FieldName)?.ToString();
            _path = new Observable<string>(strPaths);
            _path.Subscribe(arg =>
            {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
            });
            var paths = strPaths?.Split(pathSeparator).ToList();
            RenderUploadForm();
            RenderImagesAndIcon(paths);
            var label = InteractiveElement as HTMLElement;
            label.Style.MaxHeight = (label.QuerySelector("img") as HTMLElement).Style.Height;
        }

        private void RenderImagesAndIcon(List<string> paths)
        {
            var index = paths.HasElement() ? Array.IndexOf(paths.ToArray(), _iconImg) : -1;
            if (index > 0) paths.RemoveAt(index);
            Html.Take(InteractiveElement).Clear();
            if (paths.HasElement()) paths.ForEach(RenderImage);
            else RenderImage(string.Empty);
            RenderIcon();
        }

        private void RenderUploadForm()
        {
            var isMultiple = _ui.Precision == 0;
            var hashCode = Math.Abs(GetHashCode());
            Html.Take(RootHtmlElement)
                .ClassName("uploader").ColSpan(2)
                .Form.Attr("method", "POST").Attr("enctype", "multipart/form-data")
                .Input.Id($"id_{hashCode}").Attr("name", "files").Type("file")
                .AsyncEvent(EventType.Change, UploadImages).Render();
            if (isMultiple)
            {
                Html.Instance.Attr("multiple", "multiple");
            }
            Html.Instance.End.Label.Attr("for", $"id_{hashCode}")
                .Event(EventType.Click, (e) =>
                {
                    if (_isRemoving)
                    {
                        _isRemoving = false;
                        e.PreventDefault();
                    }
                });
            InteractiveElement = Html.Context;
            _form = InteractiveElement.ParentElement as HTMLFormElement;
            RenderIcon();
        }

        private void RenderIcon()
        {
            Html.Take(InteractiveElement).Img.ClassName("icon").Src(_iconImg).End.Render();
        }

        private void RenderImage(string path)
        {
            Html.Take(InteractiveElement)
                .Div.ClassName("thumb-wrapper")
                    .Div.ClassName("overlay").Icon("fa fa-times").Event(EventType.Click, RemoveImage, path).End.End
                    .Img.ClassName("thumb").Style(_ui.Style)
                    .Src(path.HasAnyChar() ? path : _ui.Label ?? _defaultImg).Render();
        }

        private void RemoveImage(string removedPath)
        {
            _isRemoving = true;
            if (removedPath.IsNullOrEmpty()) return;
            var path = _path.Data.Replace(removedPath, string.Empty)
                .Split(pathSeparator).Where(x => x.HasAnyChar()).Distinct().ToList();
            RenderImagesAndIcon(path);
            _path.Data = string.Join(pathSeparator, path);
        }

        private async Task UploadImages(Event e)
        {
            var files = e.Target["files"] as FileList;
            if (files.Nothing()) return;
            
            var form = new FormData(_form);
            var xhr = new XMLHttpRequest();
            var client = new Client("file");
            var pathList = await client.PostFilesAsync(form);
            if (_ui.Precision == 0)
            {
                var paths = _path.Data + pathSeparator + string.Join(pathSeparator, pathList);
                pathList = paths.Trim().Split(pathSeparator).Distinct().ToList();
            }
            _path.Data = string.Join(pathSeparator, pathList);
            RenderImagesAndIcon(pathList);
        }
    }
}
