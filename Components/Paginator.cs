using Components.Extensions;
using MVVM;
using System;

namespace Components
{
    public class PaginationOptions
    {
        public int Total { get; set; }
        public int PageSize { get; set; }
        public Action<int, object> ClickHandler { get; set; }
    }

    public class Paginator : Component
    {
        private readonly PaginationOptions Options;
        private bool _hasInit;
        
        public Paginator(PaginationOptions paginator)
        {
            Options = paginator ?? throw new ArgumentNullException(nameof(paginator));
        }

        public override void Render()
        {
            InitialRender();
        }

        private void InitialRender()
        {
            if (_hasInit || Options.Total <= Options.PageSize) return;
            _hasInit = true;
            Html.Take(RootHtmlElement).Ul.ClassName("pagination");
            RootHtmlElement = Html.Context;
            Html.Take(RootHtmlElement).Pagination(Options.Total, Options.PageSize, Options.ClickHandler);
        }

        public void UpdateTotal(int total)
        {
            Options.Total = total;
            if (_hasInit || Options.Total <= Options.PageSize) return;
            InitialRender();
            Html.Take(RootHtmlElement).Pagination("updateItems", Options.Total);
        }
    }
}
