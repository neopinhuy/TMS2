using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ElementType = MVVM.ElementType;

namespace Components
{
    public class TableParam<Data>
    {
        public ObservableArray<Header<Data>> Headers { get; set; }
        public ObservableArray<Data> RowData { get; set; }
        public Action<Data> RowClick { get; set; }
        public Action<Data> RowDblClick { get; set; }
    }

    public class Table<T> : Component
    {
        public ObservableArray<Header<T>> Headers { get; set; }
        public ObservableArray<T> RowData { get; set; }
        private readonly TableParam<T> _tableParam;
        private IEnumerable<IEnumerable<object>> _refData;
        private HTMLTableElement _frozenTable;
        private HTMLTableElement _mainTable;

        const string _selected = "selected-row";
        const string _hovering = "hovering";
        private int? selectedRow;
        public int? SelectedRow { 
            get => selectedRow; 
            set 
            {
                selectedRow = value;
                RootHtmlElement
                    .QuerySelectorAll("tbody tr").ToList()
                    .ForEach(x => x.ReplaceClass(_selected, string.Empty));
                if (selectedRow is null) return;
                RootHtmlElement.QuerySelectorAll("tbody tr")
                    .ElementAt(selectedRow.Value).AddClass(_selected);
            } 
        }

        private int? timeOut = null;

        public Table(TableParam<T> tableParam)
        {
            Headers = tableParam.Headers;
            RowData = tableParam.RowData;
            _tableParam = tableParam;
        }

        public override void Render()
        {
            Html.Instance.Div.ClassName("table-wrapper");
            RootHtmlElement = Html.Context as HTMLElement;
            Html.Instance.Table.ClassName("table frozen");
            _frozenTable = Html.Context as HTMLTableElement;
            Html.Instance.End.Div.ClassName("non-frozen").Table.ClassName("table");
            _mainTable = Html.Context as HTMLTableElement;
            Rerender();
            Html.Instance.EndOf(".table-wrapper");
            Headers.Subscribe(x =>
            {
                // Rerender(table);
            });
            RowData.Subscribe(args =>
            {
                if (args.Action == ObservableAction.Update)
                {
                    var tbodies = _mainTable.TBodies;
                    //// Remove the row at index
                    //if (tbodies != null && tbodies.Any())
                    //{
                    //    var tbody = tbodies[0];
                    //    tbody.Rows[args.Index].Remove();
                    //    Html.Take(tbody);
                    //    RenderRowData(args.Item, args.Index);
                    //    tbody.InsertBefore(Html.Context, tbody.Rows[args.Index]);
                    //}
                    //// Update the row
                }
                else Rerender();
            });
        }

        private void Rerender()
        {
            if (timeOut != null)
            {
                Window.ClearTimeout(timeOut.Value);
            }
            timeOut = Window.SetTimeout(async () =>
            {
                SortHeaderByGroupName();
                await LoadMasterData();
                var frozen = Headers.Data.Where(x => x.Frozen).ToList();
                var nonFrozen = Headers.Data.Where(x => !x.Frozen).ToList();

                Html.Take(_frozenTable).Clear();
                RenderTableHeader(_frozenTable, frozen);
                RenderTableContent(_frozenTable, frozen);

                Html.Take(_mainTable).Clear();
                RenderTableHeader(_mainTable, nonFrozen);
                RenderTableContent(_mainTable, nonFrozen);
            });
        }

        private void SortHeaderByGroupName()
        {
            Headers.NewValue = Headers.Data
                .OrderByDescending(x => x.Frozen).ThenBy(x => x.Order)
                .GroupBy(x => x.GroupName)
                .Select(x => x.OrderBy(header => header.Order))
                .SelectMany(x => x).ToArray();
        }

        private async Task LoadMasterData()
        {
            if (_refData != null && _refData.Any()) return;
            var refEntities = Headers.Data
                .Where(x => x.Reference.HasAnyChar())
                .DistinctBy(x => x.Reference + x.DataSource)
                .Select(x => TypeClient<object>.Instance.GetListEntity(x.Reference, x.DataSource));
            _refData = await Task.WhenAll(refEntities);
        }

