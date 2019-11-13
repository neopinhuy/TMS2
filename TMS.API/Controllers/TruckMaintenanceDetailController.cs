using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    public class TruckMaintenanceDetailController : GenericController<TruckMaintenanceDetail>
    {
        public TruckMaintenanceDetailController(TMSContext context, IElasticClient client)
            : base(context, client)
        {
        }
    }
}
