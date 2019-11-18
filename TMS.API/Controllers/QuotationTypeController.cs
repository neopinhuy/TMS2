using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class PriceTypeController : GenericController<PriceType>
    {
        public PriceTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {

        }
    }
}
