using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class FreightStateController : GenericController<FreightState>
    {
        public FreightStateController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
