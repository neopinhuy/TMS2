using Common.Extensions;
using MVVM;
using System;
using TMS.API.Models;

namespace Components
{
    public class Textbox : Component
    {
        private readonly UserInterface _ui;
        public bool MultipleLine { get; set; }
        public Textbox(UserInterface ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var value = new Observable<string>(Entity?.GetComplexPropValue(_ui.FieldName)?.ToString());
            if (_ui.FieldName.HasAnyChar())
            {
                value.Subscribe(arg =>
                {
                    var res = ValueChanging?.Invoke(arg);
                    if (res == false) return;
                    if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                    ValueChanged?.Invoke(arg);
                });
            }
            if (MultipleLine)
            {
                Html.Instance.TextArea.Attr("data-role", "textarea").Value(value);
                if (_ui.Row > 0) Html.Instance.Attr("rows", _ui.Row ?? 1);
            }
            else
            {
                Html.Instance.Input
                    .Attr("data-role", "input")
                    .ClassName("input-small").Value(value);
            }
            InteractiveElement = Html.Context;
            if (!_ui.ShowLabel) Html.Instance.PlaceHolder(_ui.Label ?? string.Empty);
        }
    }
}
