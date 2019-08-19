using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ThuChi
{
    public class DanhSachThuChi : IControl
    {
        public Html _html { get; set; }
        public DanhSachThuChi(Html html)
        {
            _html = html;
        }

        public void Render()
        {
            _html.Form
                .Table.ClassName("subcompact")
                    .TBody
                        .TRow
                            .TData.Text("Kỳ").End
                            .TData.Input.Value("Đầu tháng đến hiện tại").End.End
                            .TData.Text("Từ").End
                            .TData.Input.Value("Đầu tháng").End.End
                            .TData.Text("Đến").End
                            .TData.Input.Value("Hôm nay").End.End
                        .End

                        .TRow
                            .TData.Text("Trạng thái").End
                            .TData.Input.Value("Tất cả").End.End
                            .TData.Text("Loại").End
                            .TData.Input.Value("Tất cả").End.End
                            .TData.End
                            .TData.Button.Text("Lấy dữ liệu").End.End
                        .End
                    .End
                .End
            .End.Render();
        }
    }
}
