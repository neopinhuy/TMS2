using Bridge.Html5;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;

namespace Components
{
    public class Textbox : Component
    {
        private readonly TMS.API.Models.Component _ui;
        public bool MultipleLine { get; set; }
        public Observable<string> Value { get; private set; }
        public Textbox(TMS.API.Models.Component ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var text = Entity?.GetComplexPropValue(_ui.FieldName)?.ToString();
            if (_ui.FormatData.HasAnyChar()) text = Utils.FormatWith(_ui.FormatData, Entity?.GetComplexPropValue(_ui.FieldName));
            if (_ui.FormatEntity.HasAnyChar()) text = Utils.FormatWith(_ui.FormatEntity, Entity);
            Value = new Observable<string>(text);
            if (_ui.FieldName.HasAnyChar())
            {
                Value.Subscribe(arg =>
                {
                    var res = ValueChanging?.Invoke(arg);
                    if (res == false) return;
                    if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                    ValueChanged?.Invoke(arg);
                    this.DispatchEvent(_ui.Events, EventType.Change, arg);
                });
            }
            if (MultipleLine)
            {
                Html.Instance.TextArea.Attr("data-role", "textarea").Value(Value);
                if (_ui.Row > 0) Html.Instance.Attr("rows", _ui.Row ?? 1);
            }
            else
            {
                Html.Instance.Input
                    .Attr("data-role", "input")
                    .ClassName("input-small").Value(Value);
            }
            InteractiveElement = Html.Context;
            if (!_ui.ShowLabel) Html.Instance.PlaceHolder(_ui.Label ?? string.Empty);
        }

        public override void UpdateView()
        {
            var text = Entity?.GetComplexPropValue(_ui.FieldName)?.ToString();
            if (_ui.FormatData.HasAnyChar()) text = Utils.FormatWith(_ui.FormatData, Entity?.GetComplexPropValue(_ui.FieldName));
            if (_ui.FormatEntity.HasAnyChar()) text = Utils.FormatWith(_ui.FormatEntity, Entity);
            Value.Data = text;
        }
    }
}
