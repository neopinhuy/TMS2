using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    public class BankBranchController : GenericController<BankBranch>
    {
        public BankBranchController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
