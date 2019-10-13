using Bridge.Html5;
using System.Threading.Tasks;

namespace Components
{
    public abstract class Component
    {
        public virtual HTMLElement RootElement { get; internal set; }
        public abstract Task RenderAsync();
        public virtual async Task Destroy()
        {
            RootElement.Remove();
        }
        protected string FullClassName => GetType().FullName.Replace(".", "_");
    }
}
