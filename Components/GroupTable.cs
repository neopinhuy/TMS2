using Components.Extensions;
using MVVM;
using System.Collections.Generic;

namespace Components
{
    public class GroupTable<T> : Table<T> where T : class
    {
        public GroupTable(TableParam<T> tableParam) : base(tableParam)
        {
        }

        protected override void RenderRowData(List<Header<T>> headers, T row)
        {
            // Add a new group row
            var groupText = Utils.FormatWith(_tableParam.GroupFormat, row);
            Html.Instance.TRow.ClassName("group-row")
                .TData.ColSpan(headers.Count).Text(groupText).EndOf(ElementType.tr);

            base.RenderRowData(headers, row);
        }
    }
}
