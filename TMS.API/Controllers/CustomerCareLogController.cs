using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class CustomerCareLogController : GenericController<CustomerCareLog>
    {

        public CustomerCareLogController(TMSContext context, IElasticClient client)
            : base(context, client)
        {
        }
    }
}
