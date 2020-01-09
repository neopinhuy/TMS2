using System.Threading.Tasks;
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

        public override Task<ActionResult<GroupRole>> UpdateAsync([FromBody] GroupRole entity)
        {
            UpdateChildren(entity.GroupMember);
            return base.UpdateAsync(entity);
        }

        public override Task<ActionResult<GroupRole>> CreateAsync([FromBody] GroupRole entity)
        {
            UpdateChildren(entity.GroupMember);
            return base.CreateAsync(entity);
        }
    }
}
