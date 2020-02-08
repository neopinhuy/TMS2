using Bridge.Html5;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Components.Forms
{
    public class TabEditor<T> : EditForm<T> where T : class
    {
        public static List<Component> Tabs = new List<Component>();
        public string Icon { get; set; }
        public TabEditor()
        {
            var type = typeof(T);
            Title = $"{type.Name} List";
            Name = Title; // Set default for form name
            if (Entity == null) Entity = Activator.CreateInstance(type);
        }

        public override void Render()
        {
            if (IsExisted()) return;
            Tabs.Add(this);
            base.Render();
        }

        public bool IsExisted()
        {
            var existing = Tabs.FirstOrDefault(x => x.Id == Id);
            if (existing != null) return true;
            Html.Take("#tabs")
                .Li.A.Href($"#{Id}-{ClassId}").Event(EventType.MouseUp, Close).Icon(Icon).EndOf(MVVM.ElementType.a)
                .Span.ClassName("icon fa fa-times").Event(EventType.Click, Dispose).End.Render();
            Html.Take("#tab-content").Div.Id($"{Id}-{ClassId}").Render();
            ContainerElement = Html.Context;
            return false;
        }

        public virtual void Focus()
        {
            var html = Html.Take($"a[href='#{Id}-{ClassId}']");
            html.Trigger(EventType.Click);
        }

        public void Close(Event e)
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
            Html.Take($"#tabs a[href='#{Id}-{ClassId}']");
            var isActive = Html.Context.ParentElement.ClassName.Contains("active");
            var previousTab = Html.Context.ParentElement.PreviousElementSibling;
            var nextTab = Html.Context.ParentElement.NextElementSibling;
            Html.Context.ParentElement.Remove();
            var dom = Document.GetElementById($"{Id}-{ClassId}");
            dom?.Remove();
            Tabs.Remove(this);
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
