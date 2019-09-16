using System.Collections.Generic;
using System.Threading.Tasks;

namespace LogContract.Interfaces
{
    public interface IRestful<T>
    {
        IEnumerable<T> Get();

        Task<T> Get(int id);

        void Post(T value);

        void Put(T value);

        void Delete(int id);
    }
}