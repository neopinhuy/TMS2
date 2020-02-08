using Bridge.Html5;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using ElementType = MVVM.ElementType;

namespace Components
{
    public class GroupRowData
    {
        public object Key { get; set; }
        public IEnumerable<object> Children { get; set; }
    }

    public class GroupTable : Table<object>
    {
        private const string groupKey = "__groupkey__";
        public GroupTable(TableParam<object> tableParam) : base(tableParam)
        {
        }

        public override void Render()
        {
            base.Render();
            Html.Take(ContainerElement).ClassName("group-table").End.Render();
            BuildGroupRowData(new ObservableArrayArgs<object>
            {
                Array = RowData.Data,
                Index = -1,
                Action = ObservableAction.Render
            });
            RowData.Subscribe(BuildGroupRowData);
        }

        private void BuildGroupRowData(ObservableArrayArgs<object> arg)
        {
            if (_tableParam.GroupBy.IsNullOrEmpty()) return;
            var arr = RowData.Data;
            if (arr.Nothing()) return;
            if (arr.First()[nameof(GroupRowData.Key)] != null) return;
            var keys = _tableParam.GroupBy.Split(",");
            RowData.NewValue = arg.Array.Select(x =>
            {
                x[groupKey] = string.Join(" ", keys.Select(key => x.GetComplexPropValue(key)?.ToString()));
                return x;
            }).GroupBy(x => (string)x[groupKey]).Select(x => new GroupRowData
            {
                Key = x.Key,
                Children = x.ToList()
            }).Cast<object>().ToArray();
        }

        public override object[] GetFlatternRowData()
        {
            if (FlatternRowData != null) return FlatternRowData;
            var first = RowData.Data.FirstOrDefault();
            if (first != null && first.HasOwnProperty(nameof(GroupRowData.Key))
                && first.HasOwnProperty(nameof(GroupRowData.Children)))
            {
                FlatternRowData = RowData.Data.Cast<GroupRowData>().SelectMany(x => x.Children).ToArray();
            }
            else
            {
                FlatternRowData = RowData.Data;
            }
            return FlatternRowData;
        }

        protected override void RenderRowData(List<Header<object>> headers, object row, Section tableSection)
        {
            if (row.GetBool(_emptyFlag))
            {
                base.RenderRowData(headers, row, tableSection);
                return;
            }
            var groupRow = (GroupRowData)row;
            var tbody = Html.Context as HTMLTableSectionElement;
            Html.Instance.TRow.ClassName("group-row");
            tableSection.AddChild(new Section(Html.Context));
            var columnExpanded = headers.Any(x => x.StatusBar) ? headers.Count - 1 : headers.Count;
            if (tbody.ParentElement.HasClass("frozen"))
            {
                var groupText = Utils.FormatWith(_tableParam.GroupFormat, groupRow.Children.FirstOrDefault());
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
            groupRow.Children.ForEach(child =>
            {
                Html.Take(tbody);
                base.RenderRowData(headers, child, tableSection);
            });
        }

        private void ToggleGroupRow(Event e)
        {
            if (!(e.Target is HTMLElement target)) return;
            var index = GetIndex(e);
            var frozenGroupRow = _frozenTable.TBodies[0].Rows[index];
            var nonfrozenGroupRow = _nonFrozenTable.TBodies[0].Rows[index];
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
