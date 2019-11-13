using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class ContainerTypeController : GenericController<ContainerType>
    {
        public ContainerTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
