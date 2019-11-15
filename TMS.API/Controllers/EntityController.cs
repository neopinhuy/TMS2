using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class EntityController : GenericController<Entity>
    {
        public EntityController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
