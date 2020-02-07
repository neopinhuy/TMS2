using Microsoft.AspNetCore.Mvc;
using Nest;
using System.Threading.Tasks;
using TMS.API.Models;
using System.Linq;
using Microsoft.AspNet.OData.Query;

namespace TMS.API.Controllers
{
    public class GridPolicyController : GenericController<GridPolicy>
    {
        public GridPolicyController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }

        [HttpGet("api/[Controller]/GetByComponentGroupId/{id}")]
        public async Task<IActionResult> GetGridPolicyByComponentGroup(int id, ODataQueryOptions<GridPolicy> options)
        {
            var query =
                from cg in db.ComponentGroup
                join com in db.Component on cg.Id equals com.ComponentGroupId
                join feature in db.Feature on cg.FeatureId equals feature.Id
                join gridPolicy in db.GridPolicy on feature.Id equals gridPolicy.FeatureId
                where cg.Id == id && com.ComponentType == "GridView" && gridPolicy.EntityId == com.ReferenceId
                select gridPolicy;
            return await ApplyCustomQuery(options, query);
        }
    }
}
