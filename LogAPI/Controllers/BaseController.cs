using System.Collections.Generic;
using System.Threading.Tasks;
using LogContract.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace LogAPI.Controllers
{
    [ApiController]
    public class BaseController<T> : ControllerBase, IRestful<T> where T : class
    {
        [HttpGet]
        public virtual IEnumerable<T> Get()
        {
            throw new System.NotImplementedException();
        }

        [HttpGet]
        public virtual async Task<T> Get(int id)
        {
            throw new System.NotImplementedException();
        }

        [HttpPost]
        public virtual void Post(T value)
        {
            throw new System.NotImplementedException();
        }

        [HttpPut]
        public virtual void Put(T value)
        {
            throw new System.NotImplementedException();
        }

        [HttpDelete]
        public virtual void Delete(int id)
        {
            throw new System.NotImplementedException();
        }
    }
}
