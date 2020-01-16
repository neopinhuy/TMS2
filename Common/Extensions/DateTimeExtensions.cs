using System;

namespace Common.Extensions
{
    public static class DateTimeExtensions
    {
        public static string ToISOFormat(this DateTime date)
        {
            return date.ToString("yyyy-MM-ddTHH:mm:ssZ");
        }
    }
}
