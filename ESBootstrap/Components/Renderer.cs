using MVVM;
using System.Collections.Generic;

namespace Components
{
    public enum Direction
    {
        top, right, bottom, left
    }

    public static class Renderer
    {
        public static Html EditButton(this Html html)
        {
            return html.TData.Button.ClassName("button small warning").I.ClassName("fa fa-edit").End;
        }

        public static Html ActionColumn(this Html html)
        {
            return html.Th.Span.ClassName("mif-folder-open fg-cyan").End.End;
        }

        public static Html Panel(this Html html)
        {
            return html.Div.Attr("data-role", "panel").ClassName("panel").Attr("data-cls-panel", "shadow-1");
        }

        public static Html SmallDatePicker(this Html html)
        {
            return html.Input.ClassName("input-small").Attr("data-role", "calendarpicker").Attr("data-format", "%d/%m/%Y");
        }

        public static Html SmallInput(this Html html, string align = "left")
        {
            return html.Input.ClassName("input-small " + align).Attr("data-role", "input");
        }

        public static Html SmallDropDown<T>(this Html html, List<T> list, T selectedItem, string displayField = null, string valueField = null)
        {
            return html.Dropdown(list, selectedItem, displayField, valueField)
                .ClassName("input-small").Attr("data-role", "select")
                .Attr("style", "mind-width: 120px");
        }

        public static Html SmallRadio(this Html html, string name, string text)
        {
            return html.Input.ClassName("input-small").Type("radio").Attr("data-role", "radio").Attr("name", name).Attr("data-caption", text);
        }

        public static Html Grid(this Html html)
        {
            return html.Div.ClassName("grid");
        }

        public static Html GridRow(this Html html)
        {
            return html.Div.ClassName("row");
        }

        public static Html GridCell(this Html html, int size)
        {
            return html.Div.ClassName("cell cell-" + size);
        }

        public static Html Margin(this Html html, Direction direction, float margin, string unit = "px")
        {
            return html.Style($"margin-{direction} : {margin}{unit}");
        }

        public static Html Table<Data>(this Html html, ObservableArray<Header<Data>> metadata, ObservableArray<Data> rowData)
        {
            new Table<Data>(metadata, rowData);
            return html;
        }

        public static void RenderAndFocus(this Component component)
        {
            component.Render();
            component.Focus();
        }
    }
}
