using Bridge;
using Bridge.Html5;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ThuChi;
using Extensions;

namespace ESBootstrap
{
    public class Program
    {        
        public static void Main()
        {
            Html.Context = Document.GetElementById("_target_1");
            new DanhSachThuChi().Render();
        }
    }
}
