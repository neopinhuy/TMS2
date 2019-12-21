using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using ElementType = MVVM.ElementType;
using InvalidOperationException = Common.Extensions.InvalidOperationException;

namespace Components
{
    public class TableParam<Data>
    {
        public ObservableArray<Header<Data>> Headers { get; set; }
        public ObservableArray<Data> RowData { get; set; }
        public Action<Data> RowClick { get; set; }
        public Action<Data> RowDblClick { get; set; }
        public string GroupBy { get; set; }
        public string GroupFormat { get; set; }
    }

    public class Table<T> : Component where T : class, new()
    {
        public ObservableArray<Header<T>> Headers { get; set; }
        public ObservableArray<T> RowData { get; set; }
        public int? SelectedRow { get; set; }
        public Action<Event> BodyContextMenu { get; set; }
        public bool Editable { get; private set; }
        public Func<ObservableArgs, Header<T>, T, bool> CellChanging { get; set; }
        public Action<ObservableArgs, Header<T>, T> CellChanged { get; set; }

        protected readonly TableParam<T> _tableParam;
        private IEnumerable<IEnumerable<object>> _refData;
        protected HTMLTableElement _frozenTable;
        protected HTMLTableElement _nonFrozenTable;
        protected Section _frozenSection;
        protected Section _mainSection;
        private int? timeOut = null;
        private bool _isFocusCell;

        private List<Header<T>> FrozenHeader
        {
            get
            {
                return Headers.Data.Where(x => x.Frozen).ToList();
            }
        }
        private List<Header<T>> NonFrozenHeader
        {
            get
            {
                return Headers.Data.Where(x => !x.Frozen).ToList();
            }
        }

        public const string _selectedClass = "selected-row";
        public const string _hovering = "hovering";
        public const string _emptyFlag = "__empty__";
        public const string _selectedFlag = "__selected__";
        public const string _rowData = "rowData";

        public Table(TableParam<T> tableParam)
        {
            Headers = tableParam.Headers;
            RowData = tableParam.RowData;
            _tableParam = tableParam;
        }

        public override void Render()
        {
            Editable = Headers.Data.Any(x => x.Editable);
            Html.Instance.Div.ClassName("table-wrapper")
                .ClassName(Editable ? "editable" : string.Empty);
            RootHtmlElement = Html.Context as HTMLElement;
            Html.Instance.Table.ClassName("table frozen");
            _frozenTable = Html.Context as HTMLTableElement;
            _frozenSection = new Section(_frozenTable);
            AddChild(_frozenSection);
            Html.Instance.End.Div.ClassName("non-frozen").Table.ClassName("table");
            _nonFrozenTable = Html.Context as HTMLTableElement;
            _mainSection = new Section(_nonFrozenTable);
            AddChild(_mainSection);
            Rerender();
            Html.Instance.EndOf(".table-wrapper");
            Headers.Subscribe(x =>
            {
                // Rerender(table);
            });
            RowData.Subscribe(args =>
            {
                if (args.Action == ObservableAction.Render)
                {
                    Rerender();
                }
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
                var frozen = FrozenHeader;
                var nonFrozen = NonFrozenHeader;

                if (RowData.Data.HasElement())
                {
                    Html.Take(_frozenTable).Clear();
                    RenderTableHeader(FrozenHeader);
                    RenderTableContent(frozen, _frozenSection);

                    Html.Take(_nonFrozenTable).Clear();
                    RenderTableHeader(NonFrozenHeader);
                    RenderTableContent(NonFrozenHeader, _mainSection);

                    if (Editable)
                    {
                        AddNewEmptyRow(frozen, nonFrozen);
                    }
                    _frozenTable.TBodies[0].AddEventListener(EventType.ContextMenu, BodyContextMenu);
                    _nonFrozenTable.TBodies[0].AddEventListener(EventType.ContextMenu, BodyContextMenu);
                }
                else
                {
                    Html.Take(_frozenTable).Clear();
                    Html.Take(_nonFrozenTable).Clear();
                    _frozenSection.Children.ForEach(x => x.Dispose());
                    _mainSection.Children.ForEach(x => x.Dispose());
                    Html.Take(_mainSection.RootHtmlElement).P.ClassName("no-records").Text("No records found");
                }

                RenderSummary(frozen, nonFrozen);
                AfterRendered?.Invoke();
            });
        }

