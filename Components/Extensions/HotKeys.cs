using Bridge;
using System;
using static Retyped.jquery;

namespace Components.Extensions
{
    public static class HotKeysExtension
    {
        [Template("<self>{jq}.hotkey({keySet}, {action})")]
        public static JQuery<TElement> HotKey<TElement>(this JQuery<TElement> jq, string keySet, Action action)
        {
            return jq;
        }
    }
}
