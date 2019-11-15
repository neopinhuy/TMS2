using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class PolicyController : GenericController<Models.Policy>
    {
        public PolicyController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
