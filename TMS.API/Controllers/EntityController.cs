using Common.Consts;
using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Nest;
using System.Linq;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class EntityController : GenericController<Entity>
    {
        public EntityController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpGet("api/[Controller]/GetEnity/{entityId}")]
        public Task<IActionResult> GetEnity(int entityId, ODataQueryOptions<Entity> options)
        {
            var query =
                from entity in db.Entity
                from vendor in db.Vendor.Where(x => entity.Name == TargetConsts.VENDOR).DefaultIfEmpty()
                from user in db.User.Where(x => entity.Name == TargetConsts.USER).DefaultIfEmpty()
                from groupMember in db.GroupMember.Where(x => x.RoleId == user.RoleId).DefaultIfEmpty()
                from groupRole in db.GroupRole.Where(x => x.Id == groupMember.GroupRoleId && x.Name == "Internal").DefaultIfEmpty()
                from customer in db.Customer.Where(x => entity.Name == TargetConsts.CUSTOMER).DefaultIfEmpty()
                from user2 in db.User.Where(x => x.Id == customer.Id).DefaultIfEmpty()
                where entity.Id == entityId && (user == null || groupRole != null)
                select new Entity
                {
                    Id = entity.Name == TargetConsts.VENDOR ? vendor.Id : (entity.Name == TargetConsts.USER ? user.Id : user2.Id),
                    Name = entity.Name == TargetConsts.VENDOR ? vendor.Name : (entity.Name == TargetConsts.USER ? user.FullName : user2.FullName),
                    Active = entity.Name == TargetConsts.VENDOR ? vendor.Active : (entity.Name == TargetConsts.USER ? user.Active : user2.Active),
                    Description = entity.Name == TargetConsts.VENDOR ? vendor.Description : (entity.Name == TargetConsts.USER && user.DoB.HasValue
                        ? user.DoB.Value.ToString("dd/MM/yyyy") : user2.DoB.HasValue ? user2.DoB.Value.ToString("dd/MM/yyyy") : ""),
                };

            return ApplyCustomQuery(options, query);
        }
    }
}
