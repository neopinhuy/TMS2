using Common.Extensions;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace Components.Extensions
{
    public static partial class Utils
    {
        public static string FormatWith(string format, object source)
        {
            if (!format.HasAnyChar()) return string.Empty;
            if (source is null) return format;
            return FormatWith(format, null, source);
        }

        public static string GetFormatText(object entity, TMS.API.Models.Component ui)
        {
            var text = entity?.GetComplexPropValue(ui.FieldName)?.ToString();
            if (ui.FormatData.HasAnyChar()) text = FormatWith(ui.FormatData, entity?.GetComplexPropValue(ui.FieldName));
            if (ui.FormatEntity.HasAnyChar()) text = FormatWith(ui.FormatEntity, entity);
            return text;
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
                var value = source.GetComplexPropValue(propertyGroup.Value);
                values.Add(propertyGroup.Value == "0" ? source : value is null ? "null" : value);
                return new string('{', startGroup.Captures.Count) + (values.Count - 1) + formatGroup.Value
                  + new string('}', endGroup.Captures.Count);
            });

            return string.Format(provider, rewrittenFormat, values.ToArray());
        }

        public static void ExecuteEvent<T>(this T obj, string eventName, params object[] arguments)
        {
            try
            {
                var action = obj[eventName] as Delegate;
                action.Call(obj, arguments);
            }
            catch (Exception ex)
            {
                if (ex.Message != "Cannot read property 'isCompleted' of undefined")
                {
                    Console.WriteLine(ex);
                    throw;
                }
            }
        }
    }
}
