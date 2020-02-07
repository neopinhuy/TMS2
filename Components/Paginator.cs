using Components.Extensions;
using MVVM;
using System;

namespace Components
{
    public class PaginatorParam
    {
        public int Total { get; set; }
        public int PageSize { get; set; }
        public Action<int, object> ClickHandler { get; set; }
    }

    public class Paginator : Component
    {
        private readonly PaginatorParam _paginator;
        
        public Paginator(PaginatorParam paginator)
        {
            _paginator = paginator ?? throw new ArgumentNullException(nameof(paginator));
        }

        public override void Render()
        {
            Html.Take(RootHtmlElement).Ul.ClassName("pagination");
            RootHtmlElement = Html.Context;
            Html.Instance.Pagination(_paginator.Total, _paginator.PageSize, _paginator.ClickHandler);
        }

        public void UpdateTotal(int total)
        {
            _paginator.Total = total;
            Html.Take(RootHtmlElement).Pagination("updateItems", _paginator.Total);
        }
    }
}
