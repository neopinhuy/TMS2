using Bridge;
using MVVM;
using System;
using static Retyped.jquery;
using static Retyped.jquery_simplepagination;

namespace Components.Extensions
{
    public static class Paginator
    {
        [Template("<self>{jq}.pagination({options})")]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Style", "IDE0060:Remove unused parameter", Justification = "<Pending>")]
        public static JQuery<TElement> Pagination<TElement>(this JQuery<TElement> jq, SimplePaginationOptions options)
        {
            return jq;
        }

        [Template("<self>{jq}.pagination({action}, {value})")]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Style", "IDE0060:Remove unused parameter", Justification = "<Pending>")]
        public static JQuery<TElement> Pagination<TElement>(this JQuery<TElement> jq, string action, int value)
        {
            return jq;
        }

        public static Html Pagination(this Html html, string action, int value)
        {
            jQuery.select(Html.Context).Pagination(action, value);
            return html;
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
                }
            });
            return html;
        }
    }
}
