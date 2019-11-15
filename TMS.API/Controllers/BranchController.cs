using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class BranchController : GenericController<Branch>
    {
        public BranchController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
