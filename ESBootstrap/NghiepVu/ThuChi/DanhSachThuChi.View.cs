using Components;
using MVVM;
using System;
using Direction = Components.Direction;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class DanhSachThuChi : Component
    {
        public override void Render()
        {
            if (IsExisted()) return;
            RenderSearch();
            RenderTables();
            ChiTiet();
        }

        private void RenderSearch()
        {
            Html.Instance.H2.Text(Title).End
                .Grid().GridRow().GridCell(7)
                .Panel("Thông tin chung").Margin(Direction.top, 10)
                .Form.Table.WidthPercentage(100)
                    .TBody.TRow
                        .TData.Text("Kỳ").End
                        .TData
                            .SmallDropDown(Ranges, SelectedRange, nameof(SelectListItem.Display), nameof(SelectListItem.Value))
                            .End
                        .End
                        .TData.Text("Từ").End
                        .TData.SmallDatePicker().Value(DateTime.Now.ToString()).End.End
                        .TData.Text("Đến").End
                        .TData.SmallDatePicker().Value(DateTime.Now.ToString()).End.End
                    .End.TRow
                        .TData.Text("Trạng thái").End
                        .TData
                            .Dropdown(States, SelectedState, nameof(SelectListItem.Display), nameof(SelectListItem.Value))
                            .Attr("data-role", "select").ClassName("input-small")
                            .End
                        .End
                        .TData.Text("Loại").End
                        .TData
                            .Dropdown(Types, SelectedType, nameof(SelectListItem.Display), nameof(SelectListItem.Value))
                            .Attr("data-role", "select").ClassName("input-small")
                            .End
                        .End
                        .TData.End
                        .TData.Button.ClassName("button small info").Text("Lấy dữ liệu").End.End
                .EndOf(".grid").Render(); // end of row
        }

        private void RenderTables()
        {
            Html.Instance.Margin(Direction.top, 10)
                .Table(ThuChiHeader, ThuChiData).EndOf(".panel").Render();
        }

        private static void ChiTiet()
        {
            Html.Instance.ClassName("marginTop5")
                .Table(new ObservableArray<Header<object>>(new Header<object>[] {
                    new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                    new Header<object> { HeaderText = "TK nợ", FieldName = "TKNo" },
                    new Header<object> { HeaderText = "TK có", FieldName = "TKCo" },
                    new Header<object> { HeaderText = "Số tiền", FieldName = "SoTien" },
                    new Header<object> { HeaderText = "Nghiệp vụ", FieldName = "NghiepVu" },
                    new Header<object> { HeaderText = "Đối tượng", FieldName = "DoiTuong" },
                    new Header<object> { HeaderText = "Tên đối tượng", FieldName = "TenDoiTuong" },
                    new Header<object> { HeaderText = "TK ngân hàng", FieldName = "TKNganHang" },
                    new Header<object> { HeaderText = "Đơn vị", FieldName = "DonVi" },
                    new Header<object> { HeaderText = "Công trình", FieldName = "CongTrinh" },
                    new Header<object> { HeaderText = "Hợp đồng bán", FieldName = "HopDongBan" },
                    new Header<object> { HeaderText = "Mã thống kê", FieldName = "MaThongKe" },
                }), new ObservableArray<object>(new object[] {
                    new
                    {
                        DienGiai = "Công nợ", TKNo = "111 - Nội tệ", TKCo = "112 - Công tác phí", SoTien = 10000000m,
                        NghiepVu = "N/A", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS",
                        TKNganHang = "97042564869", DonVi = "Kế toán", CongTrinh = "Đập thủy điện Hòa Bình",
                        HopDongBan = "HDB09233", MaThongKe = "TK0901229",
                    },
                    new
                    {
                        DienGiai = "Công nợ", TKNo = "111 - Nội tệ", TKCo = "112 - Công tác phí", SoTien = 10000000m,
                        NghiepVu = "N/A", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS",
                        TKNganHang = "97042564869", DonVi = "Kế toán", CongTrinh = "Đập thủy điện Hòa Bình",
                        HopDongBan = "HDB09233", MaThongKe = "TK0901229",
                    },
                    new
                    {
                        DienGiai = "Công nợ", TKNo = "111 - Nội tệ", TKCo = "112 - Công tác phí", SoTien = 10000000m,
                        NghiepVu = "N/A", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS",
                        TKNganHang = "97042564869", DonVi = "Kế toán", CongTrinh = "Đập thủy điện Hòa Bình",
                        HopDongBan = "HDB09233", MaThongKe = "TK0901229",
                    },
                    new
                    {
                        DienGiai = "Công nợ", TKNo = "111 - Nội tệ", TKCo = "112 - Công tác phí", SoTien = 10000000m,
                        NghiepVu = "N/A", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS",
                        TKNganHang = "97042564869", DonVi = "Kế toán", CongTrinh = "Đập thủy điện Hòa Bình",
                        HopDongBan = "HDB09233", MaThongKe = "TK0901229",
                    },
                    new
                    {
                        DienGiai = "Công nợ", TKNo = "111 - Nội tệ", TKCo = "112 - Công tác phí", SoTien = 10000000m,
                        NghiepVu = "N/A", DoiTuong = "Nhân JS", TenDoiTuong = "Nhân JS",
                        TKNganHang = "97042564869", DonVi = "Kế toán", CongTrinh = "Đập thủy điện Hòa Bình",
                        HopDongBan = "HDB09233", MaThongKe = "TK0901229",
                    },
                })).EndOf(".panel").Render();
        }
    }
}
