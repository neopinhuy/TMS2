using System;
using System.Collections.Generic;
using System.Linq;

namespace Common.Extensions
{
    public static class Util
    {
        public static bool IsNumber(this Type type)
        {
            if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Nullable<>))
            {
                return IsNumber(type.GetGenericArguments()[0]);
            }
            return type == typeof(sbyte)
                    || type == typeof(byte)
                    || type == typeof(short)
                    || type == typeof(ushort)
                    || type == typeof(int)
                    || type == typeof(uint)
                    || type == typeof(long)
                    || type == typeof(ulong)
                    || type == typeof(float)
                    || type == typeof(double)
                    || type == typeof(decimal);
        }

        public static bool IsTime(this Type type)
        {
            if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Nullable<>))
            {
                return IsTime(type.GetGenericArguments()[0]);
            }
            return type == typeof(DateTime)
                    || type == typeof(DateTimeOffset)
                    || type == typeof(TimeSpan);
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
