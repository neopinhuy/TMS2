using System;

namespace Components.Extensions
{
    public class ReflectionFormatProvider : IFormatProvider
    {
        public object GetFormat(Type formatType)
        {
            return this;
        }

        public string Format(string format, object arg, IFormatProvider formatProvider)
        {
            string[] formats = (format ?? string.Empty).Split(new char[] { ':' }, 2);
            string propertyName = formats[0].TrimEnd('}');
            string suffix = formats[0].Substring(propertyName.Length);
            string propertyFormat = formats.Length > 1 ? formats[1] : null;

            var pi = arg.GetType().GetProperty(propertyName);
            if (pi == null || pi.GetMethod == null)
            {
                return (arg is IFormattable) ?
                    ((IFormattable)arg).ToString(format, formatProvider)
                    : arg.ToString();
            }

            object value = pi.GetMethod.Invoke(arg, null);
            return (propertyFormat == null) ?
                (value ?? string.Empty).ToString() + suffix
                : string.Format("{0:" + propertyFormat + "}", value);
        }
    }
}
