namespace Components
{
    public interface IComponent
    {
        string ControlName { get; set; }
        string Title { get; set; }
        void Render();
        void Focus();
    }
}
