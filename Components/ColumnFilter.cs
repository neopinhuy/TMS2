using Bridge.Html5;
using MVVM;
using System;

namespace Components
{
    public class ColumnFilter : Component
    {
        public override string Title { get; set; }

        public override void Render()
        {
            Html.Take("#columnFilter");
            if (Html.Context != null)
            {
                return;
            }

            Html.Take(Document.Body).Div.Id("columnFilter");
            Html.Instance.Div
            .Div.ClassName("div-sort")
                .Button.ClassName("button small rounded").Span.ClassName("fa fa-sort-amount-up-alt").End.Text(" Ascending").End
                .Button.ClassName("button small rounded").Span.ClassName("fa fa-sort-amount-down-alt").End.Text(" Descending").End.End
            .Div.ClassName("div-type")
                .Anchor.Text("Filter by Condition").End
                .Anchor.Text("Filter by Value").End.End
            .SmallInput().ClassName("searchbox").Attr("placeholder", "Search").End
            .Div.ClassName("div-edt-val")
                .SmallCheckbox("Select All").End
                .Panel()
                    .SmallCheckbox("8/13/2011").End
                    .SmallCheckbox("14/11/2011").End
                    .SmallCheckbox("27/12/2018").End
                    .SmallCheckbox("05/06/2019").End
                    .SmallCheckbox("23/09/2019").End
                .End
            .Render();
        }

        public void Toggle()
        {
            Html.Take("#columnFilter");
            if (Html.Context == null)
            {
                throw new InvalidOperationException("Column filter hasn't been initialized");
            }
            bool isShown = Html.Context.ClassName.Contains("show");
            if (isShown)
            {
                Html.Context.ClassName.Replace("show", "hide");
            }
            else
            {
                Html.Context.ClassName.Replace("hide", "show");
            }
        }
    }
}
