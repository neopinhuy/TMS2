using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class CommodityTypeController : GenericController<CommodityType>
    {
        public CommodityTypeController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
