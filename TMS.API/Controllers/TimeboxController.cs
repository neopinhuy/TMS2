using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class TimeboxController : GenericController<Timebox>
    {
        public TimeboxController(TMSContext context, IElasticClient client) 
            : base(context, client)
        {
        }
    }
}
