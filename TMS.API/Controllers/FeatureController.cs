using Microsoft.AspNetCore.Mvc;
using Nest;
using System.Threading.Tasks;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class FeatureController : GenericController<Feature>
    {
        public FeatureController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }

        public override async Task<ActionResult<Feature>> UpdateAsync([FromBody] Feature entity)
        {
            UpdateChildren(entity.ComponentGroup);
            return await base.UpdateAsync(entity);
        }
    }
}
