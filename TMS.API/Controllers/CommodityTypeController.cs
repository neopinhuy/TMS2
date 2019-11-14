using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class CommodityTypeController : GenericController<CommodityType>
    {
        public CommodityTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
