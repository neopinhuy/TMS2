using Bridge.Html5;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;

namespace Components
{
    public class EditableLink : Textbox
    {
        private readonly TMS.API.Models.Component _ui;

        public EditableLink(TMS.API.Models.Component ui) : base(ui)
        {
            _ui = ui ?? throw new ArgumentNullException(nameof(ui));
        }

        public override void Render()
        {
            base.Render();
            InteractiveElement.AddClass("hide");
            var parent = InteractiveElement.ParentElement;
            parent.TabIndex = -1;
            parent.AddEventListener(EventType.FocusIn, () => InteractiveElement.RemoveClass("hide"));
            parent.AddEventListener(EventType.FocusOut, () => InteractiveElement.AddClass("hide"));
            var format = string.Empty;
            if (_ui.FormatData.HasAnyChar()) format = Utils.FormatWith(_ui.FormatData, Value.Data);
            else if (_ui.FormatEntity.HasAnyChar()) format = Utils.FormatWith(_ui.FormatEntity, Entity);
            Html.Take(parent).Anchor.Href(format).Text(Value.Data);
        }
    }
}
