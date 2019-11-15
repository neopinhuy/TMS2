using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class CoordinationController : GenericController<Coordination>
    {
        public CoordinationController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
