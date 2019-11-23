using System;

namespace Common.Extensions
{
    public class InvalidOperationException : Exception
    {
        public InvalidOperationException(string message) : base(message)
        {
            Console.WriteLine(message);
        }

        public InvalidOperationException(string message, Exception innerException) : base(message, innerException)
        {
        }

        public InvalidOperationException()
        {
        }
    }
}
