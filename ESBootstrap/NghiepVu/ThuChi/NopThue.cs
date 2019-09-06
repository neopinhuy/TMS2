using Components;
using MVVM;
using System;

namespace MisaOnline.NghiepVu.ThuChi
{
    public partial class NopThue : Component
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
    }
}