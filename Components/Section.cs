﻿using Bridge.Html5;
using MVVM;

namespace Components
{
    public class Section : Component
    {
        public Section(MVVM.ElementType elementType)
        {
            Html.Instance.Add(elementType);
            RootHtmlElement = Html.Context;
        }

        public Section(Element existingElement)
        {
            RootHtmlElement = existingElement;
        }

        public string TextContent
        {
            get 
            {
                return RootHtmlElement.TextContent;
            }
            set
            {
                RootHtmlElement.TextContent = value;
            }
        }

        public override void Render()
        {
            // Do nothing here
        }
    }
}
