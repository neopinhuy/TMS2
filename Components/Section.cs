using Bridge.Html5;
using MVVM;

namespace Components
{
    public class Section : Component
    {
        public Section(MVVM.ElementType elementType)
        {
            Html.Instance.Add(elementType);
            InteractiveElement = Html.Context as HTMLElement;
        }

        public Section(Element container)
        {
            ContainerElement = container;
            InteractiveElement = container as HTMLElement;
        }

        public string TextContent
        {
            get 
            {
                return ContainerElement.TextContent;
            }
            set
            {
                ContainerElement.TextContent = value;
            }
        }

        public override void Render()
        {
            // Do nothing here
        }
    }
}
