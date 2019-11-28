using System.Collections.Generic;

namespace Common.Extensions
{
    public static class DictionaryExtensions
    {
        public static T TryGet<Key, T>(this Dictionary<Key, T> dic, Key key)
        {
            if (!dic.ContainsKey(key)) return default(T);
            return dic[key];
        }
    }
}
