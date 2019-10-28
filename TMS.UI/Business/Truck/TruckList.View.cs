using Common.Clients;
using Components;
using Components.Extensions;
using MVVM;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.UI.Business.TruckManagement
{
    public partial class TruckList : TabComponent
    {
        public override async Task RenderAsync() {
            if (IsExisted()) return;
            _masterData = await MasterData.GetSingletonAsync();
            TruckHeader.Add(new Header<Truck>
            {
                EditEvent = EditTruck
            });
            var headers = _masterData.GetHeaders<Truck>();
            TruckHeader.AddRange(headers.ToArray());
            RenderMenuButton();
            // Load truck data
            var client = new Client<Truck>();
            var trucks = await client.GetList();
            TruckData.Data = trucks.ToArray();
            var tableParams = new TableParam<Truck> { Headers = TruckHeader, RowData = TruckData };
            Html.Instance.Table(tableParams);
        }

        private void RenderMenuButton()
        {
            Html.Instance.Table
                .TRow.TData.Button("New", "button info small", "fa fa-plus").EndOf(ElementType.td)
                .TRow.TData.Button("Delete", "button secondary small", "fa fa-trash").EndOf(ElementType.td)
                .TRow.TData.SmallSearchInput().EndOf(ElementType.td)
                .TData.Button("Search", icon: "fa fa-search").EndOf(ElementType.table).Render();
        }
    }
}
