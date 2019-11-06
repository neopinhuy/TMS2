using Bridge.Html5;
using MVVM;
using System.Collections.Generic;

namespace Components
{
    public abstract class Component
    {
        protected string ClassId => "feature_" + GetType().Name;
        public virtual Component Parent { get; set; }
        public List<Component> Children { get; protected set; } = new List<Component>();
        public virtual Element RootHtmlElement { get; set; }
        public object Entity { get; set; }
        public ObservableArray<object> ParentEntity { get; set; }
        public List<ObservableArray<object>> CurrentEntities { get; set; }

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
            Children.Add(child);
            child.Parent = this;
            child.Render();
        }

        public void RemoveChild(Component child)
        {
            child.Dispose();
            Children.Remove(child);
        }

        public abstract void Render();
        public virtual void Dispose()
        {
            RootHtmlElement.Remove();
        }
    }
}
