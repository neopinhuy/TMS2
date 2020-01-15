using System;
using TMS.API.Models;

namespace Components.Extensions
{
    public static class ComponentFactory
    {
        public static Component GetComponent(TMS.API.Models.Component ui, string componentType)
        {
            Component childComponent = null;
            switch (componentType)
            {
                case "Link":
                    childComponent = new EditableLink(ui);
                    break;
                case "Input":
                    childComponent = new Textbox(ui);
                    break;
                case "Password":
                    childComponent = new Textbox(ui) { Password = true };
                    break;
                case "Label":
                    childComponent = new Label(ui);
                    break;
                case "Textarea":
                    childComponent = new Textbox(ui) { MultipleLine = true };
                    break;
                case "Dropdown":
                    childComponent = new SearchEntry(ui);
                    break;
                case "Datepicker":
                    childComponent = new DatePicker(ui);
                    break;
                case "MonthYearPicker":
                    childComponent = new MonthYearPicker(ui);
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
                default:
                    Console.WriteLine($"Component type {componentType} of {ui.Id}_{ui.FieldName} not supported");
                    break;
            }
            childComponent.Id = ui.Id;
            childComponent.Name = ui.FieldName;
            return childComponent;
        }
    }
}
