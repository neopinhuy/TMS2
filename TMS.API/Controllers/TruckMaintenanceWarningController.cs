using Microsoft.AspNetCore.Mvc;
using Nest;
using TMS.API.Models;


namespace TMS.API.Controllers
{
    public class TruckMaintenanceWarningController : GenericController<TruckMaintenanceWarning>
    {
        public TruckMaintenanceWarningController(TMSContext context, IElasticClient client) : base(context, client)
        {
        }
    }
}