using Bridge.Html5;
using System;
using System.Threading.Tasks;

namespace Components
{
    public abstract class Component
    {
        public virtual Component Parent { get; set; }
        public virtual Component RootParent { 
            get
            {
                var result = this;
                while (result.Parent != null)
                    result = result.Parent;
                return result;
            }
        }

        public virtual Element RootElement { get; set; }
        public abstract Task RenderAsync();
        protected MasterData _masterData;

        public virtual void Dispose()
        {
            RootElement.Remove();
        }

        protected string ClassId => "feature_" + GetType().Name;
    }
}
