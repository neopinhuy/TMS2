using Bridge.Html5;
using MVVM;
using System.Threading.Tasks;

namespace Components.Forms
{
    public class TabEditor<T> : EditForm<T>
    {
        public override string Title { get; set; } = $"{typeof(T).Name} List";

        public override async Task RenderAsync()
        {
            if (IsExisted()) return;
            await base.RenderAsync();
        }

        public bool IsExisted()
        {
            var tab = Document.QuerySelector($"#tab-content #{ClassId}");
            if (tab != null) return true;
            Html.Take("#tabs")
                .Li.Anchor.Href($"#{ClassId}").Event(EventType.MouseUp, CloseTheTab).Text(Title).End
                .Span.ClassName("icon fa fa-times").Event(EventType.Click, Dispose).End.Render();
            Html.Take("#tab-content").Div.Id(ClassId).Render();
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

        public override void Dispose()
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
