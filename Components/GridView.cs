using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using Components.Forms;
using MVVM;
using Newtonsoft.Json;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;
using ElementType = MVVM.ElementType;

namespace Components
{
    public class GridView : Component
    {
        private readonly UserInterface _ui;
        private int _pageIndex = 0;
        private int _total = 0;
        private Table<object> _table;
        private HTMLElement _paginator;
        public ObservableArray<Header<object>> Header { get; set; }
        public ObservableArray<object> RowData { get; set; }

        public GridView(UserInterface ui)
        {
            _ui = ui;
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
            Window.SetTimeout(async() =>
            {
                var gridPolicyTask = Client<GridPolicy>.Instance
                    .GetList("?$expand=Reference($select=Name)" +
                        "&orderby=Order" +
                        $"&$filter=Active eq true and Entity/Name eq '{_ui.Reference.Name}' " +
                        $"and FeatureId eq {_ui.ComponentGroup.FeatureId}");
                var loadDataTask = ReloadData();
                await Task.WhenAll(gridPolicyTask, loadDataTask);
                Header.AddRange(gridPolicyTask.Result.Value.Select(MapToHeader).ToArray());
                RenderTable();
                Pagination();
            });
        }

        public void RenderTable()
        {
            var tableParams = new TableParam<object> 
            {
                Headers = Header, RowData = RowData,
                GroupBy = _ui.GroupBy, GroupFormat = _ui.GroupFormat,
            };
            BindingEvents(tableParams);
            _table = _ui.GroupFormat.HasAnyChar()
                ? new GroupTable(tableParams)
                : new Table<object>(tableParams);
            _table.Entity = Entity;
            _table.BodyContextMenu += RenderContextMenu;
            Html.Take(RootHtmlElement).Clear();
            _table.Render();
        }

        private void BindingEvents(TableParam<object> tableParams)
        {
            if (!_ui.Events.HasAnyChar()) return;
            var events = JsonConvert.DeserializeObject<object>(_ui.Events);
            var dblClick = events[EventType.DblClick.ToString()]?.ToString();
            if (dblClick.HasAnyChar())
            {
                Html.Instance.DataAttr("dblclick", dblClick);
                tableParams.RowDblClick = row =>
                {
                    var parent = Parent;
                    while (parent != null && parent[dblClick] == null)
                    {
                        parent = parent.Parent;
                    }
                    parent.ExecuteEvent(dblClick, row, RowData, Header);
                };
            }
        }

        private Header<object> MapToHeader(GridPolicy column)
        {
            var header = new Header<object>
            {
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
            };
            var parsed = System.Enum.TryParse(column.TextAlign, out TextAlign textAlign);
            if (parsed) header.TextAlign = textAlign;
            return header;
        }

        public void RenderContextMenu(Event e)
        {
            e.PreventDefault();
            var top = (float)e["clientY"];
            var left = (float)e["clientX"];
            Html.Take(Document.Body).Ul.ClassName("context-menu")
                .TabIndex(-1).Trigger(EventType.Focus).Floating(top, left);
            var menu = Html.Context;
            Html.Instance.Event(EventType.FocusOut, () => menu.Remove())
                .Li.Event(EventType.Click, DeleteSelected)
                .Icon("fa fa-trash").End.Span.Text("Delete selected rows").EndOf(ElementType.li);
        }
        
        public virtual async Task ReloadData(string dataSource = null)
        {
            var formatted = Utils.FormatWith(_ui.DataSourceFilter, Entity);
            dataSource = dataSource ?? formatted;
            var pagingQuery = dataSource + $"&$skip={_pageIndex * _ui.Row}&$top={_ui.Row}&$count=true";
            var result = await Client<object>.Instance.GetListEntity(_ui.Reference.Name,
                _ui.Row > 0 ? pagingQuery : dataSource);
            if (result == null) return;
            _total = result.Odata?.Count ?? 0;
            UpdatePagination();
            RowData.Data = result.Value?.ToArray();
            if (Entity != null) Entity[_ui.FieldName] = RowData.Data;
        }

        private void UpdatePagination()
        {
            if (_ui.Row is null || _ui.Row == 0) return;
            if (_paginator is null) return;
            Html.Take(_paginator).Pagination("updateItems", _total);
        }

        private void Pagination()
        {
            if (_ui.Row is null || _ui.Row == 0) return;
            // Render paginator here
            if (_paginator is null)
            {
                Html.Take(RootHtmlElement).Ul.ClassName("pagination");
                _paginator = Html.Context as HTMLElement;
            }
            Html.Take(_paginator).Pagination(_total, _ui.Row ?? 0, (page, e) =>
            {
                (e["preventDefault"] as System.Action)();
                _pageIndex = page - 1;
                ReloadData();
            });
        }

        public void DeleteSelected()
        {
            var confirm = new ConfirmDialog();
            confirm.Render();
            confirm.DeleteConfirmed += async () =>
            {
                confirm.Dispose();
                await Delete();
            };
        }

        public virtual async Task Delete()
        {
            var entity = _ui.Reference.Name;
            var ids = RowData.Data
                .Where(x => (bool?)x["__selected__"] == true)
                .Select(x => (int)x[Id]).ToList();
            var client = new Client(entity);
            var success = await client.Delete(ids);
            if (success)
            {
                Toast.Success("Delete succeeded");
                RowData.Data.Where(x => (bool?)x["__selected__"] == true).ForEach(RowData.Remove);
                ReloadData();
            }
            else
            {
                Toast.Warning("Delete failed");
            }
        }
    }
}
