using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using Components.Forms;
using MVVM;
using Newtonsoft.Json;
using System.Collections.Generic;
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
                var gridPolicy = await Client<GridPolicy>.Instance
                    .GetList("?$expand=Reference($select=Name)" +
                        "&orderby=Order" +
                        $"&$filter=Active eq true and Entity/Name eq '{_ui.Reference.Name}' " +
                        $"and FeatureId eq {_ui.ComponentGroup.FeatureId}");
                foreach (var column in gridPolicy.Value)
                {
                    var header = new Header<object>
                    {
                        FieldName = column.FieldName,
                        Format = column.Format,
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
                    };
                    var parsed = System.Enum.TryParse(column.TextAlign, out TextAlign textAlign);
                    if (parsed) header.TextAlign = textAlign;
                    Header.Add(header);
                }
                Html.Take(RootHtmlElement);
                var tableParams = new TableParam<object> { Headers = Header, RowData = RowData };
                if (_ui.Events.HasAnyChar())
                {
                    var events = JsonConvert.DeserializeObject<object>(_ui.Events);
                    var dblClick = events[EventType.DblClick.ToString()]?.ToString();
                    if (dblClick.HasAnyChar())
                    {
                        Html.Instance.DataAttr("dblclick", dblClick);
                        tableParams.RowDblClick = row =>
                        {
                            RootComponent.ExecuteEvent(dblClick, row, RowData, Header);
                        };
                    }
                }
                if (Entity != null && _ui.DataSourceFilter.HasAnyChar())
                {
                    _ui.DataSourceFilter = Utils.FormatWith(_ui.DataSourceFilter, Entity);
                }
                await LoadData();
                _table = new Table<object>(tableParams)
                {
                    Entity = Entity
                };
                _table.BodyContextMenu += RenderContextMenu;
                Html.Take(RootHtmlElement);
                _table.Render();
            });
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

        //public async Task LoadData(string dataSource = null)
        //{
        //    var rows = await Client<object>.Instance.GetListEntity(_ui.Reference.Name, dataSource ?? _ui.DataSourceFilter)
        //        ?? new List<object>();
        //    RowData.Data = rows.ToArray();
        //    if (Entity != null) Entity[_ui.FieldName] = RowData.Data;
        //}

        public virtual async Task LoadData(string dataSource = null)
        {
            dataSource = dataSource ?? _ui.DataSourceFilter;
            var pagingQuery = dataSource + $"&$skip={_pageIndex * _ui.Row}&$top={_ui.Row}&$count=true";
            var result = await Client<object>.Instance.GetListEntity(_ui.Reference.Name, dataSource ?? pagingQuery);
            if (result == null) return;
            _total = result.Odata?.Count ?? 0;
            RowData.Data = result.Value?.ToArray();
            if (Entity != null) Entity[_ui.FieldName] = RowData.Data;
        }

        public void DeleteSelected()
        {
            var confirm = new ConfirmDialog();
            confirm.Render();
            confirm.DeleteConfirmed += async () =>
            {
                confirm.Dispose();
                await DeleteConfirmed();
            };
        }

        public virtual async Task DeleteConfirmed()
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
                LoadData();
            }
            else
            {
                Toast.Warning("Delete failed");
            }
        }
    }
}
