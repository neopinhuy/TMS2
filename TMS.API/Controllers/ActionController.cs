using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class ActionController : GenericController<Action>
    {
        public ActionController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
