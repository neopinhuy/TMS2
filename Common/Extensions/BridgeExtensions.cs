using Bridge;
using System;
using System.Collections;

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
            return (bool?)obj?[prop] ?? false;
        }

        public static object GetComplexPropValue(this object obj, string propName)
        {
            if (obj == null)
            {
                throw new InvalidOperationException($"{nameof(obj)} is null");
            }
            if (string.IsNullOrWhiteSpace(propName)) return null;
            var hierarchy = propName.Split('.');
            var res = obj;
            foreach (var key in hierarchy)
            {
                if (res == null) return null;
                res = res[key];
            }
            return res;
        }

        public static void SetComplexPropValue(this object obj, string propName, object value)
        {
            if (obj == null)
            {
                throw new InvalidOperationException($"{nameof(obj)} is null");
            }
            if (string.IsNullOrWhiteSpace(propName))
            {
                throw new InvalidOperationException($"{nameof(propName)} is null");
            }
            var hierarchy = propName.Split('.');
            if (hierarchy.Length == 0) return;
            if (hierarchy.Length == 1)
            {
                obj[propName] = value;
                return;
            }
            var leaf = obj;
            for (var i = 0; i < hierarchy.Length - 1; i++)
            {
                if (leaf == null) return;
                var key = hierarchy[i];
                leaf = leaf[key];
            }
            if (leaf == null) return;
            leaf[hierarchy[hierarchy.Length - 1]] = value;
        }

        public static T CopyProperties<T>(this object obj) where T: class, new()
        {
            var res = new T();
            try
            {
                res = (T)obj;
            }
            catch (Exception)
            {
                foreach (var prop in GetOwnPropertyNames(obj))
                {
                    res[prop] = obj[prop];
                }
            }
            return res;
        }

        public static void CopyPropFrom(this object obj, object source)
        {
            if (obj is null || source is null) return;
            foreach (var prop in GetOwnPropertyNames(source))
            {
                obj[prop] = source[prop];
            }
        }
    }
}
