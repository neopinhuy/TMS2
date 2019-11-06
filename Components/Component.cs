using Bridge.Html5;
using MVVM;
using System.Collections.Generic;
using System.Linq;

namespace Components
{
    public abstract class Component
    {
        protected string ClassId => "feature_" + GetType().Name;
        protected virtual string Name { get; set; }
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
            child.RootHtmlElement = Html.Context;
            child.Entity = Entity;
            child.ParentEntity = ParentEntity;
            child.CurrentEntities = CurrentEntities;
            Children.Add(child);
            child.Parent = this;
            child.Render();
        }

        public void RemoveChild(Component child)
        {
            child.Dispose();
            Children.Remove(child);
        }

        public Component Find(string name)
        {
            foreach (var child in Children)
            {
                if (child.Name == name) return child;
                else if (child.Children != null && child.Children.Any())
                {
                    var res = child.Find(name);
                    if (res != null) return res;
                }
            }
            return null;
        }

        public abstract void Render();
        public virtual void Dispose()
        {
            RootHtmlElement.Remove();
        }
    }
}
