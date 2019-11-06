using MVVM;
using System;
using System.Collections.Generic;
using TMS.API.Models;

namespace Components
{
    public class Checkbox: Component
    {
        private readonly UserInterface _ui;
        public object Entity { get; set; }
        public ObservableArray<object> ParentEntity { get; set; }
        public List<ObservableArray<object>> CurrentEntities { get; set; }

        public Checkbox(UserInterface ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            var value = new Observable<bool?>((bool?)Entity?[_ui.FieldName]);
            value.Subscribe(arg => { if (Entity != null) Entity[_ui.FieldName] = arg.NewData; });
            Html.Instance.SmallCheckbox(string.Empty, value);
        }
    }
}
