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
            Html.Instance.Nav.Attr("data-role", "ribbonmenu")
                .Ul.ClassName("tabs-holder")
                    .Li.Anchor.Href("#section-thuChi").Text("Thu chi tiền").End.End
                    .Li.Anchor.Href("#section-kiemKe").Text("Kiểm kê").End.End
                    .Li.Anchor.Href("#section-soChiTienMat").Text("Sổ chi tiền mặt").End.End
                    .Li.Anchor.Href("#section-duBaoDongTien").Text("Dự báo dòng tiền").End.End
                .End
                .Div.ClassName("content-holder")
                .Div.ClassName("section").Id("section-thuChi")
                    .ThuChi()
                .End.End
            .End.Render(); // end of Nav
        }
    }
}
