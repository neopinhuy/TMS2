using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class GridPolicyController : GenericController<GridPolicy>
    {
        public GridPolicyController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
