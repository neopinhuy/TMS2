using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class UoMController : GenericController<UoM>
    {
        public UoMController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
