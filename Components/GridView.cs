using Common.Clients;
using Components.Extensions;
using MVVM;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components
{
    public class GridView : Component
    {
        private readonly UserInterface _grid;
        public ObservableArray<Header<object>> Header { get; set; }
        public ObservableArray<object> RowData { get; set; }

        public GridView(UserInterface grid)
        {
            _grid = grid;
        }
        public override async Task RenderAsync()
        {
            var entityName = _grid.Field.Reference.Name;
            var gridPolicy = await Client<GridPolicy>.Instance.GetList($"$filter=Active eq true&Entity/Name={entityName}");
            var headers = gridPolicy.Select(x => new Header<object>
            {
                FieldName = x.Field?.FieldName ?? x.FieldName,
                Format = x.Format,
                GroupName = x.GroupName,
                HeaderText = x.ShortDesc,
                Description = x.Description,
                Reference = x.Reference?.Name,
                RefValueField = "Id",
                RefDisplayField = x.RefDisplayField,
                HasFilter = x.HasFilter,
                TextAlign = (TextAlign)x.TextAlign,
                EditEvent = async (obj) =>
                {
                    this.ExecuteEvent(x.EditEvent);
                },
            });
            //Header.AddRange(headers.ToArray());
            //var client = new Client<T>();
            //var rows = await client.GetList();
            //RowData.Data = rows.ToArray();
            //var tableParams = new TableParam<T> { Headers = Header, RowData = RowData };
            //Html.Instance.Table(tableParams);
        }
    }
}
