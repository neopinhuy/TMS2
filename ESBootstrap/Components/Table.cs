using Components;
using ESBootstrap.Components;
using MVVM;
using System.Collections.Generic;

namespace Components
{
    public class Table<Data> : IControl
    {
        public List<TableMetadata> Metadata { get; set; }
        public ObservableArray<Data> RowData { get; set; }

        public Table(List<TableMetadata> metadata)
        {
            Metadata = metadata;
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
            .Theader.ForEach(Metadata.ToArray(), (metaData, index) =>
            {
                html.TRow.Th.Text(metaData.Header);
                if (metaData.ShowSort) html.Attr("data-sortable", "true");
                html.End.Render();
            })
            .EndOf(ElementType.thead)
            .TBody.ForEach(RowData, (row, index) =>
            {
                html.TRow.ForEach(Metadata.ToArray(), (metaData, headerIndex) =>
                {
                    html.TData.Text(row[metaData.FieldName].ToString()).End.Render();
                });
            })
            .EndOf(ElementType.table).Render();
        }
    }
}
