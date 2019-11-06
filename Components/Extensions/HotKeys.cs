using Bridge;
using MVVM;
using System;
using static Retyped.jquery;

namespace Components.Extensions
{
    public static class HotKeysExtension
    {
        [Template("<self>{jq}.hotkey({keySet}, {action})")]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Style", "IDE0060:Remove unused parameter", Justification = "<Pending>")]
        public static JQuery<TElement> HotKey<TElement>(this JQuery<TElement> jq, string keySet, Action action)
        {
            return jq;
        }

        public static Html HotKey<TElement>(string keySet, Action action)
        {
            jQuery.select(Html.Context).HotKey(keySet, action);
            return Html.Instance;
        }
    }
}
