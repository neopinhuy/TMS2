using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class TransitionActionController : GenericController<TransitionAction>
    {
        public TransitionActionController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
