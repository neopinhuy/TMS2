using Bridge.Html5;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Components
{
    public abstract class Component
    {
        protected string ClassId => "feature_" + GetType().Name;
        public virtual Component Parent { get; set; }
        public List<Component> Children { get; protected set; }
        public virtual Element RootHtmlElement { get; set; }

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
        }

        public void RemoveChild(Component child)
        {
            Children.Remove(child);
        }

        public abstract void Render();
        public virtual void Dispose()
        {
            RootHtmlElement.Remove();
        }
    }
}
