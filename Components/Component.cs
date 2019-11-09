using Bridge.Html5;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Components
{
    public abstract class Component
    {
        private bool disabled;
        private bool focus;

        protected const string Id = "Id";
        protected string ClassId => "feature_" + GetType().Name;
        public virtual string Name { get; set; }
        public virtual Component Parent { get; set; }
        public List<Component> Children { get; protected set; }
        public virtual Element RootHtmlElement { get; set; }
        public virtual Element InteractiveElement { get; set; }
        public Action<ObservableArgs> ValueChanged { get; set; }
        public virtual bool Disabled
        {
            get => disabled;
            set
            {
                disabled = value;
                if (InteractiveElement is null) return;
                if (value) InteractiveElement.SetAttribute("disabled", "disabled");
                else InteractiveElement.RemoveAttribute("disabled");
            }
        }
        public virtual bool ShouldFocus
        {
            get => focus;
            set
            {
                focus = value;
                if (InteractiveElement is null) return;
                if (value) InteractiveElement["focus"].As<Action>();
                else InteractiveElement["blur"].As<Action>();
            }
        }
        public object Entity { get; set; }
        public virtual void Show(bool show)
        {
            var ele = RootHtmlElement as HTMLElement;
            if (!show)
                ele.Style.Display = "none";
            else
                ele.Style.Display = "";
        }

        public virtual Component RootComponent
        {
            get
            {
                var result = this;
                while (result.Parent != null)
                    result = result.Parent;
                return result;
            }
        }

        public void AddChild(Component child)
        {
            if (Children is null) Children = new List<Component>();
            if (child.RootHtmlElement is null) child.RootHtmlElement = Html.Context;
            if (child.Entity is null) child.Entity = Entity;
            Children.Add(child);
            if (child.Parent is null) child.Parent = this;
            child.Render();
        }

        public void RemoveChild(Component child)
        {
            Children.Remove(child);
        }

        public Component FindComponent(string name)
        {
            foreach (var child in Children)
            {
                if (child.Name == name) return child;
                else if (child.Children != null && child.Children.Any())
                {
                    var res = child.FindComponent(name);
                    if (res != null) return res;
                }
            }
            return null;
        }

        public abstract void Render();
        public Action Disposing { get; set; }
        public Action Disposed { get; set; }
        public virtual void Dispose()
        {
            Disposing?.Invoke();
            if (Children != null)
            {
                foreach (var child in Children)
                {
                    child.Dispose();
                }
            }
            RemoveDOM();
            Disposed?.Invoke();
        }

        protected virtual void RemoveDOM()
        {
            RootHtmlElement.Remove();
        }
    }
}
