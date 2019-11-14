using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class TimeboxController : GenericController<Timebox>
    {
        public TimeboxController(TMSContext context, IElasticClient client) 
            : base(context, client)
        {
        }
    }
}
