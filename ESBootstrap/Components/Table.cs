using MVVM;

namespace Components
{
    public class Table<Data> : IControl
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
            html.Table.ClassName("table striped table-border mt-4")
                .Attr("data-role", "table")
                .Attr("data-cls-table-top", "row flex-nowrap")
                .Attr("data-show-search", "false")
                .Attr("data-show-rows-steps", "false")
                .Attr("data-show-pagination", "false")
                .Attr("data-show-activity", "false")
                .Attr("data-cls-component", "shadow-1")
            .Theader.ForEach(Headers, (metaData, index) =>
            {
                html.TRow.Th.Render();
                if (metaData.ShowSort) html.Attr("data-sortable", "true");
                if (metaData.EditButton || metaData.DeleteButton)
                {
                    html.Span.ClassName("mif-folder").End.Render();
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
                            .Event(Bridge.Html5.EventType.Click, (x) =>
                            {
                                System.Console.WriteLine(x);
                                header.EditEvent(x);
                            }, row)
                            .Span.ClassName("fa fa-edit").End.End.Render();
                    }
                    else if (header.DeleteButton)
                    {
                        html.Button.ClassName("button small danger").Span.ClassName("fa fa-remove").End.End.Render();
                    }
                    else
                    {
                        html.Text(row[header.FieldName].ToString()).End.Render();
                    }
                });
            })
            .EndOf(ElementType.table).Render();
        }
    }
}
