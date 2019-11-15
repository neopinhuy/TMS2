using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class TruckController : GenericController<Truck>
    {
        public TruckController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
