using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class BankController : GenericController<Bank>
    {
        public BankController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
