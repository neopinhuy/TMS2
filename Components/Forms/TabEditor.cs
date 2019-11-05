using MVVM;
using System.Linq;
using System.Threading.Tasks;

namespace Components.Forms
{
    public partial class TabEditor<T> : TabComponent
    {
        private readonly EditForm<T> _editor;
        public T Entity { get; set; }
        public ObservableArray<T> EntityList { get; set; }
        public override string Title { get; set; } = $"{typeof(T).Name} List";

        public TabEditor()
        {
            _editor = new EditForm<T>
            {
                Parent = this
            };
        }

        public override async Task RenderAsync()
        {
            if (IsExisted()) return;
            _editor.Title = Title;
            await _editor.RenderAsync();
        }

        public async Task Edit(T entity)
        {
            var editor = new PopupEditor<T>
            {
                Entity = entity,
            };
            await editor.RenderAsync();
        }

        public async Task Create()
        {
            var defaultT = (T)typeof(T).GetConstructors().First(x => x.GetParameters().Length == 0).Invoke();
            var editor = new PopupEditor<T>
            {
                Entity = defaultT
            };
            await editor.RenderAsync();
        }
    }
}
