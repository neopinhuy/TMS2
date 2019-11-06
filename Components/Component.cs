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
            if (child.RootHtmlElement is null) child.RootHtmlElement = Html.Context;
            if (child.Entity is null) child.Entity = Entity;
            if (child.ParentEntity is null) child.ParentEntity = ParentEntity;
            if (child.CurrentEntities is null) child.CurrentEntities = CurrentEntities;
            Children.Add(child);
            if (child.Parent is null) child.Parent = this;
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
