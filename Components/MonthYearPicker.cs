using Common.Extensions;
using MVVM;
using System;
using TMS.API.Models;

namespace Components
{
    public class MonthYearPicker : Component
    {
        private readonly TMS.API.Models.Component _ui;
        public Observable<DateTime?> Value { get; private set; }

        public MonthYearPicker(TMS.API.Models.Component ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            Value = new Observable<DateTime?>((DateTime?)Entity?.GetComplexPropValue(_ui.FieldName));
            Value.Subscribe(arg => {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
            });
            Html.Instance.SmallMonthYearPicker(Value);
            InteractiveElement = Html.Context;
        }

        public override void UpdateView()
        {
            var value = (DateTime?)Entity?.GetComplexPropValue(_ui.FieldName);
            Value.Data = value;
        }
    }
}
