using Bridge.Html5;
using Components;
using MVVM;
using System;
using System.Collections.Generic;

namespace LogOne.NghiepVu.ThuChi
{
    public partial class KiemKe : Component
    {
        public override string Title { get; set; } = "Kết quả kiểm kê";
        public List<SelectListItem> Ranges { get; set; }
        public SelectListItem SelectedRange { get; set; }
        public List<SelectListItem> States { get; set; }
        public SelectListItem SelectedState { get; set; }
        public List<SelectListItem> Types { get; set; }
        public SelectListItem SelectedType { get; set; }
        public ObservableArray<Header<object>> KiemKeHeader { get; set; }
        public ObservableArray<object> KiemKeData { get; set; }
        public ObservableArray<Header<object>> ChiTietHeader { get; set; }
        public ObservableArray<object> ChiTietData { get; set; }

        public KiemKe()
        {
            Ranges = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Đầu tháng đến hiện tại" },
                new SelectListItem { Value = 2, Display = "Quý này" },
                new SelectListItem { Value = 3, Display = "Đầu quý đến hiện tại" },
                new SelectListItem { Value = 4, Display = "Năm nay" },
                new SelectListItem { Value = 5, Display = "Đầu năm đến hiện tại" },
                new SelectListItem { Value = 6, Display = "6 tháng đầu năm" },
                new SelectListItem { Value = 7, Display = "6 tháng cuối năm" },
                new SelectListItem { Value = 8, Display = "Tháng 1" },
                new SelectListItem { Value = 9, Display = "Tháng 2" },
                new SelectListItem { Value = 10, Display = "Tháng 3" },
                new SelectListItem { Value = 11, Display = "Tháng 4" },
                new SelectListItem { Value = 12, Display = "Tháng 5" },
                new SelectListItem { Value = 13, Display = "Tháng 6" },
                new SelectListItem { Value = 14, Display = "Tháng 7" },
                new SelectListItem { Value = 15, Display = "Tháng 8" },
                new SelectListItem { Value = 16, Display = "Tháng 9" },
                new SelectListItem { Value = 17, Display = "Tháng 10" },
                new SelectListItem { Value = 18, Display = "Tháng 11" },
                new SelectListItem { Value = 19, Display = "Tháng 12" },
                new SelectListItem { Value = 20, Display = "Quý 1" },
                new SelectListItem { Value = 21, Display = "Quý 2" },
                new SelectListItem { Value = 21, Display = "Quý 3" },
                new SelectListItem { Value = 22, Display = "Quý 4" },
            };
            SelectedRange = Ranges[0];
            States = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Đã ghi sổ" },
                new SelectListItem { Value = 2, Display = "Chưa ghi sổ" },
                new SelectListItem { Value = 3, Display = "Tất cả" },
            };
            SelectedState = States[2];

            Types = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Phiếu thu" },
                new SelectListItem { Value = 2, Display = "Phiếu chi" },
                new SelectListItem { Value = 3, Display = "Tất cả" },
            };
            SelectedType = Types[2];
            KiemKeHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Ngày", FieldName = "Ngay" },
                new Header<object> { HeaderText = "Giờ", FieldName = "Gio" },
                new Header<object> { HeaderText = "Số kiểm kê", FieldName = "SoKiemKe" },
                new Header<object> { HeaderText = "Kiểm kê đến ngày", FieldName = "KiemKeDenNgay" },
                new Header<object> { HeaderText = "Loại tiền", FieldName = "LoaiTien" },
                new Header<object> { HeaderText = "Mục đích", FieldName = "MucDich" },
                new Header<object> { HeaderText = "Kết luận", FieldName = "KetLuan" },
                new Header<object> { HeaderText = "Đã xử lý", FieldName = "DaXuLy" },
                new Header<object> {
                    EditButton = true,
                    EditEvent = async (x) => {
                        new KiemKeQuy().RenderAndFocus();
                    }
                },
            });
            KiemKeData = new ObservableArray<object>(new object[] {
                new
                {
                    Ngay = "20/08/2019", Gio = "10:12", SoKiemKe = "KKQ123l2", KiemKeDenNgay = "20/07/2019",
                    LoaiTien = "VNĐ", MucDich = "Tại sao nhiều tiền vậy", KetLuan = "Lợi nhuận cao", DaXuLy = "Nộp về NH"
                },
            });
            KiemKeData.AddRange(KiemKeData.Data);
            KiemKeData.AddRange(KiemKeData.Data);
            KiemKeData.AddRange(KiemKeData.Data);

            ChiTietHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Mệnh giá", FieldName = "MenhGia" },
                new Header<object> { HeaderText = "Số lượng (tờ)", FieldName = "SoLuongTo" },
                new Header<object> { HeaderText = "Số tiền", FieldName = "SoTien" },
                new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
            });
            ChiTietData = new ObservableArray<object>(new object[] {
                new
                {
                    MenhGia = "500.000", SoLuongTo = "1000", SoTien = "5.000.000", DienGiai = "",
                },
            });
            ChiTietData.AddRange(ChiTietData.Data);
            ChiTietData.AddRange(ChiTietData.Data);
            ChiTietData.AddRange(ChiTietData.Data);
        }
    }
}
