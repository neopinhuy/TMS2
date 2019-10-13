using Bridge.Html5;
using MVVM;
using System.Threading.Tasks;

namespace Components
{
    public abstract class Component
    {
        public abstract string Title { get; set; }
        public virtual void Render() { }
#pragma warning disable CS1998 // Async method lacks 'await' operators and will run synchronously
        public virtual async Task RenderAsync()
#pragma warning restore CS1998 // Async method lacks 'await' operators and will run synchronously
        {
            Render();
        }
        protected string FullClassName => GetType().FullName.Replace(".", "_");

        /// <summary>
        /// Check if the component has been mounted to the main tab
        /// </summary>
        /// <returns>True if it has been mounted, and vice versa</returns>
        public bool IsExisted()
        {
            var tab = Document.QuerySelector($"#tab-content #{FullClassName}");
            if (tab != null) return true;
            Html.Take("#tabs")
                .Li.Anchor.Href($"#{FullClassName}").Event(EventType.MouseUp, CloseTheTab).Text(Title).End
                .Span.ClassName("icon fa fa-times").Event(EventType.Click, Close).End.Render();
            Html.Take("#tab-content").Div.Id(FullClassName).Render();
            return false;
        }

        private void CloseTheTab(Event e)
        {
            var which = System.Convert.ToInt64(e["which"]);
            var button = System.Convert.ToInt64(e["button"]);
            if (which == 2 || button == 1)
            {
                e.PreventDefault();
                Close();
            }
        }

        private void Close()
        {
            Html.Take($"#tabs a[href='#{FullClassName}']");
            var isActive = Html.Context.ParentElement.ClassName.Contains("active");
            var previousTab = Html.Context.ParentElement.PreviousElementSibling;
            var nextTab = Html.Context.ParentElement.NextElementSibling;
            Html.Context.ParentElement.Remove();
            Html.Take("#" + FullClassName);
            Html.Context.Remove();
            if (isActive)
            {
                if (previousTab != null)
                    previousTab.FirstElementChild.Click();
                if (nextTab != null)
                    nextTab.FirstElementChild.Click();
            }
        }

        public virtual void Focus()
        {
            var html = Html.Take($"a[href='#{FullClassName}'");
            html.Trigger(EventType.Click);
        }
    }
}
