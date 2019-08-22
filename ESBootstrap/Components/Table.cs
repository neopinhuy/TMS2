using MVVM;

namespace Components
{
    public class Table<Data> : IControl
    {
        public ObservableArray<TableMetadata> Metadata { get; set; }
        public ObservableArray<Data> RowData { get; set; }

        public Table(ObservableArray<TableMetadata> metadata, ObservableArray<Data> rowData)
        {
            Metadata = metadata;
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
            .Theader.ForEach(Metadata, (metaData, index) =>
            {
                html.TRow.Th.Text(metaData.Header);
                if (metaData.ShowSort) html.Attr("data-sortable", "true");
                html.End.Render();
            })
            .EndOf(ElementType.thead)
            .TBody.ForEach(RowData, (row, index) =>
            {
                html.TRow.ForEach(Metadata, (metaData, headerIndex) =>
                {
                    html.TData.Text(row[metaData.FieldName].ToString()).End.Render();
                });
            })
            .EndOf(ElementType.table).Render();
        }
    }
}
