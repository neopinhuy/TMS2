using System;
using System.Collections.Generic;
using System.Linq;

namespace Common.Extensions
{
    public static class Util
    {
        public static bool IsNumber(object value)
        {
            return value is sbyte
                    || value is byte
                    || value is short
                    || value is ushort
                    || value is int
                    || value is uint
                    || value is long
                    || value is ulong
                    || value is float
                    || value is double
                    || value is decimal;
        }

        public static bool IsTime(object value)
        {
            return value is DateTime
                    || value is DateTimeOffset
                    || value is TimeSpan;
        }

        public static bool IsBoolean(object value)
        {
            return value is bool || value is bool?;
        }

        public static bool IsNullOrEmpty(this string value)
        {
            return string.IsNullOrEmpty(value);
        }

        public static IEnumerable<T> DistinctBy<T, Key> (this IEnumerable<T> source, Func<T, Key> keySelector)
        {
            return source.GroupBy(keySelector).Select(g => g.First());
        }

        public static IEnumerable<object> GetSourceByType(this IEnumerable<IEnumerable<object>> sources, Type type)
        {
            return sources.FirstOrDefault(x => x.GetType().GetGenericArguments()[0] == type);
        }

        public static IEnumerable<object> GetSourceByTypeName(this IEnumerable<IEnumerable<object>> sources, string typeName)
        {
            return sources.FirstOrDefault(x => x.GetType().GetGenericArguments()[0].Name == typeName);
        }
    }
}
