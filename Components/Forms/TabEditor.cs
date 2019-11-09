using Bridge.Html5;
using MVVM;

namespace Components.Forms
{
    public class TabEditor<T> : EditForm<T> where T : class
    {
        public TabEditor()
        {
            Title = $"{typeof(T).Name} List";
            Name = Title; // Set default for form name
        }

        public override void Render()
        {
            if (IsExisted()) return;
            base.Render();
        }

        public bool IsExisted()
        {
            var tab = Document.QuerySelector($"#tab-content #{ClassId}");
            if (tab != null) {
                RootHtmlElement = tab;
                return true;
            }
            Html.Take("#tabs")
                .Li.Anchor.Href($"#{ClassId}").Event(EventType.MouseUp, CloseTheTab).Text(Title).End
                .Span.ClassName("icon fa fa-times").Event(EventType.Click, Dispose).End.Render();
            Html.Take("#tab-content").Div.Id(ClassId).Render();
            RootHtmlElement = Html.Context;
            return false;
        }

        public virtual void Focus()
        {
            var html = Html.Take($"a[href='#{ClassId}'");
            html.Trigger(EventType.Click);
        }

        private void CloseTheTab(Event e)
        {
            var which = System.Convert.ToInt64(e["which"]);
            var button = System.Convert.ToInt64(e["button"]);
            if (which == 2 || button == 1)
            {
                e.PreventDefault();
                Dispose();
            }
        }

        protected override void RemoveDOM()
        {
            Html.Take($"#tabs a[href='#{ClassId}']");
            var isActive = Html.Context.ParentElement.ClassName.Contains("active");
            var previousTab = Html.Context.ParentElement.PreviousElementSibling;
            var nextTab = Html.Context.ParentElement.NextElementSibling;
            Html.Context.ParentElement.Remove();
            Html.Take("#" + ClassId);
            Html.Context.Remove();
            if (isActive)
            {
                if (previousTab != null)
                    previousTab.FirstElementChild.Click();
                if (nextTab != null)
                    nextTab.FirstElementChild.Click();
            }
        }
    }
}
