using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Reflection;

namespace TMS.API.Extensions
{
    public static class Util
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
    }

    public class IgnoreNestedResolver : DefaultContractResolver
    {
        protected override JsonProperty CreateProperty(MemberInfo member, MemberSerialization memberSerialization)
        {
            var property = base.CreateProperty(member, memberSerialization);
            property.ShouldSerialize = instance =>
            {
                switch (member.MemberType)
                {
                    case MemberTypes.Property:
                        return instance.GetType()
                            .GetProperty(member.Name).PropertyType.IsSimple();
                    case MemberTypes.Field:
                        return instance
                            .GetType().GetField(member.Name).FieldType.IsSimple();
                    default:
                        return true;

                }
            };
            return property;
        }
    }
}
