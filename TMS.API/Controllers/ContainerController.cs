using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class ContainerController : GenericController<Container>
    {
        public ContainerController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
