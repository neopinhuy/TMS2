using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class ContractController : GenericController<Contract>
    {
        public ContractController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
