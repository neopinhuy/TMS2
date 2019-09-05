using System;
using System.Collections.Generic;
using Bridge;
using Components;
using MVVM;

namespace MisaOnline.NghiepVu.NganHang
{
    public class ThuTienKhachHang : Component
    {
        public override string ControlName { get; set; } = nameof(ThuTienGoi);
        public override string Title { get; set; } = "Thu tiền khách hàng";
        public List<SelectListItem> Currencies { get; set; }
        public ObservableArray<Header<object>> Headers { get; set; }
        public ObservableArray<object> Data { get; set; }

        public ThuTienKhachHang()
        {
            Currencies = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Việt Nam đồng" },
                new SelectListItem { Value = 2, Display = "Đô la Mỹ" },
            };

            Headers = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                new Header<object> { HeaderText = "TK nợ", FieldName = "TKNo" },
                new Header<object> { HeaderText = "TK có", FieldName = "TKCo" },
                new Header<object> { HeaderText = "Số tiền", FieldName = "SoTien" },
                new Header<object> { HeaderText = "Nghiệp vụ", FieldName = "NghiepVu" },
                new Header<object> { HeaderText = "Đối tượng", FieldName = "DoiTuong" },
                new Header<object> { HeaderText = "Tên đối tượng", FieldName = "TenDoiTuong" },
                new Header<object> { HeaderText = "Đơn vị", FieldName = "DonVi" },
                new Header<object> { HeaderText = "Công trình", FieldName = "CongTrinh" },
                new Header<object> { HeaderText = "Đơn đặt hàng", FieldName = "DonDatHang" },
                new Header<object> { HeaderText = "Hợp đồng bán", FieldName = "HopDongBan" },
                new Header<object> { HeaderText = "Mã thống kê", FieldName = "MaThongKe" },
            });

            Data = new ObservableArray<object>(new object[] {
                new {
                    DienGiai = "Thu tiền gởi", TKNo = "123 - Gởi tiền", TKCo = "874 - ddd", SoTien = "15.000.000",
                    NghiepVu = "Thu tiền khách hàng trả cọc", DoiTuong = "Nhân JS",
                    TenDoiTuong = "Nhân JS", DonVi = "Kế toán", CongTrinh = "Vin Homes", DonDatHang = "DH129389",
                    HopDongBan = "HDB989899", MaThongKe = "MTK9i8989"
                }
            });
            Data.AddRange(Data.Data); Data.AddRange(Data.Data);
            Data.AddRange(Data.Data);
        }

        public override void Render()
        {
            if (IsExisted())
                return;
            Html.Instance.H2.Text(Title).End.Render();
            Common.PhuongThucThanhToan(Currencies);
            ThongTinChung();
            HoachToan();
        }

        private void ThongTinChung()
        {
            Html.Instance
                .Grid().GridRow().ClassName("marginTop5").GridCell(12)
                .Panel()
                .Table.Style("width: 100%")
                    .TBody
                    .TRow
                        .TData.Text("Khách hàng").EndOf(ElementType.td)
                        .TData.SmallInput().Value("Nhân JS").EndOf(ElementType.td)
                        .TData.Text("Ngày thu tiền").EndOf(ElementType.td)
                        .TData.SmallDatePicker(DateTime.Now.ToString()).EndOf(ElementType.td)
                        .TData.Button("Lấy dữ liệu", "button info small", "fa fa-search").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Nhân viên bán hàng").EndOf(ElementType.td)
                        .TData.SmallInput("Lan Anh").EndOf(ElementType.td)
                        .TData.Text("Số tiền").EndOf(ElementType.td)
                        .TData.SmallInput("20.000.000").EndOf(ElementType.tr)
                .EndOf(".row").Render();
        }

        private void HoachToan()
        {
            Html.Instance.EndOf(".row").GridRow().GridCell(12).ClassName("marginTop5")
                .Table(Headers, Data)
                .EndOf(".panel").Render();
        }
    }
}
