using Bridge;
using Bridge.Html5;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Retyped.jquery;
using static Retyped.jquery_simplepagination;

namespace Components.Extensions
{
    public static class Paginator
    {
        [Template("<self>{jq}.pagination({options})")]
        public static JQuery<TElement> Pagination<TElement>(this JQuery<TElement> jq, SimplePaginationOptions options)
        {
            return jq;
        }

        public static Html Pagination(this Html html, int total, int row, Action<int, object> pageClick)
        {
            var ul = Html.Context;
            jQuery.select(ul).Pagination(new SimplePaginationOptions
            {
                items = total,
                itemsOnPage = row,
                onPageClick = (double page, object @event) =>
                {
                    pageClick((int)page, @event);
                },
                cssStyle = "center-horizontal"
            });
            return html;
        }
    }
}
