using Bridge.Html5;
using MVVM;

namespace Components
{
    public class Section : Component
    {
        public Element Context { get; set; }
        public Section(MVVM.ElementType elementType)
        {
            Html.Instance.Add(elementType);
            Context = Html.Context;
        }

        public Section(Element existingElement)
        {
            Context = existingElement;
        }

        public override void Render()
        {
            // Do nothing here
        }
    }
}
