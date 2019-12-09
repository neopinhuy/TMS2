using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class FeaturePolicyController : GenericController<FeaturePolicy>
    {
        public FeaturePolicyController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
