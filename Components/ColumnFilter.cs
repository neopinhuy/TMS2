using Bridge.Html5;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components
{
    public class ColumnFilter : Component
    {
        public override string Title { get; set; }

        public override void Render()
        {
            Html.Take("#columnFilter");
            if (Html.Context == null)
            {
                Html.Take(Document.Body).Div.Id("columnFilter");
            }
            Html.Instance.Div
                .Div.ClassName("div-sort")
                    .Button.Span.ClassName("fa fa-sort-amount-up-alt").End.Text("Tăng dần").End
                    .Button.Span.ClassName("fa fa-sort-amount-down-alt").End.Text("Giảm dần").End.End
                .Div.ClassName("div-type")
                    .Anchor.Text("Filter by Condition").End.Text("|")
                    .Anchor.Text("Filter by Value").End
                    .Anchor.Span.ClassName("fa fa-sort-amount-down-alt").End.Text("Giảm dần").End.End.Render();
        }
    }
}
