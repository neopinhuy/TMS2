using Bridge;
using System;

namespace Common.Extensions
{
    public static class BridgeExtensions
    {
        [ExpandParams]
        [Template("{task}.call({context}, {parameters})")]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Style", "IDE0060:Remove unused parameter", Justification = "<Pending>")]
        public static Action Invoke(this Action task, object context, params object[] parameters)
        {
            return null;
        }

        public static bool GetBool(this object obj, string prop)
        {
            var res = (bool?)obj[prop];
            return res.HasValue && res.Value;
        }
    }
}
