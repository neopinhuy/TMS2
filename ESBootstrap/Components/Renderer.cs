using MVVM;
using System.Collections.Generic;

namespace Components
{
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
            return html.SmallInput().Attr("type", "date");
        }

        public static Html SmallInput(this Html html)
        {
            return html.Input.ClassName("input-small").Attr("data-role", "input");
        }

        public static Html SmallDropDown<T>(this Html html, List<T> list, T selectedItem, string displayField = null, string valueField = null)
        {
            return html.Dropdown(list, selectedItem, displayField, valueField).ClassName("input-small").Attr("data-role", "select");
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

        public static Html Table<Data>(this Html html, ObservableArray<TableMetadata> metadata, ObservableArray<Data> rowData)
        {
            var table = new Table<Data>(metadata, rowData);
            table.Render();
            return html;
        }
    }
}
