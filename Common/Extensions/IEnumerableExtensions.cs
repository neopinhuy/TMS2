﻿using System;
using System.Collections.Generic;
using System.Linq;

namespace Common.Extensions
{
    public static class IEnumerableExtensions
    {
        public static IEnumerable<T> DistinctBy<T, Key>(this IEnumerable<T> source, Func<T, Key> keySelector)
        {
            return source.GroupBy(keySelector).Select(g => g.First());
        }

        public static IEnumerable<object> GetSourceByType(this IEnumerable<IEnumerable<object>> sources, Type type)
        {
            return sources.FirstOrDefault(x => x.GetType().GetGenericArguments()[0] == type);
        }

        public static IEnumerable<object> GetSourceByTypeName(this IEnumerable<IEnumerable<object>> sources, string typeName)
        {
            return sources.FirstOrDefault(x => x != null && x.GetType().GetGenericArguments()[0].Name == typeName);
        }

        public static IEnumerable<T> ForEach<T>(this IEnumerable<T> source, Action<T> action)
        {
            foreach (var item in source)
            {
                action(item);
            }
            return source;
        }

        public static bool Nothing<T>(this IEnumerable<T> source)
        {
            return source == null || !source.Any();
        }

        public static bool HasElement<T>(this IEnumerable<T> source)
        {
            return source != null && source.Any();
        }
    }
}
