using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class SurchargeController : GenericController<Surcharge>
    {
        public SurchargeController(TMSContext context, IElasticClient client) 
            : base(context, client)
        {
        }
    }
}
