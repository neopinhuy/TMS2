﻿using Bridge.Html5;
using MVVM;

namespace Components
{
    public abstract class Component
    {
        public abstract string ControlName { get; set; }
        public abstract string Title { get; set; }
        public abstract void Render();
        protected string FullClassName => GetType().FullName.Replace(".", "_");

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

        public void Focus()
        {
            var html = Html.Take($"a[href='#{FullClassName}'");
            html.Trigger(EventType.Click);
        }
    }
}
