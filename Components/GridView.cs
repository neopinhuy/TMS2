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

namespace Components
{
    public class GridView : Component
    {
        private readonly UserInterface _ui;
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
            Parent.CurrentEntities.Add(RowData);
            Window.SetTimeout(async() =>
            {
                var entityName = _ui.Reference.Name;
                var gridPolicy = await Client<GridPolicy>.Instance
                    .GetList("$expand=Reference($select=Name)" +
                        "&orderby=Order" +
                        $"&$filter=Active eq true and Entity/Name eq '{entityName}' " +
                        $"and FeatureId eq {_ui.ComponentGroup.FeatureId}");
                foreach (var column in gridPolicy)
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
                        Frozen = column.Frozen
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
                var rows = await Client<object>.Instance.GetListEntity(entityName, _ui.DataSourceFilter);
                RowData.Data = rows.ToArray();
                _table = new Table<object>(tableParams);
                Html.Take(RootHtmlElement);
                _table.Render();
            });
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
                .Select(x => (int)x["Id"]).ToList();
            var client = new Client(entity);
            var success = await client.Delete(ids);
            if (success)
            {
                Toast.Success("Delete succeeded");
                RowData.Data = RowData.Data.Where(x => !ids.Contains((int)x["Id"])).ToArray();
            }
            else
            {
                Toast.Warning("Delete failed");
            }
        }
    }
}
