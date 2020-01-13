using System.Collections.Generic;
using System.Linq;

namespace Common.Extensions
{
    public static class OdataExtensions
    {
        public static string FilterByIds(string noFilterQuery, IEnumerable<int?> entityIds)
        {
            var strIds = string.Join(",", entityIds.Where(x => x.HasValue).Distinct());
            var hasOperator = noFilterQuery.Contains("?$");
            var filterByIds = hasOperator ? noFilterQuery + "&" : noFilterQuery + "?";
            filterByIds += $"$filter=Id in ({strIds})";
            return filterByIds;
        }

        public static string RemoveFilterQuery(string formattedDataSource)
        {
            var noFilterQuery = formattedDataSource;
            var filterIndex = formattedDataSource.IndexOf("$filter");
            if (filterIndex >= 0)
            {
                var endFilterIndex = formattedDataSource.Substring(filterIndex).IndexOf("&");
                endFilterIndex = endFilterIndex == -1 ? formattedDataSource.Length : endFilterIndex + filterIndex;
                noFilterQuery = formattedDataSource.Substring(0, filterIndex) +
                    formattedDataSource.Substring(endFilterIndex);
            }
            var endChar = noFilterQuery[noFilterQuery.Length - 1];
            if (noFilterQuery.Length > 0 && endChar == '&' || endChar == '?')
            {
                noFilterQuery = noFilterQuery.Substring(0, noFilterQuery.Length - 1);
            }
            return noFilterQuery;
        }

        public static string GetFilterQuery(string dataSourceFilter)
        {
            var filterIndex = dataSourceFilter.IndexOf("$filter");
            if (filterIndex >= 0)
            {
                var filter = dataSourceFilter.Substring(filterIndex);
                var endFilterIndex = filter.IndexOf("&$");
                endFilterIndex = endFilterIndex == -1 ? filter.Length : endFilterIndex;
                return filter.Substring(0, endFilterIndex);
            }
            return string.Empty; ;
        }

        public static string AppendFilter(string originalQuery, string filter)
        {
            var originalFilter = GetFilterQuery(originalQuery);
            int index;
            if (originalFilter.IsNullOrEmpty())
            {
                originalQuery += originalQuery.IndexOf("?$") >= 0 ? "&?$filter=" : "?$filter=";
                index = originalQuery.Length;
            }
            else
            {
                index = originalQuery.IndexOf(originalFilter) + originalFilter.Length;
            }
            var finalFilter = originalQuery.Substring(0, index) + filter + originalQuery.Substring(index);
            return finalFilter;
        }
    }
}