        private void RenderTableHeader(Element table, List<Header<T>> headers)
        {
            var html = Html.Take(table);
            bool hasGroup = headers.Any(x => !string.IsNullOrEmpty(x.GroupName));
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
                if (!hasGroup && Headers.Data.Any(x => x.GroupName.HasAnyChar()))
                {
                    html.ClassName("header-group");
                }
                if (header.StatusBar) html.ClassName("status-cell").Icon("fa fa-edit").End.Render();
                if (header.EditEvent != null || header.DeleteEvent != null)
                {
                    html.TextAlign(TextAlign.center).Icon("mif-folder-open").Margin(Direction.right, 0).End.Render();
                }
                else
                {
                    html.Span.Text(header.HeaderText).End.Render();
                    if (header.HasFilter)
                    {
                        html.Span.ClassName("fa fa-filter").Event(EventType.Click, async (e) =>
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

        private void RenderTableContent(Element table, List<Header<T>> headers)
        {
            var html = Html.Take(table);
            html.TBody.ForEach(RowData.Data, (row, index) =>
            {
                RenderRowData(headers, row);
            }).EndOf(ElementType.table).Render();
        }

        private void RenderRowData(List<Header<T>> headers, T row)
        {
            var html = Html.Instance;
            html.TRow
                .Event(EventType.Click, ToggleSelectRow, row)
                .Event(EventType.MouseEnter, HoverRow, row)
                .Event(EventType.MouseLeave, LeaveRow, row);
            if (_tableParam.RowClick != null) html.Event(EventType.Click, _tableParam.RowClick, row);
            if (_tableParam.RowDblClick != null) html.Event(EventType.DblClick, _tableParam.RowDblClick, row);
            html.ForEach(headers, (Header<T> header, int headerIndex) => RenderTableCell(row, header));
        }

        private void ToggleSelectRow(T rowData)
        {
            var index = Array.IndexOf(RowData.Data, rowData);
            ToggleSelectRow(rowData, index, _frozenTable.TBodies[0]);
            ToggleSelectRow(rowData, index, _mainTable.TBodies[0]);
        }

        private static void ToggleSelectRow(T rowData, int index, HTMLTableSectionElement body)
        {
            var tableRow = body.Rows[index];
            if (tableRow.ClassName.Contains(_selected))
            {
                tableRow.ReplaceClass(_selected, string.Empty);
                rowData["__selected__"] = false;
            }
            else
            {
                tableRow.AddClass(_selected);
                rowData["__selected__"] = true;
            }
            if (tableRow.ClassName.Contains(_hovering))
                tableRow.ReplaceClass(_hovering, string.Empty);
        }

        private void HoverRow(T rowData)
        {
            var index = Array.IndexOf(RowData.Data, rowData);
            HoverRow(index, _frozenTable.TBodies[0]);
            HoverRow(index, _mainTable.TBodies[0]);
        }

        private static void HoverRow(int index, HTMLTableSectionElement body)
        {
            var tableRow = body.Rows[index];
            if (!tableRow.ClassName.Contains(_hovering))
                tableRow.AddClass(_hovering);
        }

        private void LeaveRow(T rowData)
        {
            var index = Array.IndexOf(RowData.Data, rowData);
            LeaveRow(index, _frozenTable.TBodies[0]);
            LeaveRow(index, _mainTable.TBodies[0]);
        }

        private static void LeaveRow(int index, HTMLTableSectionElement body)
        {
            var tableRow = body.Rows[index];
            if (tableRow.ClassName.Contains(_hovering))
                tableRow.ReplaceClass(_hovering, string.Empty);
        }

        private void RenderTableCell(T row, Header<T> header)
        {
            var html = Html.Instance;
            html.TData.Render();
            if (header.StatusBar) html.ClassName("status-cell").Icon("mif-pencil").End.Render();
            if (header.EditEvent != null)
            {
                html.Button.ClassName("button small warning")
                    .Event(EventType.Click, async (data) =>
                    {
                        await header.EditEvent(data);
                    }, row)
                    .Span.ClassName("fa fa-edit").EndOf(ElementType.button);
            }
            if (header.DeleteEvent != null)
            {
                html.Button.ClassName("button small secondary").Margin(Direction.left, 4)
                    .AsyncEvent(EventType.Click, header.DeleteEvent, row)
                    .Span.ClassName("fa fa-trash").EndOf(ElementType.button);
            }
            if (string.IsNullOrEmpty(header.FieldName)) return;
            if (!row.HasOwnProperty(header.FieldName)) return;
            object cellData = row[header.FieldName];
            var cellText = GetCellText(header, cellData);
            header.TextAlign = !string.IsNullOrEmpty(cellText) ? TextAlign.left : header.TextAlign;
            header.TextAlign = CalcTextAlign(header.TextAlign, cellData);
            html.TextAlign(header.TextAlign).Text(cellText).End.Render();
        }

        private string GetCellText(Header<T> header, object cellData)
        {
            if (cellData == null) return string.Empty;
            if (cellData is DateTime)
            {
                return string.Format(header.Format ?? "{0:dd/MM/yyyy}", cellData as DateTime?);
            }
            else if (header.Reference != null)
            {
                var source = _refData.GetSourceByTypeName(header.Reference);
                var found = source.FirstOrDefault(x => (int)x["Id"] == (int)cellData);
                if (found == null) return string.Empty;
                if (header.Format.HasAnyChar())
                {
                    return Utils.FormatWith(header.Format, found);
                }
                else throw new InvalidOperationException($"Format of {header.FieldName} is null");
            }
            else if (header.Format.HasAnyChar()) return string.Format(header.Format, cellData);
            else return cellData.ToString();
        }

        private static TextAlign? CalcTextAlign(TextAlign? textAlign, object cellData)
        {
            if (textAlign != null || cellData is null)
                return textAlign;
            if (cellData.GetType().IsNumber())
            {
                return TextAlign.right;
            }
            else if (cellData is string)
            {
                return TextAlign.left;
            }
            return TextAlign.center;
        }

        public void MoveUp()
        {
            if (SelectedRow is null || SelectedRow == 0) SelectedRow = RowData.Data.Length - 1;
            else if (SelectedRow > 0) SelectedRow--;
        }

        public void MoveDown()
        {
            if (SelectedRow is null || SelectedRow == RowData.Data.Length - 1) SelectedRow = 0;
            else if (SelectedRow < RowData.Data.Length - 1) SelectedRow++;
        }
    }
}
