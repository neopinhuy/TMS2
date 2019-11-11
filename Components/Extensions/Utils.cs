using Common.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Components.Extensions
{
    public static partial class Utils
    {
        public static string FormatWith(string format, object source)
        {
            if (source is null)
            {
                throw new ArgumentNullException(nameof(source));
            }

            return FormatWith(format, null, source);
        }

        public static string FormatWith(string format, IFormatProvider provider, object source)
        {
            if (format == null)
                throw new ArgumentNullException(nameof(format));

            var r = new Regex(@"(?<start>\{)+(?<property>[\w\.\[\]]+)(?<format>:[^}]+)?(?<end>\})+");
            var values = new List<object>();
            string rewrittenFormat = r.Replace(format, delegate (Match m)
            {
                var startGroup = m.Groups["start"];
                var propertyGroup = m.Groups["property"];
                var formatGroup = m.Groups["format"];
                var endGroup = m.Groups["end"];
                values.Add(propertyGroup.Value == "0" ? source : source[propertyGroup.Value]);
                return new string('{', startGroup.Captures.Count) + (values.Count - 1) + formatGroup.Value
                  + new string('}', endGroup.Captures.Count);
            });

            return string.Format(provider, rewrittenFormat, values.ToArray());
        }

        public static void ExecuteEvent<T>(this T obj, string eventName, params object[] arguments)
        {
            try
            {
                //obj.GetType().GetMethod(eventName).Invoke(obj, arguments);
                obj[eventName].As<Action>().Invoke(obj, arguments);
            }
            catch (Exception ex)
            {
                if (ex.Message != "Cannot read property 'isCompleted' of undefined")
                    throw;
            }
        }

        public static bool Nothing<T>(this IEnumerable<T> source)
        {
            return source == null || !source.Any();
        }
    }
}
