using Common.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace Components
{
    public class Checkbox: Component
    {
        private readonly TMS.API.Models.Component _ui;

        public Checkbox(TMS.API.Models.Component ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var value = new Observable<bool?>((bool?)Entity?.GetComplexPropValue(_ui.FieldName));
            value.Subscribe(arg => {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
            });
            Html.Instance.SmallCheckbox(string.Empty, value);
            InteractiveElement = Html.Context;
        }
    }
}
