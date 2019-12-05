using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Nest;
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
            var coor = entity.Coordination;
            entity.Coordination = null;
            UpdateChildren<Surcharge>(entity);
            await base.UpdateAsync(entity);
            entity.Coordination = coor;
            return Ok(entity);
        }
    }
}
