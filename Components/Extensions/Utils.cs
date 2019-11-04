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
        public static IEnumerable<Header<T>> GetHeaders<T>(this MasterData masterData)
        {
            var entityDic = masterData.Entity.ToDictionary(x => x.Id);
            return from entity in masterData.Entity
                   join field in masterData.Field on entity.Id equals field.EntityId
                   where entity.Name == typeof(T).Name && !field.Hidden
                   orderby field.Order
                   select new Header<T>
                   {
                       HeaderText = field.Description,
                       FieldName = field.FieldName,
                       HasFilter = true,
                       Reference = field.ReferenceId != null ? entityDic[field.ReferenceId.Value].Name : null,
                       RefDisplayField = field.RefDisplayFields ?? "Name"
                   };
        }

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

        public static void ExecuteEvent<T>(this T obj, string eventName, params object[] arguements)
        {
            try
            {
                if (obj[eventName] is Func<Task> asyncF) asyncF.Invoke(obj, arguements);
                else if (obj[eventName] is Action syncF) syncF.Invoke(obj, arguements);
            }
            catch (Exception ex)
            {
                if (ex.Message != "Cannot read property 'isCompleted' of undefined")
                    throw;
            }
        }
    }
}
