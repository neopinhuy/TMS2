using Bridge;
using Bridge.Html5;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MisaOnline.ThuChi;

namespace ESBootstrap
{
    public static class Program
    {
        public static void Main()
        {
            Html.Context = Document.GetElementById("thuChiTien");
            new DanhSachThuChi().Render();
        }
    }
}
