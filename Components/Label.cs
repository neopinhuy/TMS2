using Common.Extensions;
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
            var text = Entity?.GetComplexPropValue(_ui.FieldName)?.ToString();
            if (_ui.FormatData.HasAnyChar()) text = Utils.FormatWith(_ui.FormatData, Entity?.GetComplexPropValue(_ui.FieldName));
            if (_ui.FormatEntity.HasAnyChar()) text = Utils.FormatWith(_ui.FormatEntity, Entity);
            if (_ui.ShowLabel) Html.Instance.Label.Text(_ui.Label);
            Html.Instance.Label.Text(text);
            InteractiveElement = Html.Context;
            if (!_ui.ShowLabel) Html.Instance.PlaceHolder(_ui.Label ?? string.Empty);
        }
    }
}
