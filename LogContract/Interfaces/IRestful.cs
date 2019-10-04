using System.Collections.Generic;
using System.Threading.Tasks;

namespace LogContract.Interfaces
{
    public interface IRestful<T>
    {
        Task<IEnumerable<T>> Get();

        Task<T> Get(int id);

        Task<T> PostAsync(T value);

        Task<T> PutAsync(T value);

        Task<bool> Delete(int id);
    }
}