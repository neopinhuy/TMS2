using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Common.Clients
{
    public interface IRestful<T>
    {
        Task<IEnumerable<T>> GetList();

        Task<T> Get(int id);

        Task<T> PostAsync(T value);

        Task<T> PutAsync(T value);

        Task<bool> Delete(int id);
    }
}