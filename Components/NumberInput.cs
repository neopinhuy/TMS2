using Bridge.Html5;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;
using static Retyped.jquery_maskmoney.jQueryMaskMoney;

namespace Components
{
    public class NumberInput : Component
    {
        private readonly TMS.API.Models.Component _ui;
        private bool isDecimal;

        public Observable<decimal?> Value { get; private set; }

        public NumberInput(TMS.API.Models.Component ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var parsed = ParseNumber(out var parsedVal);
            if (!parsed) return;
            Value = new Observable<decimal?>(parsedVal);
            Value.Subscribe(arg =>
            {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
            });
            Html.Instance.MaskMoney(Value, new Options
            {
                thousands = isDecimal ? "," : string.Empty,
                @decimal = ".",
                precision = isDecimal ? _ui.Precision : 0
            });
            InteractiveElement = Html.Context as HTMLElement;
        }

        private bool ParseNumber(out decimal parsedVal)
        {
            isDecimal = _ui.Precision != null && _ui.Precision != 0;
            return decimal.TryParse(Entity?.GetComplexPropValue(_ui.FieldName)?.ToString(), out parsedVal);
        }

        public override void UpdateView()
        {
            var parsed = ParseNumber(out var parsedVal);
            if (!parsed) return;
            Value.Data = parsedVal;
        }
    }
}
