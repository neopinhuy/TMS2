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
    }
}
