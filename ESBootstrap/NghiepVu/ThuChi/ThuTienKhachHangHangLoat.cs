using MVVM;
using System.Collections.Generic;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class ThuTienKhachHangHangLoat : ThuTienKhachHang
    {
        public override string Title { get; set; } = "Thu tiền khách hàng hàng loạt";
        public List<SelectListItem> Ranges { get; set; } = new List<SelectListItem>
        {
            new SelectListItem { Value = 1, Display = "Tháng trước" },
            new SelectListItem { Value = 2, Display = "Quý trước" },
            new SelectListItem { Value = 3, Display = "Năm trước" },
        };

        public ThuTienKhachHangHangLoat() : base()
        {
            
        }
    }
}