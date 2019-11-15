using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class GroupRoleController : GenericController<GroupRole>
    {
        public GroupRoleController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
