using Components;
using MVVM;
using System;
using Direction = Components.Direction;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class KiemKe : Component
    {
        public override void Render()
        {
            if (IsExisted()) return;
            RenderTables();
            RenderChiTiet();
        }

        private void RenderTables()
        {
            Html.Instance.Margin(Direction.top, 1, "rem")
                .H2.Text(Title).End
                .Table(KiemKeHeader, KiemKeData).Render();
        }

        private void RenderChiTiet()
        {
            Html.Instance.Div.MarginRem(Direction.top, 1)
                .Table(ChiTietHeader, ChiTietData).Render();
        }
    }
}
