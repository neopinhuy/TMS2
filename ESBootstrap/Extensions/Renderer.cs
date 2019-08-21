using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ThuChi;

namespace Extensions
{
    public static class Renderer
    {
        public static Html EditButton(this Html html)
        {
            return html.TData.Button.ClassName("button small warning").I.ClassName("fa fa-edit").EndUp(ElementType.td.ToString());
        }

        public static Html ActionColumn(this Html html)
        {
            return html.Th.Span.ClassName("mif-folder-open fg-cyan").End.End;
        }

        public static Html Panel(this Html html)
        {
            return html.Div.Attr("data-role", "panel").Attr("data-cls-panel", "shadow-1");
        }
    }
}
