using System.Threading.Tasks;
using Components;

namespace TMS.UI.Business.TruckManagement
{
    public partial class TruckDetail : TabComponent
    {
        public override string Title { get; set; } = "Truck Detail";

        public override async Task RenderAsync()
        {
            if (IsExisted()) return;
        }
    }
}
