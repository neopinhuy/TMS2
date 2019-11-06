using Common.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace Components
{
    public class Textbox<T>: Component
    {
        private readonly UserInterface _ui;
        public T Entity { get; set; }
        public ObservableArray<T> ParentEntity { get; set; }
        public List<ObservableArray<object>> CurrentEntities { get; set; }

        public Textbox(UserInterface ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var value = new Observable<string>(Entity?[_ui.FieldName]?.ToString());
            if (_ui.FieldName.HasAnyChar())
            {
                value.Subscribe(arg => {
                    if (Entity != null) Entity[_ui.FieldName] = arg.NewData;
                });
            }
            Html.Instance.Input.Attr("data-role", "input").ClassName("input-small").Value(value);
            if (!_ui.ShowLabel) Html.Instance.PlaceHolder(_ui.Label);
        }
    }
}
