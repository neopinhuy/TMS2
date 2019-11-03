using Bridge.Html5;
using Common.Clients;
using Common.Extensions;
using MVVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace Components
{
    public class MasterData
    {
        public ICollection<User> User { get; set; }
        public ICollection<Entity> Entity { get; set; }
        public ICollection<Field> Field { get; set; }
        public ICollection<FuelType> FuelType { get; set; }
        public ICollection<Feature> Feature { get; set; }
        public ICollection<Vendor> Vendor { get; set; }
        public ICollection<FreightState> FreightState { get; set; }
        public ICollection<TruckType> TruckType { get; set; }
        public ICollection<Department> Department { get; set; }
        public ICollection<Currency> Currency { get; set; }
        private static IEnumerable<IEnumerable<object>> AllSources { get; set; }

        private static MasterData _instance;
        
        private MasterData() 
        {
        }

        public static async Task<MasterData> GetSingletonAsync()
        {
            if (_instance != null) return _instance;
            _instance = new MasterData();
            
            var genericProp = _instance.GetType().GetProperties()
                .Where(prop => prop.PropertyType.IsGenericType);
            var sourcesRequests = genericProp
                .Select(prop =>
                {
                    var refType = prop.PropertyType.GetGenericArguments()[0];
                    if (refType == typeof(IEnumerable<object>)) return null;
                    return GetListByType(refType);
                }).Where(x => x != null);
            AllSources = (await Task.WhenAll(sourcesRequests)).As<IEnumerable<IEnumerable<object>>>().ToList();
            foreach (var prop in genericProp)
            {
                var refType = prop.PropertyType.GetGenericArguments()[0];
                if (refType == typeof(IEnumerable<object>)) continue;
                IEnumerable<object> source = AllSources.GetSourceByType(refType);
                _instance[prop.Name] = source;
            }

            return _instance;
        }

        private static Task<object> GetListByType(Type refType)
        {
            var clientType = typeof(Client<>).MakeGenericType(new Type[] { refType });
            var httpGetList = clientType.GetMethod("GetList");
            var client = Activator.CreateInstance(clientType);
            return httpGetList.Invoke(client).As<Task<object>>();
        }

        public IEnumerable<object> GetSourceByType(Type type)
        {
            return AllSources.GetSourceByType(type);
        }

        public IEnumerable<object> GetSourceByTypeName(string typeName)
        {
            return AllSources.GetSourceByTypeName(typeName);
        }
    }
}
