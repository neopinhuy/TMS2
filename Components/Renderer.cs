using Bridge.Html5;
using MVVM;
using System;
using System.Globalization;

namespace Components
{
    public enum TextAlign
    {
        center, end, inherit, initial, justify, left, right, start, unset
    }

    public enum Direction
    {
        top, right, bottom, left
    }

    public enum Position
    {
        absolute, @fixed, inherit, initial, relative, @static, sticky, unset
    }

    public enum BorderType {
        dotted, dasheddashed, solid, @double, groove, ridge, inset, outset, none, hidden
    }

    public static class Renderer
    {
        public static Html ColSpan(this Html html, int colSpan)
        {
            return html.Attr("colspan", colSpan.ToString());
        }

        public static Html RowSpan(this Html html, int colSpan)
        {
            return html.Attr("rowspan", colSpan.ToString());
        }

        public static Html Panel(this Html html, string text = string.Empty)
        {
            html.Div.ClassName("panel");
            if (!string.IsNullOrEmpty(text)) html.Label.ClassName("header").Text(text).End.Render();
            return html;
        }

        public static Html SmallDatePicker(this Html html, Observable<DateTime?> value)
        {
            html.Input.ClassName("input-small").Value(value.Data?.ToString())
                .Attr("data-role", "calendarpicker")
                .Attr("data-format", "%d/%m/%Y")
                .Attr("data-cls-calendar", "compact")
                .Event(EventType.Input, (e) => ParseDate(value, e))
                .Event(EventType.Change, (e) => ParseDate(value, e))
                .Event(EventType.Focus, (e) => {
                    var input = e.Target as HTMLInputElement;
                    input.ReadOnly = false;
                    var rect = input.GetBoundingClientRect();
                    var screenHeight = Window.ScreenY;
                    var top = rect.Top > screenHeight / 2 ? rect.Top - 270 : rect.Bottom;
                    Html.Take(input.NextElementSibling.NextElementSibling)
                        .HeightPx(270)
                        .Floating(rect.Bottom, rect.Left - 1);
                });
            return html;
        }

        private static void ParseDate(Observable<DateTime?> value, Event e)
        {
            var input = e.Target as HTMLInputElement;
            if (string.IsNullOrWhiteSpace(input.Value))
            {
                value.Data = null;
                return;
            }
            var parsed = DateTime.TryParseExact(input.Value, "dd/MM/yyyy",
                CultureInfo.InvariantCulture, out DateTime dateTime);
            if (!parsed) return;
            value.Data = (DateTime?)dateTime;
        }

        /// <summary>
        /// Non auto enclosing element
        /// </summary>
        /// <param name="html"></param>
        /// <param name="text"></param>
        /// <param name="className"></param>
        /// <param name="icon"></param>
        /// <returns></returns>
        public static Html Button(this Html html, string text = string.Empty, string className = "button info small", string icon = string.Empty)
        {
            html.Button.Render();
            if (!string.IsNullOrEmpty(icon))
            {
                html.Span.ClassName(icon).End.Text(" ").Render();
            }
            return html.ClassName(className).Text(text);
        }
        
        /// <summary>
        /// Render small input, not an auto enclosing component
        /// </summary>
        /// <param name="html"></param>
        /// <param name="value"></param>
        /// <param name="align"></param>
        /// <returns></returns>
        public static Html SmallInput(this Html html, string value = string.Empty, string align = "left")
        {
            return html.Input.ClassName("input-small " + align).Attr("data-role", "input").Value(value);
        }

        /// <summary>
        /// Render small input, non auto-enclosing component
        /// </summary>
        /// <param name="html"></param>
        /// <param name="value"></param>
        /// <param name="align"></param>
        /// <returns></returns>
        public static Html SmallInput<T>(this Html html, Observable<T> value, string align = "left")
        {
            return html.Input.ClassName("input-small " + align).Attr("data-role", "input").Value(value);
        }

        /// <summary>
        /// Render small search input, not an auto enclosing component
        /// </summary>
        /// <param name="html"></param>
        /// <param name="value"></param>
        /// <param name="align"></param>
        /// <returns></returns>
        public static Html SmallSearchInput(this Html html, string value = string.Empty, string align = "left")
        {
            return html.SmallInput(value, align).PlaceHolder("Search...").Attr("data-search-button", true.ToString());
        }

