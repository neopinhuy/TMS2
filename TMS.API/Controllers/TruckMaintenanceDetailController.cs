using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;

namespace TMS.API.Controllers
{
    
    public class TruckMaintenanceDetailController : GenericController<TruckMaintenanceDetail>
    {
        public TruckMaintenanceDetailController(TMSContext context, IElasticClient client)
            : base(context, client)
        {
        }
    }
}
