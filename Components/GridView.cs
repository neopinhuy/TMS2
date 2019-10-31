using Common.Clients;
using Components.Extensions;
using MVVM;
using System.Linq;
using System.Threading.Tasks;

namespace Components
{
    public class GridView<T> : Component
    {
        private string _refEntity;
        public ObservableArray<Header<object>> Header { get; set; }
        public ObservableArray<object> RowData { get; set; }

        public GridView(string refEntity)
        {
            _refEntity = refEntity;
        }
        public override async Task RenderAsync()
        {
            var headers = _masterData.GetHeaders<T>();
            //Header.AddRange(headers.ToArray());
            //var client = new Client<T>();
            //var rows = await client.GetList();
            //RowData.Data = rows.ToArray();
            //var tableParams = new TableParam<T> { Headers = Header, RowData = RowData };
            //Html.Instance.Table(tableParams);
        }
    }
}
