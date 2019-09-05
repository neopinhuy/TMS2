using System;
using System.Collections.Generic;
using Bridge;
using Components;
using MVVM;
using Newtonsoft.Json;

namespace MisaOnline.NghiepVu.NganHang
{
    public class ThuTienGoi : Component
    {
        public override string ControlName { get; set; } = nameof(ThuTienGoi);
        public override string Title { get; set; } = "Thu tiền gởi";
        public List<SelectListItem> DepositReason { get; set; }
        public SelectListItem SelectedDepositReason { get; set; }
        public ObservableArray<Header<object>> Headers { get; set; }
        public ObservableArray<object> Data { get; set; }

        public ThuTienGoi()
        {
            DepositReason = new List<SelectListItem>
            {
                new SelectListItem { Value = 1, Display = "Rút tiền gởi về nộp quỹ" },
                new SelectListItem { Value = 2, Display = "Thu hoàn thuế GTGT" },
                new SelectListItem { Value = 3, Display = "Thu hoàn ứng" },
                new SelectListItem { Value = 4, Display = "Thu khác" },
            };
            SelectedDepositReason = DepositReason[0];

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
            ThongTinChung();
            Common.ChungTu.Render();
            HoachToan();
        }

        private void ThongTinChung()
        {
            Html.Instance.H2.Text(Title).End
                .Grid().GridRow().ClassName("marginTop5").GridCell(8)
                .Panel("Thông tin chung")
                .Table.Style("width: 100%")
                    .TBody
                    .TRow
                        .TData.Text("Đối tượng").EndOf(ElementType.td)
                        .TData.SmallInput().Value("Nhân JS").EndOf(ElementType.td)
                        .TData.SmallInput().Value("Nhân JS").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Địa chỉ").EndOf(ElementType.td)
                        .TData.ColSpan(2).SmallInput().Value("387A Lê Văn Khương").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Nộp vào TK").EndOf(ElementType.td)
                        .TData.SmallInput().Value("00057898").EndOf(ElementType.td)
                        .TData.SmallInput().Value("Lan Anh").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Lý do thu").EndOf(ElementType.td)
                        .TData.SmallDropDown(DepositReason, SelectedDepositReason, "Display", "Value").EndOf(ElementType.td)
                        .TData.SmallInput().PlaceHolder("Thu từ...").EndOf(ElementType.tr)
                    .TRow
                        .TData.Text("Tham chiếu").EndOf(ElementType.td)
                        .TData.ColSpan(2).Button.ClassName("button info small").Span.ClassName("fa fa-search")
                .EndOf(".cell").Render();
        }

        private void HoachToan()
        {
            Html.Instance.EndOf(".row").GridRow().GridCell(12).ClassName("marginTop5")
                .Table(Headers, Data)
                .EndOf(".panel").Render();
        }
    }
}
