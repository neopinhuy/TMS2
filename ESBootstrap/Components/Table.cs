using MVVM;
using System.Linq;

namespace Components
{
    public class Table<Data>
    {
        public ObservableArray<Header<Data>> Headers { get; set; }
        public ObservableArray<Data> RowData { get; set; }

        public Table(ObservableArray<Header<Data>> metadata, ObservableArray<Data> rowData)
        {
            Headers = metadata;
            RowData = rowData;
        }

        public void Render()
        {
            Html.Instance.Div.ClassName("table-wrapper")
                .Table.ClassName("table striped");

            RenderTableHeader();
            RenderTableContent();
            Headers.Subscribe(x => RenderTableHeader());
        }

        private void RenderTableHeader()
        {
            var html = Html.Instance;
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
                }
                html.EndOf(ElementType.th);
            }).EndOf(ElementType.tr).Render();

            if (hasGroup)
            {
                html.TRow.ForEach(headers, (header, index) =>
                {
                    if (hasGroup && !string.IsNullOrEmpty(header.GroupName))
                    {
                        html.Th.Render();
                        html.Text(header.HeaderText).Render();
                        html.EndOf(ElementType.th);
                    }
                });
            }
            html.EndOf(ElementType.thead);
        }

        private void RenderTableContent()
        {
            var html = Html.Instance;
            html.TBody.ForEach(RowData, (row, index) =>
            {
                html.TRow.ForEach(Headers, (header, headerIndex) =>
                {
                    html.TData.Render();
                    if (header.EditButton)
                    {
                        html.Button.ClassName("button small warning")
                            .Event(Bridge.Html5.EventType.Click, header.EditEvent, row)
                            .Span.ClassName("fa fa-edit").End.End.Render();
                    }
                    else if (header.DeleteButton)
                    {
                        html.Button.ClassName("button small danger").Span.ClassName("fa fa-remove").End.End.Render();
                    }
                    else
                    {
                        object cellData = row[header.FieldName]
                            ?? throw new System.InvalidOperationException("Cannot find property " + header.FieldName);
                        html.Text(cellData.ToString()).End.Render();
                    }
                });
            }).EndOf(".table-wrapper").Render();
        }
    }
}
