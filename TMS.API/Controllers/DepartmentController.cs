using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class DepartmentController : GenericController<Department>
    {
        public DepartmentController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
