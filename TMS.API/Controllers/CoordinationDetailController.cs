using Microsoft.AspNetCore.Mvc;
using Nest;
using System.Threading.Tasks;
using TMS.API.Extensions;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class CoordinationDetailController : GenericController<CoordinationDetail>
    {
        public CoordinationDetailController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        public override async Task<ActionResult<CoordinationDetail>> UpdateAsync([FromBody] CoordinationDetail entity)
        {
            UpdateChildren<Surcharge>(entity);
            await base.UpdateAsync(entity);
            await db.UpdateCoorState(entity.CoordinationId);
            return Ok(entity);
        }
    }
}
