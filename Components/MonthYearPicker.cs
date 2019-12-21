﻿using Common.Extensions;
using MVVM;
using System;
using TMS.API.Models;

namespace Components
{
    public class MonthYearPicker : Component
    {
        private readonly TMS.API.Models.Component _ui;

        public MonthYearPicker(TMS.API.Models.Component ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var value = new Observable<DateTime?>((DateTime?)Entity?.GetComplexPropValue(_ui.FieldName));
            value.Subscribe(arg => {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                if (Entity != null) Entity.SetComplexPropValue(_ui.FieldName, arg.NewData);
                ValueChanged?.Invoke(arg);
            });
            Html.Instance.SmallMonthYearPicker(value);
            InteractiveElement = Html.Context;
        }
    }
}
