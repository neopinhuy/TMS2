using System;
using System.Collections.Generic;
using System.Linq;

namespace Commmon.Extensions
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

        public static IEnumerable<T> DistinctBy<T, Key> (this IEnumerable<T> source, Func<T, Key> keySelector)
        {
            return source.GroupBy(keySelector).Select(g => g.First());
        }
    }
}
