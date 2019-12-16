using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class UserController : GenericController<User>
    {
        public UserController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }

        [HttpGet("api/User/{groupName}")]
        public async Task<IActionResult> GetUserByGroup(string groupName, ODataQueryOptions<User> options)
        {
            var query =
                from groupRole in db.GroupRole
                join member in db.GroupMember on groupRole.Id equals member.GroupRoleId
                join role in db.Role on member.RoleId equals role.Id
                join user in db.User on role.Id equals user.RoleId
                where groupRole.Name == groupName
                select user;

            var appliedQuery = options.ApplyTo(query) as IQueryable<User>;
            var result = await appliedQuery.ToListAsync();
            return Ok(new OdataResult<User>
            {
                Value = result,
                odata = new Odata
                {
                    count = options.Count?.Value == true ? query.Count() : 0
                }
            });
        }
    }
}
