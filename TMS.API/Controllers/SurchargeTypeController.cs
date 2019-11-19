using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class SurchargeTypeController : GenericController<SurchargeType>
    {
        public SurchargeTypeController(TMSContext context, IElasticClient client) 
            : base(context, client)
        {
        }
    }
}
