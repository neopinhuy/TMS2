namespace Common.Extensions
{
    public static class StringExtensions
    {
        public static bool IsNullOrEmpty(this string value)
        {
            return string.IsNullOrEmpty(value);
        }

        public static bool HasAnyChar(this string value)
        {
            return !string.IsNullOrEmpty(value);
        }
    }
}
