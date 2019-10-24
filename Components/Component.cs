using Bridge.Html5;
using System;
using System.Threading.Tasks;

namespace Components
{
    public abstract class Component : IDisposable
    {
        public virtual HTMLElement RootElement { get; set; }
        public abstract Task RenderAsync();
        protected MasterData _masterData;

        public virtual void Dispose()
        {
            RootElement.Remove();
        }

        protected string FullClassName => GetType().FullName.Replace(".", "_");
    }
}
