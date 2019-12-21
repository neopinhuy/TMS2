using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class ComponentController : GenericController<Component>
    {
        public ComponentController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
