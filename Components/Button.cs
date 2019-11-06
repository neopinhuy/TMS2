using Bridge.Html5;
using Components.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace Components
{
    public class Button<T>: Component
    {
        private readonly UserInterface _ui;
        public T Entity { get; set; }
        public ObservableArray<T> ParentEntity { get; set; }
        public List<ObservableArray<object>> CurrentEntities { get; set; }

        public Button(UserInterface ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var html = Html.Instance;
            html.Button.Render();
            if (!string.IsNullOrEmpty(_ui.Icon))
            {
                html.Span.ClassName(_ui.Icon).End.Text(" ").Render();
            }
            html.ClassName(_ui.ClassName).Text(_ui.Label)
                .Attr("data-id", _ui.Id.ToString())
                .Event(EventType.Click, () =>
                {
                    RootComponent.ExecuteEvent(_ui.Events, Entity, ParentEntity, CurrentEntities);
                });
        }
    }
}
