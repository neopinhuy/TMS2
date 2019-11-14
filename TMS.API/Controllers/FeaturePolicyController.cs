using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class FeaturePolicyController : GenericController<FeaturePolicy>
    {
        public FeaturePolicyController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