        public static Html PlaceHolder(this Html html, string value)
        {
            return html.Attr("placeholder", value);
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

        public static Html SmallCheckbox(this Html html, string text, Observable<bool?> value = null)
        {
            html.Checkbox(value).ClassName("input-small").Type("checkbox")
                .Attr("data-role", "checkbox")
                .Attr("data-style", "2")
                .Attr("data-cls-check", "myCheckbox")
                .Attr("data-caption", text);
            return html;
        }

        public static Html SmallCheckbox(this Html html, string text, bool value)
        {
            html.Input.ClassName("input-small").Type("checkbox")
                .Attr("data-role", "checkbox")
                .Attr("data-style", "2")
                .Attr("data-cls-check", "myCheckbox")
                .Attr("data-caption", text);
            var chk = Html.Context as HTMLInputElement;
            chk.Checked = value;
            return html;
        }

        public static Html Disabled(this Html html, bool disabled)
        {
            if (disabled == false) return html;
            return html.Attr("disabled", "disabled");
        }

        public static Html Readonly(this Html html)
        {
            return html.Attr("readonly", "readonly");
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

        public static Html Margin(this Html html, Direction direction, double margin, string unit = "px")
        {
            return html.Style($"margin-{direction} : {margin}{unit}");
        }

        public static Html MarginRem(this Html html, Direction direction, double margin)
        {
            return html.Style($"margin-{direction} : {margin}rem");
        }

        public static Html Padding(this Html html, Direction direction, double padding, string unit = "px")
        {
            return html.Style($"padding-{direction} : {padding}{unit}");
        }

        public static Html PaddingRem(this Html html, Direction direction, double margin)
        {
            return html.Style($"padding-{direction} : {margin}rem");
        }

        public static Html Width(this Html html, string width)
        {
            return html.Style($"width: {width}");
        }

        public static Html WidthRem(this Html html, int width)
        {
            return html.Style($"width: {width}rem");
        }

        public static Html WidthPercentage(this Html html, double width)
        {
            return html.Style($"width: {width}%");
        }

        public static Html Height(this Html html, string height)
        {
            return html.Style($"height: {height}");
        }

        public static Html HeightPx(this Html html, double height)
        {
            return html.Style($"height: {height}px");
        }

        public static Html HeightRem(this Html html, double height)
        {
            return html.Style($"height: {height}rem");
        }

        public static Html HeightPercentage(this Html html, int height)
        {
            return html.Style($"height: {height}%");
        }

        public static Html Border(this Html html, int width = 0, BorderType borderType = BorderType.solid, string color = "000", Direction? direction = null)
        {
            if (direction != null)
                return html.Style($"border-{direction}: {width}px {borderType} #{color}");
            return html.Style($"border: {width}px {borderType} #{color}");
        }

        public static Html Display(this Html html, string display)
        {
            return html.Style($"display: {display};");
        }

        /// <summary>
        /// Render the table and its wrapper, auto enclosing component
        /// </summary>
        /// <param name="html">Html</param>
        /// <param name="headerData">Header description</param>
        /// <param name="rowData">Row data</param>
        /// <typeparam name="Data">Generic type of the data row</typeparam>
        /// <returns></returns>
        public static Html Table<Data>(this Html html, TableParam<Data> tableParam) where Data : class
        {
            var table = new Table<Data>(tableParam);
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

        public static Html TextAlign(this Html html, TextAlign? alignment = Components.TextAlign.unset)
        {
            return html.Style("text-align: " + alignment.ToString());
        }

        public static Html Position(this Html html, Direction direction, double value)
        {
            return html.Style($"{direction}: {value}px");
        }

        public static Html Position(this Html html, Direction direction, string value)
        {
            return html.Style($"{direction}: {value}");
        }

        public static Html Position(this Html html, Position position)
        {
            return html.Style($"position: {position}");
        }

        /// <summary>
        /// Render icon inside span, non auto-closing
        /// </summary>
        /// <param name="html"></param>
        /// <param name="iconClass"></param>
        /// <returns></returns>
        public static Html Icon(this Html html, string iconClass)
        {
            return html.Span.ClassName("icon").ClassName(iconClass);
        }

        public static Html Floating(this Html html, double top, double left)
        {
            return html.Position(Components.Position.@fixed)
                .Position(Direction.top, top)
                .Position(Direction.left, left);
        }

        public static Html Floating(this Html html, string top, string left)
        {
            return html.Position(Components.Position.@fixed)
                .Position(Direction.top, top)
                .Position(Direction.left, left);
        }

        public static Html TabIndex(this Html html, int tabIndex, bool force = false)
        {
            var oldTabIndex = Html.Context.GetAttribute("tabindex");
            if (!string.IsNullOrEmpty(oldTabIndex) && !force) return html;
            return html.Attr("tabindex", tabIndex.ToString());
        }
    }
}
