using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class RoleController : GenericController<Role>
    {
        public RoleController(TMSContext context, IElasticClient client) 
            : base(context, client)
        {
        }
    }
}
