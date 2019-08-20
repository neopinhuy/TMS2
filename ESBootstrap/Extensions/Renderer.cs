using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ThuChi;

namespace Extensions
{
    public static class Renderer
    {
        public static Html ThuChi(this Html html)
        {
            var thuChi = new DanhSachThuChi();
            thuChi.Render();
            return html;
        }
    }
}
