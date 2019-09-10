﻿using MVVM;
using System.Collections.Generic;

namespace Components
{
    public enum Direction
    {
        top, right, bottom, left
    }

    public static class Renderer
    {
        public static Html ColSpan(this Html html, int colSpan)
        {
            return html.Attr("colspan", colSpan.ToString());
        }

        public static Html EditButton(this Html html)
        {
            return html.TData.Button.ClassName("button small warning").I.ClassName("fa fa-edit").End;
        }

        public static Html ActionColumn(this Html html)
        {
            return html.Th.Span.ClassName("mif-folder-open fg-cyan").End.End;
        }

        public static Html Panel(this Html html, string text = string.Empty, string clsPanel = string.Empty)
        {
            return html.Div.Attr("data-role", "panel").ClassName("panel").Attr("data-cls-panel", clsPanel)
                .Label.ClassName("header").Text(text).End;
        }

        public static Html SmallDatePicker(this Html html, string value = null)
        {
            html.Input.ClassName("input-small").Attr("data-role", "calendarpicker").Attr("data-format", "%d/%m/%Y");
            if (!string.IsNullOrEmpty(value))
            {
                html.Value(value);
            }
            return html;
        }

        public static Html Button(this Html html, string text = string.Empty, string className = "button info small", string icon = string.Empty)
        {
            html.Button.Render();
            if (!string.IsNullOrEmpty(icon))
            {
                html.Span.ClassName(icon).End.Text(" ").Render();
            }
            return html.ClassName(className).Text(text);
        }
        
        public static Html SmallInput(this Html html, string value = string.Empty, string align = "left")
        {
            return html.Input.ClassName("input-small " + align).Attr("data-role", "input").Value(value);
        }

        public static Html PlaceHolder(this Html html, string value)
        {
            return html.Attr("placeholder", value);
        }

        public static Html SmallDropDown<T>(this Html html, List<T> list, T selectedItem, string displayField = null, string valueField = null)
        {
            return html.Dropdown(list, selectedItem, displayField, valueField)
                .ClassName("input-small").Attr("data-role", "select")
                .Attr("style", "mind-width: 120px");
        }

        public static Html SmallRadio(this Html html, string name, string text)
        {
            return html.Input.ClassName("input-small").Type("radio")
                .Attr("data-role", "radio")
                .Attr("data-style", "2")
                .Attr("name", name)
                .Attr("data-cls-check", "myCheck")
                .Attr("data-caption", text);
        }

        public static Html SmallCheckbox(this Html html, string text, bool check = false)
        {
            html.Input.ClassName("input-small").Type("checkbox")
                .Attr("data-role", "checkbox")
                .Attr("data-style", "2")
                .Attr("data-cls-check", "myCheckbox")
                .Attr("data-caption", text);
            if (check)
            {
                html.Attr("checked", check.ToString());
            }
            return html;
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

        public static Html Margin(this Html html, Direction direction, decimal margin, string unit = "px")
        {
            return html.Style($"margin-{direction} : {margin}{unit}");
        }

        public static Html MarginRem(this Html html, Direction direction, decimal margin)
        {
            return html.Style($"margin-{direction} : {margin}rem");
        }

        public static Html Padding(this Html html, Direction direction, decimal padding, string unit = "px")
        {
            return html.Style($"padding-{direction} : {padding}{unit}");
        }

        public static Html PaddingRem(this Html html, Direction direction, decimal margin)
        {
            return html.Style($"padding-{direction} : {margin}rem");
        }

        public static Html Width(this Html html, int width)
        {
            return html.Style($"width: {width}px");
        }

        public static Html WidthPercentage(this Html html, int width)
        {
            return html.Style($"width: {width}%");
        }

        public static Html Table<Data>(this Html html, ObservableArray<Header<Data>> metadata, ObservableArray<Data> rowData)
        {
            var table = new Table<Data>(metadata, rowData);
            table.Render();
            return html;
        }

        public static Html Tab(this Html html)
        {
            return html.Ul.Attr("data-role", "tabs").Attr("data-expand", "true");
        }

        public static Html TabItem(this Html html, string title, string reference, bool active = false)
        {
            html.Li.Anchor.Href("#" + reference).Text(title).End.Render();
            if (active) html.ClassName("active");
            return html.End;
        }

        public static Html TabContent(this Html html)
        {
            return html.Div.ClassName("tabs-content");
        }

        public static void RenderAndFocus(this Component component)
        {
            component.Render();
            component.Focus();
        }
    }
}
