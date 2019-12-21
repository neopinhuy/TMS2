using Bridge.Html5;
using Components.Extensions;
using MVVM;
using System;
using TMS.API.Models;

namespace Components
{
    public class Button: Component
    {
        private readonly TMS.API.Models.Component _ui;
        
        public Button(TMS.API.Models.Component ui)
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
                .Attr("data-event", _ui.Events)
                .Event(EventType.Click, () =>
                {
                    this.DispatchEvent(_ui.Events, EventType.Click, Entity);
                });
            InteractiveElement = Html.Context;
        }
    }
}
