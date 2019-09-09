using Components;
using MVVM;
using System;
using Direction = Components.Direction;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class SoChiTienMat : Component
    {
        public override void Render()
        {
            if (IsExisted()) return;
            RenderHeader();
            RenderTables();
        }

        private void RenderHeader()
        {
            Html.Instance.Div.MarginRem(Direction.top, 1)
                .Button("Chọn tham số...").End
                .H2.Text("SỔ KẾ TOÁN CHI TIẾT QUỸ TIỀN MẶT").End.Render();
        }

        private void RenderTables()
        {
            Html.Instance
                .Table(SoChiTienMatHeader, SoChiTienMatData).MarginRem(Direction.top, 1);
        }
    }
}
