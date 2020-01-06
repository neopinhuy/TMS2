using System;
using System.Linq;

namespace Common.Extensions
{
    public static class ReflectionExtension
    {
        public static bool IsSimple(this Type type)
        {
            if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Nullable<>))
            {
                return IsSimple(type.GetGenericArguments()[0]);
            }
            return type.IsPrimitive
              || type.IsEnum
              || type.Equals(typeof(string))
              || type.Equals(typeof(DateTime))
              || type.Equals(typeof(DateTimeOffset))
              || type.Equals(typeof(TimeSpan))
              || type.Equals(typeof(decimal));
        }

        public static bool IsNumber(this Type type)
        {
            if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Nullable<>))
            {
                return IsNumber(type.GetGenericArguments()[0]);
            }
            return type == typeof(sbyte)
                    || type == typeof(byte)
                    || type == typeof(short)
                    || type == typeof(ushort)
                    || type == typeof(int)
                    || type == typeof(uint)
                    || type == typeof(long)
                    || type == typeof(ulong)
                    || type == typeof(float)
                    || type == typeof(double)
                    || type == typeof(decimal);
        }

        public static bool IsTime(this Type type)
        {
            if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Nullable<>))
            {
                return IsTime(type.GetGenericArguments()[0]);
            }
            return type == typeof(DateTime)
                    || type == typeof(DateTimeOffset)
                    || type == typeof(TimeSpan);
        }

        public static bool IsBoolean(object value)
        {
            return value is bool || value is bool?;
        }

        public static object GetPropValue(this object obj, string propName)
        {
            return obj.GetType().GetProperty(propName).GetValue(obj);
        }

        public static T GetPropValue<T>(this object obj, string propName) where T: class
        {
            return obj.GetType().GetProperty(propName).GetValue(obj) as T;
        }

        public static void SetPropValue(this object obj, string propName, object value)
        {
            obj.GetType().GetProperty(propName).SetValue(obj, value);
        }
    }
}
