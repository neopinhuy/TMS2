using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using Components.Extensions;
using MVVM;
using Newtonsoft.Json;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components
{
    public class GridView : Component
    {
        private readonly UserInterface _ui;
        public ObservableArray<Header<object>> Header { get; set; }
        public ObservableArray<object> RowData { get; set; }

        public GridView(UserInterface ui)
        {
            _ui = ui;
            Header = new ObservableArray<Header<object>>();
            RowData = new ObservableArray<object>();
            Header.Add(new Header<object>
            {
                StatusBar = true,
                HeaderText = "",
                Frozen = true
            });
        }

        public override async Task RenderAsync()
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
                    RefDisplayField = column.RefDisplayField,
                    HasFilter = column.HasFilter,
                    Frozen = column.Frozen
                };
                var parsed = System.Enum.TryParse(column.TextAlign, out TextAlign textAlign);
                if (parsed) header.TextAlign = textAlign;
                Header.Add(header);
            }
            var tableParams = new TableParam<object> { Headers = Header, RowData = RowData };
            if (_ui.Events.HasAnyChar())
            {
                var events = JsonConvert.DeserializeObject<object>(_ui.Events);
                var dblClick = events[EventType.DblClick.ToString()]?.ToString();
                tableParams.RowDblClick = row =>
                {
                    RootComponent.ExecuteEvent(dblClick, row, RowData, Header);
                };
            }
            var rows = await Client<object>.Instance.GetListEntity(entityName, _ui.DataSourceFilter);
            RowData.Data = rows.ToArray();
            var table = new Table<object>(tableParams);
            Html.Take(RootHtmlElement);
            table.RenderAsync();
        }
    }
}
