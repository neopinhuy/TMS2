using Common.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace Components
{
    public class Textbox: Component
    {
        private readonly UserInterface _ui;
        
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
            Html.Instance.Input.Attr("data-role", "input")
                .Disabled(_ui.Disabled)
                .ClassName("input-small").Value(value);
            if (!_ui.ShowLabel) Html.Instance.PlaceHolder(_ui.Label);
        }
    }
}
