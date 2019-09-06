using Components;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.Kho
{
    public partial class NhapXuatKho : Component
    {
        public override void Render()
        {
            if (IsExisted())
            {
                return;
            }

            RenderSearch();
            RenderTables();
            ChiTiet();
        }

        private void RenderSearch()
        {
            Html.Instance
                .Div.ClassName("grid").Div.ClassName("row marginTop5")
                .Div.ClassName("cell-md-9 cell-lg-9 cell-xl-9")
                .Panel()
                .Form.Table.ClassName("subcompact")
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
                .EndOf(".row").Render(); // end of row
        }

        private static void RenderTables()
        {
            Html.Instance.Div.ClassName("row marginTop5")
                .Div.ClassName("cell cell-md-9 cell-lg-9 cell-xl-9")
                .Panel()
                .Table(new ObservableArray<Header<object>>(new Header<object>[] {
                    new Header<object> { HeaderText = "Ngày hạch toán", FieldName = "NgayHachToan" },
                    new Header<object> { HeaderText = "Ngày chứng từ", FieldName = "NgayChungTu" },
                    new Header<object> { HeaderText = "Số chứng từ", FieldName = "SoChungTu" },
                    new Header<object> { HeaderText = "Diễn giải", FieldName = "DienGiai" },
                    new Header<object> { HeaderText = "Tổng tiền", FieldName = "TongTien" },
                    new Header<object> { HeaderText = "Người giao nhận", FieldName = "NguoiGiaoNhan" },
                    new Header<object> { HeaderText = "Đối tượng", FieldName = "DoiTuong" },
                    new Header<object> { HeaderText = "Đã lập CT bán hàng", FieldName = "DaLapCTBanHang" },
                    new Header<object> { HeaderText = "Ngày ghi sổ kho", FieldName = "NgayGhiSoKho" },
                    new Header<object> { HeaderText = "Loại chứng từ", FieldName = "LoaiChungTu" },
                    new Header<object> {
                        EditButton = true,
                    },
                }), new ObservableArray<object>(new object[] {
                    new
                    {
                        NgayHachToan = "20/08/2019", NgayChungTu = "20/08/2019", SoChungTu = "CT00001", DienGiai = "Chug tu 000001",
                        TongTien = "100.000.000", NguoiGiaoNhan = "Lan Anh", DoiTuong = "Nhân JS", DaLapCTBanHang = false,
                        NgayGhiSoKho = "20/08/2019", LoaiChungTu = "Công nợ"
                    },
                    new
                    {
                        NgayHachToan = "20/08/2019", NgayChungTu = "20/08/2019", SoChungTu = "CT00001", DienGiai = "Chug tu 000001",
                        TongTien = "100.000.000", NguoiGiaoNhan = "Lan Anh", DoiTuong = "Nhân JS", DaLapCTBanHang = false,
                        NgayGhiSoKho = "20/08/2019", LoaiChungTu = "Công nợ"
                    },
                    new
                    {
                        NgayHachToan = "20/08/2019", NgayChungTu = "20/08/2019", SoChungTu = "CT00001", DienGiai = "Chug tu 000001",
                        TongTien = "100.000.000", NguoiGiaoNhan = "Lan Anh", DoiTuong = "Nhân JS", DaLapCTBanHang = false,
                        NgayGhiSoKho = "20/08/2019", LoaiChungTu = "Công nợ"
                    },
                })).EndOf(".cell").Render();

        }

        private static void ChiTiet()
        {
            Html.Instance.Div.ClassName("cell-md-9 cell-lg-9 cell-xl-9")
                .Panel().ClassName("marginTop5")
                .Table(new ObservableArray<Header<object>>(new Header<object>[] {
                    new Header<object> { HeaderText = "Mã hàng", FieldName = "MaHang" },
                    new Header<object> { HeaderText = "Tên hàng", FieldName = "TenHang" },
                    new Header<object> { HeaderText = "Kho", FieldName = "Kho" },
                    new Header<object> { HeaderText = "TK nợ", FieldName = "TKNo" },
                    new Header<object> { HeaderText = "TK có", FieldName = "TKCo" },
                    new Header<object> { HeaderText = "ĐVT", FieldName = "DVT" },
                    new Header<object> { HeaderText = "Số lượng", FieldName = "SoLuong" },
                    new Header<object> { HeaderText = "Đơn giá", FieldName = "DonGia" },
                    new Header<object> { HeaderText = "Thành tiền", FieldName = "ThanhTien" },
                    new Header<object> { HeaderText = "Số lô", FieldName = "SoLo" },
                    new Header<object> { HeaderText = "Hạn sử dụng", FieldName = "HanSuDung" },
                }), new ObservableArray<object>(new object[] {
                    new
                    {
                        MaHang = "HH00003", TenHang = "Áo vest", Kho = "Kho quần áo", TKNo = "123 - Việt Nam đồng",
                        TKCo = "444 - Bán hàng", DVT = "Cái", SoLuong = 12, DonGia = 10000000m,
                        ThanhTien = 120000000, SoLo = "LO00002", HanSuDung = "20/08/2020",
                    },
                    new
                    {
                        MaHang = "HH00003", TenHang = "Áo vest", Kho = "Kho quần áo", TKNo = "123 - Việt Nam đồng",
                        TKCo = "444 - Bán hàng", DVT = "Cái", SoLuong = 12, DonGia = 10000000m,
                        ThanhTien = 120000000, SoLo = "LO00002", HanSuDung = "20/08/2020",
                    },
                    new
                    {
                        MaHang = "HH00003", TenHang = "Áo vest", Kho = "Kho quần áo", TKNo = "123 - Việt Nam đồng",
                        TKCo = "444 - Bán hàng", DVT = "Cái", SoLuong = 12, DonGia = 10000000m,
                        ThanhTien = 120000000, SoLo = "LO00002", HanSuDung = "20/08/2020",
                    },
                    new
                    {
                        MaHang = "HH00003", TenHang = "Áo vest", Kho = "Kho quần áo", TKNo = "123 - Việt Nam đồng",
                        TKCo = "444 - Bán hàng", DVT = "Cái", SoLuong = 12, DonGia = 10000000m,
                        ThanhTien = 120000000, SoLo = "LO00002", HanSuDung = "20/08/2020",
                    },
                })).EndOf(".grid").Render();
        }
    }
}
