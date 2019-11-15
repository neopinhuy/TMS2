using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class GroupMemberController : GenericController<GroupMember>
    {
        public GroupMemberController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
