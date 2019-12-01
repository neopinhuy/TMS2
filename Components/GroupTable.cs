using Bridge.Html5;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System.Collections.Generic;
using System.Linq;
using ElementType = MVVM.ElementType;

namespace Components
{
    public class GroupTable : Table<object>
    {
        public GroupTable(TableParam<object> tableParam) : base(tableParam)
        {
        }

        protected override void RenderRowData(List<Header<object>> headers, object row, Section section)
        {
            var table = Html.Context as HTMLTableSectionElement;
            Html.Instance.TRow.ClassName("group-row");
            section.AddChild(new Section(Html.Context));
            var columnExpanded = headers.Any(x => x.StatusBar) ? headers.Count - 1 : headers.Count;
            if (table.ParentElement.HasClass("frozen"))
            {
                var groupText = Utils.FormatWith(_tableParam.GroupFormat, row);
                Html.Instance.TData.ClassName("status-cell").Icon("mif-pencil").EndOf(ElementType.td)
                    .TData.ColSpan(columnExpanded)
                        .Icon("fa fa-chevron-right").Event(EventType.Click, ToggleGroupRow).End
                    .Text(groupText);
            }
            else
            {
                Html.Instance.TData.ColSpan(columnExpanded).Render();
            }
            Html.Instance.EndOf(ElementType.tr);
            base.RenderRowData(headers, row, section);
        }

        private void ToggleGroupRow(Event e)
        {
            if (!(e.Target is HTMLElement target)) return;
            var index = GetIndex(e);
            var frozenGroupRow = _frozenTable.TBodies[0].Rows[index];
            var nonfrozenGroupRow = _mainTable.TBodies[0].Rows[index];
            if (target.HasClass("fa-chevron-right"))
            {
                target.ReplaceClass("fa-chevron-right", "fa-chevron-down");
                ToggleDataRow(frozenGroupRow);
                ToggleDataRow(nonfrozenGroupRow);
            }
            else
            {
                target.ReplaceClass("fa-chevron-down", "fa-chevron-right");
                ToggleDataRow(frozenGroupRow, true);
                ToggleDataRow(nonfrozenGroupRow, true);
            }
        }

        private static void ToggleDataRow(HTMLTableRowElement groupRow, bool show = false)
        {
            var nextGroupRow = groupRow.NextElementSibling;
            while (nextGroupRow != null && !nextGroupRow.HasClass("group-row"))
            {
                nextGroupRow.Style.Display = show ? string.Empty : "none";
                nextGroupRow = nextGroupRow.NextElementSibling;
            }
        }
    }
}
