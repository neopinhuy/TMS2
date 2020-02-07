using System;

namespace Common.Extensions
{
    public static class DateTimeExtensions
    {
        public static string ToISOFormat(this DateTime date)
        {
            return date.ToString("yyyy-MM-ddTHH:mm:ssZ");
        }
        public static string CustomFormat(this DateTime? date, string format)
        {
            if (date is null) return string.Empty;
            var dateTime = DateTime.Parse(date.As<string>());
            return dateTime.ToString(format);
        }
    }
}
