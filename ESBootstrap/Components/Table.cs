using MVVM;

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
            var html = Html.Instance;
            html.Div.ClassName("table-wrapper").Table.ClassName("table striped table-border")
                .Attr("data-cls-table-top", "row flex-nowrap")
                .Attr("data-show-search", "false")
                .Attr("data-show-rows-steps", "false")
                .Attr("data-show-pagination", "false")
                .Attr("data-show-activity", "false")
                .Attr("data-cls-component", "shadow-1")
            .Theader.TRow.ForEach(Headers, (metaData, index) =>
            {
                html.Th.Attr("data-sortable", "false");
                if (metaData.EditButton || metaData.DeleteButton)
                {
                    html.Span.ClassName("fg-cyan mif-folder-open").End.Render();
                }
                else
                {
                    html.Text(metaData.HeaderText).Render();
                }
                html.EndOf(ElementType.tr);
            })
            .EndOf(ElementType.thead)
            .TBody.ForEach(RowData, (row, index) =>
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
                        var cellData = row[header.FieldName];
                        if (cellData == null) throw new System.InvalidOperationException("Cannot find property " + header.FieldName);
                        html.Text(row[header.FieldName].ToString()).End.Render();
                    }
                });
            })
            .EndOf(".table-wrapper").Render();
        }
    }
}
