using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class MasterDataController : GenericController<MasterData>
    {
        public MasterDataController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
