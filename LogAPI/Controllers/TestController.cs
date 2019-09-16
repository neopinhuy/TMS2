using LogAPI.Models;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace LogAPI.Controllers
{
    [Route("api/student")]
    public class TestController : BaseController<Student>
    {
        [HttpGet]
        [Route("{id}")]
        public override async Task<Student> Get(int id)
        {
            return new Student
            {
                Name = "Nhan", Age = "29"
            };
        }
    }
}