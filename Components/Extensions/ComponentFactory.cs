﻿using TMS.API.Models;

namespace Components.Extensions
{
    public static class ComponentFactory
    {
        public static Component GetComponent(UserInterface ui, string componentType)
        {
            Component childComponent = null;
            switch (componentType)
            {
                case "Input":
                    childComponent = new Textbox(ui);
                    break;
                case "Dropdown":
                    childComponent = new SearchEntry(ui);
                    break;
                case "Datepicker":
                    childComponent = new Datepicker(ui);
                    break;
                case "Checkbox":
                    childComponent = new Checkbox(ui);
                    break;
                case "Image":
                    childComponent = new ImageUploader(ui);
                    break;
                case "Button":
                    childComponent = new Button(ui);
                    break;
                case "Number":
                case "Currency":
                    childComponent = new NumberInput(ui);
                    break;
                case "GridView":
                    childComponent = new GridView(ui);
                    break;
            }

            return childComponent;
        }
    }
}
