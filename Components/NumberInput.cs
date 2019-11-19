using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;
using TMS.API.Models;
using static Retyped.jquery_maskmoney.jQueryMaskMoney;

namespace Components
{
    public class NumberInput : Component
    {
        private readonly UserInterface _ui;

        public NumberInput(UserInterface ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var isDecimal = _ui.Precision != null && _ui.Precision != 0;
            var parsed = decimal.TryParse(Entity?.GetComplexPropValue(_ui.FieldName)?.ToString(), out decimal parsedVal);
            if (!parsed)
            {
                Html.Instance.EndOf(ElementType.td);
                return;
            }
            var value = new Observable<decimal?>(parsedVal);
            value.Subscribe(arg => {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
            });
            Html.Instance.MaskMoney(value, new Options
            {
                thousands = isDecimal ? "," : string.Empty,
                @decimal = ".",
                precision = isDecimal ? _ui.Precision : 0
            });
            InteractiveElement = Html.Context;
        }
    }
}
