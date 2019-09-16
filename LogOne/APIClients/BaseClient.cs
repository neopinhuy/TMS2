using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using LogContract.Interfaces;

namespace LogOne.APIClients
{
    public class BaseClient<T> : IRestful<T>
    {
        public IEnumerable<T> Get()
        {
            throw new NotImplementedException();
        }

        public async Task<T> Get(int id)
        {
            var type = typeof(T);
            return default(T);
        }

        public void Post(T value)
        {
            throw new NotImplementedException();
        }

        public void Put(T value)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
