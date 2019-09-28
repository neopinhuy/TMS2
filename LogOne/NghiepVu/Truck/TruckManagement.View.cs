using Components;
using MVVM;

namespace LogOne.NghiepVu.Truck
{
    public partial class TruckManagement : Component
    {
        public override void Render()
        {
            Html.Instance.H2.Text(Title).End.Render();
        }
    }
}
