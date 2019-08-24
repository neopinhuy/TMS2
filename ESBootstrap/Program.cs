using Bridge.Html5;
using MVVM;
using MisaOnline.NghiepVu.ThuChi;

namespace ESBootstrap
{
    public class Program
    {
        public static void Main()
        {
            Html.Context = Document.GetElementById("thuChiTien");
            new DanhSachThuChi().Render();
        }
    }
}
