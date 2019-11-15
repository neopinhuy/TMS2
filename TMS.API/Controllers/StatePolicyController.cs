using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class StatePolicyController : GenericController<StatePolicy>
    {
        public StatePolicyController(TMSContext context, IElasticClient client) 
            : base(context, client)
        {
        }
    }
}
