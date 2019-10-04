using Bridge.Html5;
using MVVM;
using System.Linq;
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
            RenderTableHeader(table);
            RenderTableContent(table);
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
            timeOut = Window.SetTimeout(() =>
            {
                Html.Take(table).Clear();
                RenderTableHeader(table);
                RenderTableContent(table);
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
                    html.Attr("colspan", headers.Count(x => x.GroupName == header.GroupName).ToString());
                    html.Text(header.GroupName).Render();
                    return;
                }
                html.Th.Render();
                if (hasGroup && string.IsNullOrEmpty(header.GroupName))
                {
                    html.Attr("rowspan", "2");
                }
                if (header.EditButton || header.DeleteButton)
                {
                    html.Span.ClassName("fg-cyan mif-folder-open").End.Render();
                }
                else
                {
                    html.Text(header.HeaderText).Render();
                    if (header.Sortable)
                    {
                        html.Span.ClassName("fa fa-filter").Event(EventType.Click, (e) =>
                        {
                            Html.Take(e.Target as HTMLElement).Closest(ElementType.th);
                            var boudingRect = Html.Context.GetBoundingClientRect();

                            var filter = new ColumnFilter();
                            filter.Render();
                            filter.Top = boudingRect.Top + boudingRect.Height;
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
                        html.Th.Text(header.HeaderText).EndOf(ElementType.th);
                    }
                });
            }
            html.EndOf(ElementType.thead);
        }

        private void RenderTableContent(Element table)
        {
            var html = Html.Take(table);
            html.TBody.ForEach(RowData.Data, (Data row, int index) =>
            {
                html.TRow.ForEach(Headers.Data, (header, headerIndex) =>
                {
                    html.TData.Render();
                    if (header.EditButton)
                    {
                        html.Button.ClassName("button small warning")
                            .EventAsync(EventType.Click, header.EditEvent, row)
                            .Span.ClassName("fa fa-edit").End.End.Render();
                    }
                    else if (header.DeleteButton)
                    {
                        html.Button.ClassName("button small danger").Span.ClassName("fa fa-remove").End.End.Render();
                    }
                    else
                    {
                        if (!row.HasOwnProperty(header.FieldName))
                            throw new System.InvalidOperationException("Cannot find property " + header.FieldName);
                        object cellData = row[header.FieldName];
                        html.Text(cellData?.ToString()).End.Render();
                    }
                });
            }).EndOf(".table-wrapper").Render();
        }
    }
}
