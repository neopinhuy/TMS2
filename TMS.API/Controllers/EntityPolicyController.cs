using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class EntityPolicyController : GenericController<EntityPolicy>
    {
        public EntityPolicyController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
