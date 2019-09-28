using System.Collections.Generic;
using System.Threading.Tasks;

namespace LogContract.Interfaces
{
    public interface IRestful<T>
    {
        Task<IEnumerable<T>> Get();

        Task<T> Get(int id);

        Task Post(T value);

        Task Put(T value);

        Task Delete(int id);
    }
}