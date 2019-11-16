using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.Collections;
using System.Reflection;

namespace TMS.API.Extensions
{
    public class IgnoreNullOrEmptyEnumResolver : DefaultContractResolver
    {
        protected override JsonProperty CreateProperty(MemberInfo member, MemberSerialization memberSerialization)
        {
            var property = base.CreateProperty(member, memberSerialization);
            property.ShouldSerialize = instance =>
            {
                object value = null;
                switch (member.MemberType)
                {
                    case MemberTypes.Property:
                        var prop = instance.GetType().GetProperty(member.Name);
                        value = prop.GetValue(instance);
                        if (value == null) return false;
                        if (value is IEnumerable enumerable)
                        {
                            if (!enumerable.GetEnumerator().MoveNext()) return false;
                        }
                        return true;
                    case MemberTypes.Field:
                        var field = instance.GetType().GetField(member.Name);
                        value = field.GetValue(instance);
                        if (value == null) return false;
                        if (value is IEnumerable valEnumerable)
                        {
                            if (!valEnumerable.GetEnumerator().MoveNext()) return false;
                        }
                        return true;
                    default:
                        return true;

                }
            };
            return property;
        }
    }
}
