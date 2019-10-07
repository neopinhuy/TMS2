using Bridge.Html5;
using LogContract.Interfaces;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ElementType = MVVM.ElementType;

namespace Components
{
    public class Table<Data>
    {
        public ObservableArray<Header<Data>> Headers { get; set; }
        public ObservableArray<Data> RowData { get; set; }
        private int? timeOut = null;

        public Table(ObservableArray<Header<Data>> metadata, ObservableArray<Data> rowData)
        {
            Headers = metadata;
            RowData = rowData;
        }

        public void Render()
        {
            Html.Instance.Div.ClassName("table-wrapper")
                .Table.ClassName("table striped");
            var table = Html.Context;
            Rerender(table);
            Html.Instance.End.End.Render();
            Headers.Subscribe(x =>
            {
                Rerender(table);
            });
            RowData.Subscribe(x =>
            {
                Rerender(table);
            });
        }

        private void Rerender(Element table)
        {
            if (timeOut != null)
            {
                Window.ClearTimeout(timeOut.Value);
            }
            timeOut = Window.SetTimeout(async () =>
            {
                Html.Take(table).Clear();
                RenderTableHeader(table);
                await RenderTableContent(table);
            });
        }

        private void RenderTableHeader(Element table)
        {
            var html = Html.Take(table);
            var headers = Headers.Data;
            bool hasGroup = Headers.Data.Any(x => !string.IsNullOrEmpty(x.GroupName));
            // Render first header
            html.Thead.TRow.ForEach(headers, (header, index) =>
            {
                if (hasGroup && !string.IsNullOrEmpty(header.GroupName))
                {
                    if (header != headers.FirstOrDefault(x => x.GroupName == header.GroupName)) return;
                    html.Th.Render();
                    html.ColSpan(headers.Count(x => x.GroupName == header.GroupName));
                    html.Text(header.GroupName).Render();
                    return;
                }
                html.Th.Render();
                if (hasGroup && string.IsNullOrEmpty(header.GroupName))
                {
                    html.RowSpan(2);
                }
                if (header.EditEvent != null || header.DeleteEvent != null)
                {
                    html.TextAlign(TextAlign.center).Icon("mif-folder-open").Margin(Direction.right, 0).End.Render();
                }
                else
                {
                    html.Span.Text(header.HeaderText).End.Render();
                    if (header.Sortable)
                    {
                        html.Span.ClassName("fa fa-filter").Event(EventType.Click, (e) =>
                        {
                            Html.Take(e.Target as HTMLElement).Closest(ElementType.th);
                            var boudingRect = Html.Context.GetBoundingClientRect();
                            var filter = new ColumnFilter();
                            filter.Render();
                            filter.Top = boudingRect.Bottom;
                            filter.Left = boudingRect.Left;
                            filter.Toggle();
                        }).End.Render();
                    }
                }
                html.EndOf(ElementType.th);
            }).EndOf(ElementType.tr).Render();

            if (hasGroup)
            {
                html.TRow.ForEach(headers, (header, index) =>
                {
                    if (hasGroup && !string.IsNullOrEmpty(header.GroupName))
                    {
                        html.Th.Span.Text(header.HeaderText).EndOf(ElementType.th);
                    }
                });
            }
            html.EndOf(ElementType.thead);
        }

        private async Task RenderTableContent(Element table)
        {
            var headerSources = Headers.Data.Where(x => x.Source != null)
                .Select(x =>
                {
                    var sourceType = new Type[] { x.Source };
                    var type = typeof(BaseClient<>).MakeGenericType(sourceType); 
                    var httpGet = type.GetMethod("GetList");
                    var client = Activator.CreateInstance(type);
                    return httpGet.Invoke(client).As<Task<object>>();
                });
            var sources = (await Task.WhenAll(headerSources)).As<IEnumerable<IEnumerable<object>>>();

            var html = Html.Take(table);
            html.TBody.ForEach(RowData.Data, (Data row, int index) =>
            {
                html.TRow.ForEach(Headers.Data, (header, headerIndex) =>
                {
                    html.TData.Render();
                    if (header.EditEvent != null)
                    {
                        html.Button.ClassName("button small warning")
                            .EventAsync(EventType.Click, header.EditEvent, row)
                            .Span.ClassName("fa fa-edit").EndOf(ElementType.button);
                    }
                    if (header.DeleteEvent != null)
                    {
                        html.Button.ClassName("button small secondary").Margin(Direction.left, 4)
                            .EventAsync(EventType.Click, header.DeleteEvent, row)
                            .Span.ClassName("fa fa-trash").EndOf(ElementType.button);
                    }
                    if (!string.IsNullOrEmpty(header.FieldName))
                    {
                        if (!row.HasOwnProperty(header.FieldName))
                            throw new System.InvalidOperationException("Cannot find property " + header.FieldName);
                        object cellData = row[header.FieldName];
                        string cellText = cellData?.ToString() ?? string.Empty;
                        if (cellData != null && cellData is DateTime)
                        {
                            cellText = string.Format("{0:dd/MM/yyyy}", cellData as DateTime?);
                        }
                        if (header.Source != null)
                        {
                            var source = sources.FirstOrDefault(x => x.FirstOrDefault().GetType() == header.Source)
                                .As<IEnumerable<object>>();
                            cellText = source.FirstOrDefault(x => x["Id"] == cellData)?["Name"]?.ToString();
                            header.TextAlign = TextAlign.left;
                        }
                        header.TextAlign = CalcTextAlign(header.TextAlign, cellData);
                        html.TextAlign(header.TextAlign).Text(cellText).End.Render();
                    }
                });
            }).EndOf(".table-wrapper").Render();
        }

        private static TextAlign? CalcTextAlign(TextAlign? textAlign, object cellData)
        {
            if (textAlign != null || cellData is null)
                return textAlign;
            if (Util.IsNumber(cellData))
            {
                return TextAlign.right;
            }
            else if (cellData is string)
            {
                return TextAlign.left;
            }
            return TextAlign.center;
        }
    }
}
