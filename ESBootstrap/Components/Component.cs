using Bridge.Html5;
using MVVM;

namespace Components
{
    public abstract class Component
    {
        public abstract string ControlName { get; set; }
        public abstract string Title { get; set; }
        public abstract void Render();
        public void Focus()
        {
            var html = Html.Take($"a[href='#{ControlName}'");
            html.Trigger(EventType.Click);
        }
    }
}
