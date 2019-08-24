using Bridge.Html5;
using MVVM;
using MisaOnline.NghiepVu.ThuChi;
using MisaOnline.NghiepVu.Kho;
using Components;

namespace ESBootstrap
{
    public class Program
    {
        public static void Main()
        {
            var thuChi = new DanhSachThuChi();
            thuChi.Render();
            new NhapXuatKho().Render();
            thuChi.Focus();
        }
    }
}
