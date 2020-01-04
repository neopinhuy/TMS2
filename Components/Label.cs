using Components.Extensions;
using MVVM;
using System;

namespace Components
{
    public class Label : Component
    {
        private readonly TMS.API.Models.Component _ui;
        public Label(TMS.API.Models.Component ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var text = Utils.GetFormatText(Entity, _ui);
            if (_ui.ShowLabel) Html.Instance.Label.Text(_ui.Label);
            Html.Instance.Label.Text(text);
            InteractiveElement = Html.Context;
            if (!_ui.ShowLabel) Html.Instance.PlaceHolder(_ui.Label ?? string.Empty);
        }

        public override void UpdateView()
        {
            var text = Utils.GetFormatText(Entity, _ui);
            InteractiveElement.InnerHTML = text;
        }
    }
}
