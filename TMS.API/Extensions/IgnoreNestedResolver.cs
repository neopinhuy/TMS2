using Common.Extensions;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.Reflection;

namespace TMS.API.Extensions
{
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
