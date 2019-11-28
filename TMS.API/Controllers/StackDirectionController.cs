using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class StackDirectionController : GenericController<StackDirection>
    {
        public StackDirectionController(TMSContext context, IElasticClient client) 
            : base(context, client)
        {
        }
    }
}
