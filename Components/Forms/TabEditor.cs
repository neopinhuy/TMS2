using System.Threading.Tasks;

namespace Components.Forms
{
    public partial class TabEditor<T> : TabComponent
    {
        private readonly EditForm<T> _editor;
        public T Data { get; set; }
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
                Data = entity
            };
            await editor.RenderAsync();
        }
    }
}
