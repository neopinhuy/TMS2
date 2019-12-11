using Common.Extensions;
using Microsoft.AspNet.OData.Query;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Nest;
using System;
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

        [HttpGet("api/GetEnity/{entityId}/{targetId}")]
        public async Task<IActionResult> GetEnity(int entityId, int targetId)
        {
            var entity = await db.Entity.FindAsync(entityId);
            object res;
            switch (entity.Name)
            {
                case nameof(Vendor):
                    res = await db.Vendor.Select(x => new { x.Id, x.Name }).FirstOrDefaultAsync(x => x.Id == targetId);
                    break;
                case nameof(User):
                    res = await db.User.Select(x => new { x.Id, Name = x.FirstName + " " + x.LastName })
                        .FirstOrDefaultAsync(x => x.Id == targetId);
                    break;
                case nameof(Customer):
                    res = await db.Customer.Include(x => x.User)
                        .Select(x => new { x.Id, Name = x.User.FirstName + " " + x.User.LastName })
                        .FirstOrDefaultAsync(x => x.Id == targetId);
                    break;
                default:
                    throw new InvalidOperationException($"Entry {entity.Name} not supported");
            }
            return Ok(res);
        }
    }
}
