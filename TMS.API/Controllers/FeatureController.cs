using Common.ViewModels;
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

        [HttpPut("api/[Controller]/update")]
        public async Task<ActionResult<Feature>> UpdateAsync([FromBody] FeatureVM entity)
        {
            UpdateFeatureChildren(entity);
            return await base.UpdateAsync(entity);
        }

        private void UpdateFeatureChildren(FeatureVM entity)
        {
            if (entity is null) return;
            UpdateChildren(entity.ComponentGroup);
            UpdateChildren(entity.Component);
            UpdateChildren(entity.GridPolicy);
        }

        [HttpPost("api/[Controller]/create")]
        public async Task<ActionResult<Feature>> CreateAsync([FromBody] FeatureVM entity)
        {
            UpdateFeatureChildren(entity);
            return await base.CreateAsync(entity);
        }
    }
}
