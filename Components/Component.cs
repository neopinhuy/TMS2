using Bridge.Html5;
using System;
using System.Threading.Tasks;

namespace Components
{
    public abstract class Component
    {
        public virtual Component ParentComponent { get; set; }
        public virtual Component RootComponent { 
            get
            {
                var result = this;
                while (result.ParentComponent != null)
                    result = result.ParentComponent;
                return result;
            }
        }

        public virtual Element RootHtmlElement { get; set; }
        public abstract Task RenderAsync();

        public virtual void Dispose()
        {
            RootHtmlElement.Remove();
        }

        protected string ClassId => "feature_" + GetType().Name;
    }
}
