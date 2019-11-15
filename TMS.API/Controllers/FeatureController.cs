using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class FeatureController : GenericController<Feature>
    {
        public FeatureController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
