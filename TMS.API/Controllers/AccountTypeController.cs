using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class AccountTypeController : GenericController<AccountType>
    {
        public AccountTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
