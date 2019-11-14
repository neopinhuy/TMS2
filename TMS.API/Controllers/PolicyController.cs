using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class PolicyController : GenericController<Models.Policy>
    {
        public PolicyController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
