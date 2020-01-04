using Bridge.Html5;
using Common.Extensions;
using MVVM;
using System;

namespace Components
{
    public class DatePicker : Component
    {
        private readonly TMS.API.Models.Component _ui;
        public Observable<DateTime?> Value { get; private set; }

        public DatePicker(TMS.API.Models.Component ui)
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
                var input = InteractiveElement as HTMLInputElement;
                input.Value = string.Format("{0:dd/MM/yyyy}", arg.NewData);
                ValueChanged?.Invoke(arg);
            });
            Html.Instance
                .SmallDatePicker(Value);
            InteractiveElement = Html.Context;
        }

        public override void UpdateView()
        {
            var value = (DateTime?)Entity?.GetComplexPropValue(_ui.FieldName);
            Value.Data = value;
        }
    }
}