        private void RenderSummary(List<Header<T>> frozen, List<Header<T>> nonFrozen)
        {
            if (Headers.Data.All(x => x.Summary.IsNullOrEmpty())) return;
            var sums = Headers.Data.Where(x => x.Summary.HasAnyChar())
                .DistinctBy(x => x.Summary);
            sums.ForEach(header =>
            {
                AddNewEmptyRow(frozen, nonFrozen);
                ColSpan(header, frozen, _frozenTable);
                ColSpan(header, nonFrozen, _nonFrozenTable);
            });
        }

        private void ColSpan(Header<T> sum, List<Header<T>> headers, HTMLTableElement table)
        {
            var tr = table.TBodies[0].LastElementChild as HTMLTableRowElement;
            tr.AddClass("summary");
            if (!headers.Contains(sum)) return;
            var colSpan = sum.SummaryColSpan;
            if (colSpan < 0) return;
            for (var i = 0; i < colSpan - 1; i++)
            {
                tr.Cells[1].Remove();
            }
            var cell = tr.Cells[1];
            if (cell is null) return;
            cell.ColSpan = (uint)sum.SummaryColSpan;
            cell.TextContent = sum.Summary;
            cell.AddClass("summary-header");
        }

        private void AddNewEmptyRow(List<Header<T>> frozen, List<Header<T>> nonFrozen)
        {
            var emptyRowData = (T)Activator.CreateInstance(typeof(T));
            emptyRowData[IdField] = -Math.Abs(emptyRowData.GetHashCode()); // Not to add this row into the submitted list
            emptyRowData[_emptyFlag] = true;
            Html.Take(_frozenTable.TBodies[0]);
            RenderEmptyRow(frozen, emptyRowData, _frozenSection);
            Html.Take(_nonFrozenTable.TBodies[0]);
            RenderEmptyRow(nonFrozen, emptyRowData, _mainSection);
        }

        private void SortHeaderByGroupName()
        {
            Headers.NewValue = Headers.Data
                .OrderByDescending(x => x.Frozen).ThenBy(x => x.Order)
                .ThenBy(x => x.GroupName).ToArray();
        }

        private async Task LoadMasterData()
        {
            var refEntities = Headers.Data.Where(x => x.Reference.HasAnyChar());
            var dataTask = refEntities
                .DistinctBy(x => x.Reference)
                .Select(FormatDataSource)
                .Select(x => Client<object>.Instance.GetListEntity(x.Reference, x.DataSourceOptimized));

            var refData = await Task.WhenAll(dataTask);
            _refData = refData.Select(x => x?.value);
        }

        protected virtual object[] GetUnderlayingRowData()
        {
            return RowData.Data.Cast<object>().ToArray();
        }

        private Header<T> FormatDataSource(Header<T> header)
        {
            var formattedDataSource = Utils.FormatWith(header.DataSource, Entity);
            var noFilterQuery = OdataExtensions.RemoveFilterQuery(formattedDataSource);
            var entityIds = Headers.Data
                .Where(x => x.Reference == header.Reference).SelectMany(GetEntityIds);
            var filterByIds = OdataExtensions.FilterByIds(noFilterQuery, entityIds);
            header.DataSourceOptimized = filterByIds;
            return header;
        }

        private EnumerableInstance<int?> GetEntityIds(Header<T> header)
        {
            return GetUnderlayingRowData()
                .Select(x => {
                    var val = x.GetComplexPropValue(header.FieldName)?.ToString();
                    if (val.IsNullOrEmpty()) return null;
                    var parsed = int.TryParse(val, out int res);
                    return parsed ? res : (int?)null;
                })
                .Where(x => x != null);
        }

