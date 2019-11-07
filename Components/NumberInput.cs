using Components.Extensions;
using MVVM;
using System;
using System.Globalization;
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
            var parsed = decimal.TryParse(Entity?[_ui.FieldName]?.ToString(), out decimal parsedVal);
            if (!parsed)
            {
                Html.Instance.EndOf(ElementType.td);
                return;
            }
            var separator = CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator;
            var groupSeparator = CultureInfo.CurrentCulture.NumberFormat.NumberGroupSeparator;
            var value = new Observable<decimal?>(parsedVal);
            value.Subscribe(arg => {
                if (Entity != null) Entity[_ui.FieldName] = arg.NewData;
            });
            Html.Instance.MaskMoney(value, new Options
            {
                thousands = isDecimal ? groupSeparator : string.Empty,
                @decimal = separator,
                precision = isDecimal ? _ui.Precision : 0
            });
            InteractiveElement = Html.Context;
        }
    }
}
