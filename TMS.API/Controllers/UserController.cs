using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Nest;
using System.Linq;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class UserController : GenericController<User>
    {
        public UserController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }

        [HttpGet("{groupName}")]
        [EnableQuery]
        public IQueryable<User> GetUserGroup(string groupName)
        {
            var query =
                from groupRole in db.GroupRole
                join member in db.GroupMember on groupRole.Id equals member.GroupRoleId
                join role in db.Role on member.RoleId equals role.Id
                join user in db.User on role.Id equals user.RoleId
                where groupRole.Name == groupName
                select user;

            return query;
        }
    }
}
