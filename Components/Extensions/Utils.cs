using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components.Extensions
{
    public static class Utils
    {
        public static IEnumerable<Header<T>> GetHeaders<T>(this MasterData masterData)
        {
            var entityDic = masterData.Entity.ToDictionary(x => x.Id);
            return from entity in masterData.Entity
                   join field in masterData.Field on entity.Id equals field.EntityId
                   where entity.Name == typeof(T).Name && !field.Hidden
                   select new Header<T>
                   {
                       HeaderText = field.Description,
                       FieldName = field.FieldName,
                       Sortable = true,
                       Reference = field.ReferenceId != null ? entityDic[field.ReferenceId.Value].Name : null,
                       RefDisplayField = field.RefDisplayFields ?? "Name"
                   };
        }
    }
}
