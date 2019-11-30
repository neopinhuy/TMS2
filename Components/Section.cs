using MVVM;

namespace Components
{
    public class Section : Component
    {
        public Section(MVVM.ElementType elementType)
        {
            Html.Instance.Add(elementType);
        }

        public override void Render()
        {
            // Do nothing here
        }
    }
}
