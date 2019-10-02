using System.Collections.Generic;
using System.Threading.Tasks;

namespace LogContract.Interfaces
{
    public interface IRestful<T>
    {
        Task<IEnumerable<T>> Get();

        Task<T> Get(int id);

        Task<T> Post(T value);

        Task<T> Put(T value);

        Task<bool> Delete(int id);
    }
}