using MVVM;
using System;
using TMS.API.Models;

namespace Components
{
    public class Datepicker : Component
    {
        private readonly UserInterface _ui;

        public Datepicker(UserInterface ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var value = new Observable<DateTime?>((DateTime?)Entity?[_ui.FieldName]);
            value.Subscribe(arg => {
                var res = ValueChanging?.Invoke(arg);
                if (res == false) return;
                if (Entity != null) Entity[_ui.FieldName] = arg.NewData;
                ValueChanged?.Invoke(arg);
            });
            Html.Instance
                .SmallDatePicker(value);
            InteractiveElement = Html.Context;
        }
    }
}
