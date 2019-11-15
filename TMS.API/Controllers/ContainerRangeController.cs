using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class ContainerRangeController : GenericController<ContainerRange>
    {
        public ContainerRangeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