        private void RenderTableHeader(List<Header<T>> headers)
        {
            bool hasGroup = headers.Any(x => !string.IsNullOrEmpty(x.GroupName));
            // Render first header
            Html.Instance.Thead.TRow.ForEach(headers, (header, index) =>
            {
                if (hasGroup && !string.IsNullOrEmpty(header.GroupName))
                {
                    if (header != headers.FirstOrDefault(x => x.GroupName == header.GroupName)) return;
                    Html.Instance.Th.Render();
                    Html.Instance.ColSpan(headers.Count(x => x.GroupName == header.GroupName));
                    Html.Instance.Text(header.GroupName).Render();
                    return;
                }
                Html.Instance.Th.DataAttr("grid-id", header.Id.ToString())
                    .DataAttr("field", header.FieldName).Width(header.Width)
                    .Style($"min-width: {header.MinWidth}; max-width: {header.MaxWidth}");
                if (hasGroup && string.IsNullOrEmpty(header.GroupName))
                {
                    Html.Instance.RowSpan(2);
                }
                if (!hasGroup && Headers.Data.Any(x => x.GroupName.HasAnyChar()))
                {
                    Html.Instance.ClassName("header-group");
                }
                if (header.StatusBar) Html.Instance.ClassName("status-cell").Icon("fa fa-edit").End.Render();
                if (header.ButtonEvent != null)
                {
                    Html.Instance.TextAlign(TextAlign.center).Icon("mif-folder-open").Margin(Direction.right, 0).End.Render();
                }
                else
                {
                    Html.Instance.Span.Text(header.HeaderText).End.Render();
                    if (header.HasFilter)
                    {
                        Html.Instance.Span.ClassName("fa fa-filter").Event(EventType.Click, async (e) =>
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
                Html.Instance.EndOf(ElementType.th);
            }).EndOf(ElementType.tr).Render();

            if (hasGroup)
            {
                Html.Instance.TRow.ForEach(headers, (header, index) =>
                {
                    if (hasGroup && !string.IsNullOrEmpty(header.GroupName))
                    {
                        Html.Instance.Th
                            .DataAttr("field", header.FieldName)
                            .DataAttr("grid-id", header.Id.ToString()).Width(header.Width)
                            .Style($"min-width: {header.MinWidth}; max-width: {header.MaxWidth}")
                            .Span.Text(header.HeaderText).EndOf(ElementType.th);
                    }
                });
            }
            Html.Instance.EndOf(ElementType.thead);
        }

        private void RenderTableContent(List<Header<T>> headers, Section section)
        {
            Html.Instance.TBody.ForEach(RowData.Data, (row, index) =>
            {
                RenderRowData(headers, row, section);
            });
        }

        private void RenderEmptyRow(List<Header<T>> headers, T emptyRowData, Section section)
        {
            RenderRowData(headers, emptyRowData, section);
        }

        public virtual void UpdateRow(T rowData)
        {
            var id = (int)rowData[IdField];
            var rowById = RowData.Data.FirstOrDefault(x => (int)x[IdField] == id);
            var index = Array.IndexOf(RowData.Data, rowById);
            rowById.CopyPropFrom(rowData);
            _frozenSection.Children[index]?.Update();
            _mainSection.Children[index]?.Update();
        }

        protected virtual void RenderRowData(List<Header<T>> headers, T row, Section section)
        {
            var rowSection = new TableRow(ElementType.tr) { Entity = row };
            section.AddChild(rowSection);
            var tr = Html.Context as HTMLTableRowElement;
            tr[_rowData] = row;
            if (!row.GetBool(_emptyFlag))
            {
                tr.AddEventListener(EventType.Click, ToggleSelectRow);
                tr.AddEventListener(EventType.MouseEnter, HoverRow);
                tr.AddEventListener(EventType.MouseLeave, LeaveRow);
                if (_tableParam.RowClick != null)
                {
                    tr.AddEventListener(EventType.Click, () =>
                    {
                        _tableParam.RowClick(row);
                    });
                }
                if (_tableParam.RowDblClick != null)
                {
                    tr.AddEventListener(EventType.DblClick, () => _tableParam.RowDblClick(row));
                }
            }
            Html.Instance.ForEach(headers, (Header<T> header, int headerIndex) => RenderTableCell(row, header, rowSection));
        }

        private void ToggleSelectRow(Event e)
        {
            if (_isFocusCell)
            {
                _isFocusCell = false;
                return;
            }
            var index = GetIndex(e);
            ToggleSelectRow(index, _frozenTable.TBodies[0]);
            ToggleSelectRow(index, _nonFrozenTable.TBodies[0]);
        }

        private void ToggleSelectRow(int index, bool forceSelect = false)
        {
            ToggleSelectRow(forceSelect, index, _frozenTable.TBodies[0]);
            ToggleSelectRow(forceSelect, index, _nonFrozenTable.TBodies[0]);
        }

        private static void ToggleSelectRow(int index, HTMLTableSectionElement body)
        {
            var tableRow = body.Rows[index];
            var rowData = tableRow[_rowData];
            if (!tableRow.ClassName.Contains(_selectedClass))
            {
                tableRow.AddClass(_selectedClass);
                rowData[_selectedFlag] = true;
            }
            else if (tableRow.ClassName.Contains(_selectedClass))
            {
                tableRow.ReplaceClass(_selectedClass, string.Empty);
                rowData[_selectedFlag] = false;
            }
            if (tableRow.ClassName.Contains(_hovering))
                tableRow.ReplaceClass(_hovering, string.Empty);
        }

        private static void ToggleSelectRow(bool forceSelect, int index, HTMLTableSectionElement body)
        {
            var tableRow = body.Rows[index];
            if (tableRow is null) return;
            var rowData = tableRow[_rowData];
            if (forceSelect)
            {
                tableRow.AddClass(_selectedClass);
                rowData[_selectedFlag] = true;
            }
            else
            {
                tableRow.ReplaceClass(_selectedClass, string.Empty);
                rowData[_selectedFlag] = false;
            }
            if (tableRow.ClassName.Contains(_hovering))
                tableRow.ReplaceClass(_hovering, string.Empty);
        }

        private void HoverRow(Event e)
        {
            var index = GetIndex(e);
            HoverRow(index, _frozenTable.TBodies[0]);
            HoverRow(index, _nonFrozenTable.TBodies[0]);
        }

        private static void HoverRow(int index, HTMLTableSectionElement body)
        {
            var tableRow = body.Rows[index];
            if (!tableRow.HasClass(_hovering))
                tableRow.AddClass(_hovering);
        }

        private void LeaveRow(Event e)
        {
            var index = GetIndex(e);
            LeaveRow(index, _frozenTable.TBodies[0]);
            LeaveRow(index, _nonFrozenTable.TBodies[0]);
        }

        protected int GetIndex(Event e)
        {
            var tableRow = Html.Take(e.Target as HTMLElement)
                .Closest(ElementType.tr).GetContext() as HTMLTableRowElement;
            var index = Array.IndexOf(_frozenTable.TBodies[0].Rows.ToArray(), tableRow);
            if (index < 0)
            {
                index = Array.IndexOf(_nonFrozenTable.TBodies[0].Rows.ToArray(), tableRow);
            }
            return index;
        }

        private static void LeaveRow(int index, HTMLTableSectionElement body)
        {
            var tableRow = body.Rows[index];
            if (tableRow.HasClass(_hovering))
                tableRow.ReplaceClass(_hovering, string.Empty);
        }

        private void RenderTableCell(T row, Header<T> header, Section rowSection)
        {
            var cell = new Section(ElementType.td) 
            {
                Name = header.FieldName,
                Entity = rowSection.Entity
            };
            rowSection.AddChild(cell);
            Html.Instance.Style($"width: {header.Width}; min-width: {header.MinWidth}; max-width: {header.MaxWidth};");
            if (header.StatusBar) Html.Instance.ClassName("status-cell").Icon("mif-pencil").End.Render();
            if (header.ButtonEvent != null)
            {
                RenderCellButton(row, header);
                return;
            }
            if (string.IsNullOrEmpty(header.FieldName)) return;
            if (!header.Editable)
            {
                var cellText = new CellText(header as Header<object>, _refData) { Entity = row };
                cell.AddChild(cellText);
            }
            else RenderEditableCell(header, cell);
            Html.Instance.EndOf(ElementType.td);
        }

        private static void RenderCellButton(T row, Header<T> header)
        {
            Html.Instance.Button.ClassName(header.ButtonClass)
                .Event(EventType.Click, header.ButtonEvent, row)
                .Span.ClassName(header.ButtonIcon).EndOf(ElementType.button);
        }

        private void RenderEditableCell(Header<T> header, Section cellSection)
        {
            if (!header.Editable) return;
            var cell = Html.Context as HTMLElement;
            var row = cell.ParentElement as HTMLElement;
            var rowData = (T)row[_rowData];
            var ui = new TMS.API.Models.Component
            {
                Reference = new Entity { Name = header.Reference },
                Format = header.FormatCell,
                DataSourceFilter = Utils.FormatWith(header.DataSource, Entity),
                FieldName = header.FieldName,
                Precision = header.Precision,
                Validation = header.Validation,
                PopulateField = header.PopulateField,
                CascadeField = header.CascadeField,
            };
            if (rowData.GetBool(_emptyFlag))
            {
                ui.Label = header.HeaderText;
            }
            Component editor = null;
            switch (header.Component)
            {
                case "Dropdown":
                    var source = _refData.GetSourceByTypeName(header.Reference);
                    var matched = source.FirstOrDefault(x => (int)x[IdField] == (int?)rowData?.GetComplexPropValue(ui.FieldName));
                    editor = new SearchEntry(ui)
                    {
                        RootHtmlElement = Html.Context,
                        Matched = matched,
                    };
                    break;
                default:
                    editor = ComponentFactory.GetComponent(ui, header.Component);
                    break;
            }
            editor.Id = header.Id;
            editor.Name = header.FieldName;
            editor.Entity = rowData;
            editor.ValueChanged += (arg) =>
            {
                var res = CellChanging?.Invoke(arg, header, rowData);
                if (res == false) return;
                if (rowData.GetBool(_emptyFlag))
                {
                    RowData.Add(rowData);
                    rowData[_emptyFlag] = false;
                    AddNewEmptyRow(Headers.Data.Where(x => x.Frozen).ToList(),
                        Headers.Data.Where(x => !x.Frozen).ToList());
                }
                CellChanged?.Invoke(arg, header, rowData);
            };
            cellSection.AddChild(editor);
            editor.InteractiveElement.AddEventListener(EventType.Focus, SelectRow);
        }

        private void SelectRow(Event e)
        {
            _isFocusCell = true;
            var row = Html.Take(e.Target as HTMLElement)
                .Closest(ElementType.tr).GetContext() as HTMLTableRowElement;
            var tbody = row.ParentElement as HTMLTableSectionElement;
            var index = Array.IndexOf(tbody.Rows.ToArray(), row);
            _nonFrozenTable.TBodies[0].Rows.ForEach(x => x.RemoveClass(_selectedClass));
            _frozenTable.TBodies[0].Rows.ForEach(x => x.RemoveClass(_selectedClass));
            _nonFrozenTable.TBodies[0].Rows[index].AddClass(_selectedClass);
            _frozenTable.TBodies[0].Rows[index].AddClass(_selectedClass);
            var rowData = row[_rowData];
            if (rowData != null)
            {
                rowData[_selectedFlag] = true;
            }
        }

        public void MoveUp()
        {
            if (SelectedRow is null || SelectedRow == 0)
            {
                SelectedRow = RowData.Data.Length - 1;
                ToggleSelectRow(0, false);
            }
            else if (SelectedRow > 0)
            {
                ToggleSelectRow(SelectedRow ?? -1, false);
                SelectedRow--;
            }
            ToggleSelectRow(SelectedRow ?? -1, true);
        }

        public void MoveDown()
        {
            if (SelectedRow is null || SelectedRow == RowData.Data.Length - 1)
            {
                SelectedRow = 0;
                ToggleSelectRow(RowData.Data.Length - 1, false);
            }
            else if (SelectedRow < RowData.Data.Length - 1)
            {
                ToggleSelectRow(SelectedRow ?? -1, false);
                SelectedRow++;
            }
            ToggleSelectRow(SelectedRow ?? -1, true);
        }

        public override void Dispose()
        {
            RowData.UnsubscribeAll();
            Headers.UnsubscribeAll();
            BodyContextMenu = null;
            CellChanging = null;
            CellChanged = null;
            base.Dispose();
        }
    }
}
