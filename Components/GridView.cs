using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using Components.Forms;
using MVVM;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components
{
    public class CellChangeEvent
    {
        public ObservableArgs Args;
        public Header<object> Header;
        public object Row;
        public IEnumerable<object> FlatternRowData;
        public ObservableArray<object> ObservableRowData;
    }

    public class GridView : Component
    {
        public readonly TMS.API.Models.Component UI;
        public string FormattedDataSource => Utils.FormatWith(UI.DataSourceFilter, Entity, true);
        private string _lastDataSource;
        private int _pageIndex = 0;
        private int _total = 0;
        private Table<object> _table;
        private HTMLElement _paginator;
        private ContextMenu _contextMenu;
        public ObservableArray<Header<object>> Header { get; set; }
        public ObservableArray<object> RowData { get; set; }
        public Action<CellChangeEvent> CellChanged { get; set; }
        private static object[] _copiedRows;
        private const string selectedFlag = "__selected__";

        public GridView(TMS.API.Models.Component ui)
        {
            UI = ui ?? throw new ArgumentNullException(nameof(ui));
            Id = ui.Id;
            Name = ui.FieldName;
            Header = new ObservableArray<Header<object>>();
            RowData = new ObservableArray<object>();
            Header.Add(new Header<object>
            {
                StatusBar = true,
                HeaderText = "",
                Frozen = true
            });
        }

        public override void Render()
        {
            Html.Instance.DataAttr("name", UI.FieldName);
            Task.Run(async () =>
            {
                var gridPolicyTask = LoadGridPolicy();
                var loadDataTask = ReloadData();
                await Task.WhenAll(gridPolicyTask, loadDataTask);
                if (gridPolicyTask is null || gridPolicyTask.Result is null)
                {
                    throw new InvalidOperationException($"Can not load header for the GridView {UI.Reference.Name}");
                }
                var headers = gridPolicyTask.Result.value
                    .Where(x => !x.Hidden).Select(MapToHeader).ToArray();
                Header.AddRange(headers);
                RenderTable();
                Pagination();
            });
        }

        private Task<OdataResult<GridPolicy>> LoadGridPolicy()
        {
            return Client<GridPolicy>.Instance
                    .GetList("?$expand=Reference($select=Name)" +
                    "&orderby=Order" +
                    $"&$filter=Active eq true and Entity/Name eq '{UI.Reference.Name}' " +
                    $"and FeatureId eq {UI.ComponentGroup.FeatureId}");
        }

        public void RenderTable()
        {
            var tableParams = new TableParam<object>
            {
                Headers = Header,
                RowData = RowData,
                GroupBy = UI.GroupBy,
                GroupFormat = UI.GroupFormat,
            };
            BindingEvents(tableParams);
            _table = IsGroupTable ? new GroupTable(tableParams) : new Table<object>(tableParams);
            _table.Entity = Entity;
            _table.BodyContextMenu += RenderContextMenu;
            Html.Take(RootHtmlElement).Clear();
            _table.CellChanged = (arg, header, data) =>
            {
                var rows = _table.GetFlatternRowData();
                if (IsGroupTable)
                {
                    Entity.SetComplexPropValue(UI.FieldName, rows);
                }
                var e = new CellChangeEvent { Args = arg, Header = header, Row = data, FlatternRowData = rows, ObservableRowData = RowData };
                var events = JsonConvert.DeserializeObject<object>(UI.Events);
                var cellChanged = events?["cellChanged"]?.ToString();
                if (cellChanged.HasAnyChar())
                {
                    var parent = FindComponentEvent(cellChanged);
                    parent.ExecuteEvent(cellChanged, e);
                }
                CellChanged?.Invoke(e);
            };
            AddChild(_table);
            _table.AfterRendered += () => AfterRendered?.Invoke();
        }

        public virtual object[] FlatternRowData => _table.GetFlatternRowData();

        private bool IsGroupTable => UI.GroupFormat.HasAnyChar() || UI.GroupBy.HasAnyChar();

        private void BindingEvents(TableParam<object> tableParams)
        {
            if (!UI.Events.HasAnyChar()) return;
            var events = JsonConvert.DeserializeObject<object>(UI.Events);
            Html.Instance.DataAttr("events", UI.Events);
            var dblClick = events[EventType.DblClick.ToString()]?.ToString();
            if (dblClick.HasAnyChar())
            {
                Html.Instance.DataAttr(EventType.DblClick.ToString(), dblClick);
                tableParams.RowDblClick = row =>
                {
                    var parent = FindComponentEvent(dblClick);
                    parent.ExecuteEvent(dblClick, row, RowData, Header);
                };
            }
            var click = events[EventType.Click.ToString()]?.ToString();
            if (click.HasAnyChar())
            {
                Html.Instance.DataAttr(EventType.Click.ToString(), click);
                tableParams.RowClick = row =>
                {
                    var parent = FindComponentEvent(click);
                    parent.ExecuteEvent(click, row, RowData, Header);
                };
            }
        }

        private Header<object> MapToHeader(GridPolicy column)
        {
            var header = new Header<object>
            {
                Id = column.Id,
                FieldName = column.FieldName,
                FormatCell = column.FormatCell,
                FormatRow = column.FormatRow,
                Order = column.Order,
                GroupName = column.GroupName,
                HeaderText = column.ShortDesc,
                Description = column.Description,
                Reference = column.Reference?.Name,
                DataSource = column.DataSource,
                RefValueField = "Id",
                HasFilter = column.HasFilter,
                Frozen = column.Frozen,
                Editable = column.Editable,
                Disabled = column.Disabled,
                Component = column.Component,
                Precision = column.Precision,
                Validation = column.Validation,
                Width = column.Width,
                MinWidth = column.MinWidth,
                MaxWidth = column.MaxWidth,
                ButtonClass = column.ButtonClass,
                ButtonIcon = column.ButtonIcon,
                PopulateField = column.PopulateField,
                CascadeField = column.CascadeField,
                Summary = column.Summary,
                SummaryColSpan = column.SummaryColSpan,
            };
            if (column.ButtonEvent.HasAnyChar())
            {
                header.ButtonEvent = (row) =>
                {
                    var parent = FindComponentEvent(column.ButtonEvent);
                    parent.ExecuteEvent(column.ButtonEvent, row);
                };
            }
            var parsed = Enum.TryParse(column.TextAlign, out TextAlign textAlign);
            if (parsed) header.TextAlign = textAlign;
            return header;
        }

        public void RenderContextMenu(Event e)
        {
            e.PreventDefault();
            var top = (float)e["clientY"];
            var left = (float)e["clientX"];
            _contextMenu = new ContextMenu
            {
                Top = top,
                Left = left,
                ContextMenuItems = new List<ContextMenuItem>
                {
                    new ContextMenuItem { Icon = "fa fa-copy", Text = "Copy", Click = CopySelected },
                    new ContextMenuItem { Icon = "fa fa-paste", Text = "Paste", Click = PasteSelected },
                    new ContextMenuItem { Icon = "fa fa-clone", Text = "Duplicate selected rows", Click = DuplicateSelected },
                    new ContextMenuItem { Icon = "fa fa-trash", Text = "Delete selected rows", Click = DeleteSelected },
                }
            };
            AddChild(_contextMenu);
        }

        private void CopySelected(object ev)
        {
            var rows = GetSelectedRows()?.ToArray();
            if (rows.Nothing()) return;
            rows = rows.Select(x => x.Copy()).ToArray();
            rows.ForEach(x =>
            {
                x[selectedFlag] = false;
                x[IdField] = 0;
            });
            _copiedRows = rows;
        }

        private void PasteSelected(object ev)
        {
            if (_copiedRows.Nothing()) return;
            RowData.AddRange(_copiedRows);
            ClearSelected();
        }

        private void ClearSelected()
        {
            GetSelectedRows().ToList().ForEach(x => x[selectedFlag] = false);
        }

        private void DuplicateSelected(object ev)
        {
            var rows = GetSelectedRows()?.ToArray();
            if (rows.Nothing()) return;
            rows = rows.Select(x => x.Copy()).ToArray();
            rows.ForEach(x =>
            {
                x[selectedFlag] = false;
                x[IdField] = 0; 
            });
            RowData.AddRange(rows);
            ClearSelected();
        }

        public void UpdateRow(object row) => _table.UpdateRow(row);

        public virtual async Task ReloadData(string dataSource = null)
        {
            _lastDataSource = dataSource ?? _lastDataSource ?? FormattedDataSource;
            var pagingQuery = _lastDataSource + $"&$skip={_pageIndex * UI.Row}&$top={UI.Row}&$count=true";
            var result = await Client<object>.Instance.GetListEntity(UI.Reference.Name,
                UI.Row > 0 ? pagingQuery : _lastDataSource);
            if (result == null)
            {
                throw new InvalidOperationException($"Cannot load data for the GridView {UI.Reference.Name}");
            }
            _total = result.odata?.count ?? 0;
            UpdatePagination();
            RowData.Data = result.value?.ToArray();
            if (Entity != null) Entity.SetComplexPropValue(UI.FieldName, RowData.Data);
            if (result.odata?.count > 0 && result.value.Nothing())
            {
                _pageIndex = 0;
                ReloadData(dataSource);
            }
        }

        private void UpdatePagination()
        {
            if (UI.Row is null || UI.Row == 0) return;
            if (_paginator is null) return;
            Html.Take(_paginator).Pagination("updateItems", _total);
        }

        private void Pagination()
        {
            if (UI.Row is null || UI.Row == 0) return;
            if (_paginator is null)
            {
                Html.Take(RootHtmlElement).Ul.ClassName("pagination");
                _paginator = Html.Context as HTMLElement;
            }
            Html.Take(_paginator).Pagination(_total, UI.Row ?? 0, (page, e) =>
            {
                (e["preventDefault"] as System.Action)();
                _pageIndex = page - 1;
                ReloadData();
            });
        }

        public void DeleteSelected(object ev = null)
        {
            var confirm = new ConfirmDialog();
            confirm.Render();
            confirm.YesConfirmed += async () =>
            {
                confirm.Dispose();
                await Delete();
            };
        }

        public virtual async Task Delete()
        {
            var entity = UI.Reference.Name;
            var ids = GetSelectedRows()
                .Select(x => (int)x[IdField]).ToList();
            var client = new Client(entity);
            var success = await client.DeleteAsync(ids);
            if (success)
            {
                Toast.Success("Delete succeeded");
                GetSelectedRows().ForEach(RowData.Remove);
                ReloadData();
            }
            else
            {
                Toast.Warning("Delete failed");
            }
        }

        public IEnumerable<object> GetSelectedRows()
        {
            return RowData.Data.Where(x => (bool?)x[selectedFlag] == true);
        }

        public override void UpdateView()
        {
            ReloadData();
        }
    }
}
