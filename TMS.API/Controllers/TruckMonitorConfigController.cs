using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class TruckMonitorConfigController : GenericController<TruckMonitorConfig>
    {
        public TruckMonitorConfigController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}
