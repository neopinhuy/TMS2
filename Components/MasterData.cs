using Common.Clients;
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
        public ICollection<Vendor> Vendor { get; set; }
        public ICollection<FreightState> FreightState { get; set; }
        public static IEnumerable<IEnumerable<object>> AllSources { get; set; }

        private static MasterData _instance;
        
        private MasterData() 
        {
        }
        
        public static async Task<MasterData> GetAll()
        {
            if (_instance != null) return _instance;
            _instance = new MasterData();
            await GetMasterData();
            return _instance;
        }

        private static async Task GetMasterData()
        {
            var genericProp = _instance.GetType().GetProperties()
                .Where(prop => prop.PropertyType.IsGenericType);
            var sourcesRequests = genericProp
                .Select(prop =>
                {
                    var refType = prop.PropertyType.GetGenericArguments()[0];
                    if (refType == typeof(IEnumerable<object>)) return null;
                    var clientType = typeof(BaseClient<>).MakeGenericType(new Type[] { refType });
                    var httpGetList = clientType.GetMethod("GetList");
                    var client = Activator.CreateInstance(clientType);
                    return httpGetList.Invoke(client).As<Task<object>>();
                }).Where(x => x != null);
            AllSources = (await Task.WhenAll(sourcesRequests)).As<IEnumerable<IEnumerable<object>>>().ToList();
            foreach (var prop in genericProp)
            {
                var refType = prop.PropertyType.GetGenericArguments()[0];
                if (refType == typeof(IEnumerable<object>)) continue;
                var source = AllSources.FirstOrDefault(x => x.GetType().GetGenericArguments()[0] == refType);
                _instance[prop.Name] = source;
            }
        }
    }
}
