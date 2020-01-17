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
            UpdateFeatureChildren(entity);
            return await base.UpdateAsync(entity);
        }

        private void UpdateFeatureChildren(Feature entity)
        {
            UpdateChildren(entity.ComponentGroup);
            UpdateChildren(entity.GridPolicy);
        }

        public override async Task<ActionResult<Feature>> CreateAsync([FromBody] Feature entity)
        {
            UpdateFeatureChildren(entity);
            return await base.CreateAsync(entity);
        }
    }
}
