using Components;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.ThuChi
{
    public class NopThue : Component
    {
        public override string ControlName { get; set; } = "NopThue";
        public override string Title { get; set; } = "Nộp thuế";
        public ObservableArray<Header<object>> ChungTuHeader { get; set; }
        public Header<object>[] ThueGTGT { get; set; }
        public ObservableArray<object> ChungTu { get; set; }

        public NopThue()
        {
            ThueGTGT = new Header<object>[]
            {
                new Header<object> { HeaderText = "Số phải nộp", FieldName = "GTGT_SoPhaiNop", GroupName = "Thuế GTGT" },
                new Header<object> { HeaderText = "Số nộp lần này", FieldName = "GTGT_SoNopLanNay", GroupName = "Thuế GTGT" },
                new Header<object> { HeaderText = "TKĐƯ thuế GTGT", FieldName = "GTGT_TKDUThue", GroupName = "Thuế GTGT" },
                new Header<object> { HeaderText = "TK thuế GTGT khấu trừ", FieldName = "GTGT_TKKhauTru", GroupName = "Thuế GTGT" },
                new Header<object> { HeaderText = "TK thuế GTGT", FieldName = "GTGT_TaiKhoan", GroupName = "Thuế GTGT" },
            };

            ChungTuHeader = new ObservableArray<Header<object>>(new Header<object>[] {
                new Header<object> { HeaderText = "Ngày hạch toán", FieldName = "NgayHachToan" },
                new Header<object> { HeaderText = "Ngày chứng từ", FieldName = "NgayChungTu" },
                new Header<object> { HeaderText = "Số chứng từ", FieldName = "SoChungTu" },
                new Header<object> { HeaderText = "Số hóa đơn", FieldName = "SoHoaDon" },

                new Header<object> { HeaderText = "Số phải nộp", FieldName = "NK_SoPhaiNop", GroupName = "Thuế nhập khẩu" },
                new Header<object> { HeaderText = "Số nộp lần này", FieldName = "NK_SoNopLanNay", GroupName = "Thuế nhập khẩu" },
                new Header<object> { HeaderText = "TK thuế NK", FieldName = "NK_TKThue", GroupName = "Thuế nhập khẩu" },

                new Header<object> { HeaderText = "Số phải nộp", FieldName = "TTDB_SoPhaiNop", GroupName = "Thuế tiêu thụ đặc biệt" },
                new Header<object> { HeaderText = "Số nộp lần này", FieldName = "TTDB_SoNopLanNay", GroupName = "Thuế tiêu thụ đặc biệt" },
                new Header<object> { HeaderText = "TK thuế TTĐB", FieldName = "TTDB_TKThue", GroupName = "Thuế tiêu thụ đặc biệt" },

                new Header<object> { HeaderText = "Số phải nộp", FieldName = "BVMT_SoPhaiNop", GroupName = "Thuế bảo vệ môi trường" },
                new Header<object> { HeaderText = "Số nộp lần này", FieldName = "BVMT_SoNopLanNay", GroupName = "Thuế bảo vệ môi trường" },
                new Header<object> { HeaderText = "TK thuế BVMT", FieldName = "BVMT_TKThue", GroupName = "Thuế bảo vệ môi trường" },
            });
            ChungTuHeader.AddRange(ThueGTGT);
            ChungTu = new ObservableArray<object>(new object[]
            {
                new
                {
                    NgayHachToan = "27/08/2019", NgayChungTu = "27/08/2019", SoChungTu = "CT252463", SoHoaDon = "HD909122",
                    NK_SoPhaiNop = "10.000.000", NK_SoNopLanNay = "5.000.000", NK_TKThue = "605", TTDB_SoPhaiNop = "10.000.000",
                    TTDB_SoNopLanNay = "5.000.000", TTDB_TKThue = "705", BVMT_SoPhaiNop = "5.000.000", BVMT_SoNopLanNay = "2.000.000",
                    BVMT_TKThue = "805", GTGT_SoPhaiNop = "4.000.000", GTGT_SoNopLanNay = "2.000.000", GTGT_TKDUThue = "905",
                    GTGT_TKKhauTru = "1005", GTGT_TaiKhoan = "1006",
                },
            });
            ChungTu.Add(ChungTu.Data[0]);
            ChungTu.Add(ChungTu.Data[0]);
            ChungTu.AddRange(ChungTu.Data);
            ChungTu.AddRange(ChungTu.Data);
        }

        public override void Render()
        {
            if (IsExisted()) return;
            PhuongThucThanhToan();
            CacLoaiThue();
            ChungTuMuaHang();
        }

        protected void PhuongThucThanhToan()
        {
            Html.Instance.H2.Text(Title).End
                .Form.ClassName("middle").Table.TRow
                .TData.Label.Text("Ngày nộp thuế").EndOf(ElementType.td)
                .TData.SmallDatePicker(DateTime.Now.ToString()).EndOf(ElementType.td)
                .TData.Label.Text("Phương thức thanh toán").EndOf(ElementType.td)
                .TData.SmallRadio("phuongThucTT", "Tiền gửi").EndOf(ElementType.td)
                .TData.SmallRadio("phuongThucTT", "Tiền mặt").EndOf(ElementType.td)
                .EndOf(ElementType.form);
        }

        protected void CacLoaiThue()
        {
            Html.Instance.Panel().Form.ClassName("middle").Table.TRow
                .TData.SmallCheckbox("Thuế nhập khẩu", true).EndOf(ElementType.td)
                .TData.SmallCheckbox("Thuế TTĐB", true).EndOf(ElementType.td)
                .TData.SmallCheckbox("Thuế BVMT", true).EndOf(ElementType.td)
                .TData.SmallCheckbox("Thuế GTGT", true).EndOf(ElementType.td)
                .Event(Bridge.Html5.EventType.Change, (Bridge.Html5.Event e) =>
                {
                    if (e.Target["checked"].Cast<bool>())
                    {
                        ChungTuHeader.AddRange(ThueGTGT);
                    }
                    else
                    {
                        ThueGTGT.ForEach(ChungTuHeader.Remove);
                    }
                })
            .End.TRow
                .TData.ColSpan(3).SmallCheckbox("Không lấy thuế GTGT hàng nhập khẩu có TKĐƯ thuế GTGT là 133").EndOf(ElementType.td)
            .End
            .EndOf(".panel");
        }

        protected void ChungTuMuaHang()
        {
            Html.Instance.Ul.Attr("data-role", "tabs").Attr("data-expand", "true").Margin(Direction.top, 5)
                .Li.ClassName("active").Anchor.Href("#chungMuaHang").Text("Chứng từ mua hàng").EndOf(ElementType.ul)
                .Div.ClassName("tabs-content")
                    .Div.Id("chungMuaHang")
                    .Table(ChungTuHeader, ChungTu)
                    .Button("Nộp thuế", "button small primary marginTop5", "fa fa-check").End
                    .Button("Trợ giúp", "button small primary marginTop5", "fa fa-question-circle").Margin(Direction.left, 5).End
                .Render();
        }
    }
}